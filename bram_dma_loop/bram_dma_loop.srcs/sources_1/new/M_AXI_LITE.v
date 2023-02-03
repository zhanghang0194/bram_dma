`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/13 15:07:48
// Design Name: 
// Module Name: M_AXI_LITE
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module M_AXI_LITE #(

		// The master requires a target slave base address.
		parameter  C_M_TARGET_SLAVE_BASE_ADDR	= 16'h0000,
		// Width of M_AXI address bus. 
		parameter integer C_M_AXI_ADDR_WIDTH	= 10,
		// Width of M_AXI data bus. 
		parameter integer C_M_AXI_DATA_WIDTH	= 32,
		
		parameter BURST_LEN = 256
)
(
		// Users to add ports here
        input [15:0] data_size,
        input start_flag,
		// User ports ends
		// Do not modify the ports beyond this line


		// AXI clock signal
		input wire  M_AXI_ACLK,
		// AXI active low reset signal
		input wire  M_AXI_ARESETN,
		// Master Interface Write Address Channel ports. Write address (issued by master)
		output wire [C_M_AXI_ADDR_WIDTH-1 : 0] M_AXI_AWADDR,
		// Write channel Protection type.
    // This signal indicates the privilege and security level of the transaction,
    // and whether the transaction is a data access or an instruction access.
		output wire [2 : 0] M_AXI_AWPROT,
		// Write address valid. 
    // This signal indicates that the master signaling valid write address and control information.
		output wire  M_AXI_AWVALID,
		// Write address ready. 
    // This signal indicates that the slave is ready to accept an address and associated control signals.
		input wire  M_AXI_AWREADY,
		// Master Interface Write Data Channel ports. Write data (issued by master)
		output wire [C_M_AXI_DATA_WIDTH-1 : 0] M_AXI_WDATA,
		// Write strobes. 
    // This signal indicates which byte lanes hold valid data.
    // There is one write strobe bit for each eight bits of the write data bus.
		output wire [C_M_AXI_DATA_WIDTH/8-1 : 0] M_AXI_WSTRB,
		// Write valid. This signal indicates that valid write data and strobes are available.
		output wire  M_AXI_WVALID,
		// Write ready. This signal indicates that the slave can accept the write data.
		input wire  M_AXI_WREADY,
		// Master Interface Write Response Channel ports. 
    // This signal indicates the status of the write transaction.
		input wire [1 : 0] M_AXI_BRESP,
		// Write response valid. 
    // This signal indicates that the channel is signaling a valid write response
		input wire  M_AXI_BVALID,
		// Response ready. This signal indicates that the master can accept a write response.
		output wire  M_AXI_BREADY,
		// Master Interface Read Address Channel ports. Read address (issued by master)
		output wire [C_M_AXI_ADDR_WIDTH-1 : 0] M_AXI_ARADDR,
		// Protection type. 
    // This signal indicates the privilege and security level of the transaction, 
    // and whether the transaction is a data access or an instruction access.
		output wire [2 : 0] M_AXI_ARPROT,
		// Read address valid. 
    // This signal indicates that the channel is signaling valid read address and control information.
		output wire  M_AXI_ARVALID,
		// Read address ready. 
    // This signal indicates that the slave is ready to accept an address and associated control signals.
		input wire  M_AXI_ARREADY,
		// Master Interface Read Data Channel ports. Read data (issued by slave)
		input wire [C_M_AXI_DATA_WIDTH-1 : 0] M_AXI_RDATA,
		// Read response. This signal indicates the status of the read transfer.
		input wire [1 : 0] M_AXI_RRESP,
		// Read valid. This signal indicates that the channel is signaling the required read data.
		input wire  M_AXI_RVALID,
		// Read ready. This signal indicates that the master can accept the read data and response information.
		output wire  M_AXI_RREADY    
    );
    
	// Example State machine to initialize counter, initialize write transactions, 
	// initialize read transactions and comparison of read data with the 
	// written data words.
	parameter [1:0] IDLE = 2'b00, // This state initiates AXI4Lite transaction 
			// after the state machine changes state to INIT_WRITE   
			// when there is 0 to 1 transition on INIT_AXI_TXN
		INIT_WRITE   = 2'b01; // This state initializes write transaction,
			// once writes are done, the state machine 
			// changes state to INIT_READ 
    
    // function called clogb2 that returns an integer which has the
	// value of the ceiling of the log base 2

	 function integer clogb2 (input integer bit_depth);
		 begin
		 for(clogb2=0; bit_depth>0; clogb2=clogb2+1)
			 bit_depth = bit_depth >> 1;
		 end
	 endfunction
	 
	reg [1:0] mst_exec_state; 
	// AXI4LITE signals
	//write address valid
	reg  	axi_awvalid;
	//write data valid
	reg  	axi_wvalid;
	//read address valid
	reg  	axi_arvalid;
	//read data acceptance
	reg  	axi_rready;
	//write response acceptance
	reg  	axi_bready;
	//write address
	reg [C_M_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	//write data
	reg [C_M_AXI_DATA_WIDTH-1 : 0] 	axi_wdata;
	//read addresss
	reg [C_M_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	//Asserts when there is a write response error
	wire  	write_resp_error;
	//Asserts when there is a read response error
	wire  	read_resp_error;
	//A pulse to initiate a write transaction
	wire  	start_single_write;
	//A pulse to initiate a read transaction
	reg  	start_single_read;
	//Asserts when a single beat write transaction is issued and remains asserted till the completion of write trasaction.
	reg  	write_issued;
	//Asserts when a single beat read transaction is issued and remains asserted till the completion of read trasaction.
	reg  	read_issued;
	//flag that marks the completion of write trasactions. The number of write transaction is user selected by the parameter C_M_TRANSACTIONS_NUM.
	reg  	writes_done;
	//flag that marks the completion of read trasactions. The number of read transaction is user selected by the parameter C_M_TRANSACTIONS_NUM
	reg  	reads_done;
	//The error register is asserted when any of the write response error, read response error or the data mismatch flags are asserted.
	reg  	error_reg;
	//index counter to track the number of write transaction issued
	reg [1 : 0] 	write_index;
	//index counter to track the number of read transaction issued
	reg [1 : 0] 	read_index;
    
    reg [7:0]   read_cnt ;
    reg [7:0]   write_cnt ; 
	//Flag is asserted when the write index reaches the last write transction number
	wire  	last_write;
	//Flag is asserted when the read index reaches the last read transction number
	reg  	last_read;
	reg  	init_txn_ff;
	reg  	init_txn_ff2;
	reg  	init_txn_edge;
	wire  	init_txn_pulse;
 
 
 	// I/O Connections assignments

	//Adding the offset address to the base addr of the slave
	assign M_AXI_AWADDR	= C_M_TARGET_SLAVE_BASE_ADDR + axi_awaddr;
	//AXI 4 write data
	assign M_AXI_WDATA	= axi_wdata;
	assign M_AXI_AWPROT	= 3'b000;
	assign M_AXI_AWVALID	= axi_awvalid;
	//Write Data(W)
	assign M_AXI_WVALID	= axi_wvalid;
	//Set all byte strobes in this example
	assign M_AXI_WSTRB	= 4'b1111;
    
    assign start_single_write = init_txn_ff2 && ~last_write ;
	   
 	//Generate a pulse to initiate AXI transaction.
	always @(posedge M_AXI_ACLK)										      
	  begin                                                                        
	    // Initiates AXI transaction delay    
	    if (M_AXI_ARESETN == 0 )                                                   
	      begin                                                                    
	        init_txn_ff <= 1'b0;                                                   
	        init_txn_ff2 <= 1'b0;                                                   
	      end                                                                               
	    else                                                                       
	      begin  
	        init_txn_ff <= start_flag;
	        init_txn_ff2 <= init_txn_ff;                                                                 
	      end                                                                      
	  end      
    assign init_txn_pulse	= (!init_txn_ff2) && init_txn_ff ;
    
    
    always @(posedge M_AXI_ACLK)
    begin
        if (M_AXI_ARESETN == 0)                                                   
	      begin                                                                    
	        read_cnt <= 1'b0;                                                   
	      end
	    else if (init_txn_ff)begin
	       read_cnt <= read_cnt + 1'b1;
	    end
	    else if (read_cnt == 63)begin
	       read_cnt <= 1'b0;
	    end
    end
    
	  always @(posedge M_AXI_ACLK)										      
	  begin                                                                        
	    //Only VALID signals must be deasserted during reset per AXI spec          
	    //Consider inverting then registering active-low reset for higher fmax     
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)                                                   
	      begin                                                                    
	        axi_awvalid <= 1'b0;                                                   
	      end                                                                      
	      //Signal a new address/data command is available by user logic           
	    else                                                                       
	      begin                                                                    
	        if (start_single_write)                                                
	          begin                                                                
	            axi_awvalid <= 1'b1;                                               
	          end                                                                  
	     //Address accepted by interconnect/slave (issue of M_AXI_AWREADY by slave)
	        else if (M_AXI_AWREADY && axi_awvalid)                                 
	          begin                                                                
	            axi_awvalid <= 1'b0;                                               
	          end                                                                  
	      end                                                                      
	  end   

	  // start_single_write triggers a new write                                   
	  // transaction. write_index is a counter to                                  
	  // keep track with number of write transaction                               
	  // issued/initiated                                                          
	  always @(posedge M_AXI_ACLK)                                                 
	  begin                                                                        
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)                                                   
	      begin                                                                    
	        write_index <= 0;                                                      
	      end                                                                      
	      // Signals a new write address/ write data is                            
	      // available by user logic                                               
	    else if (start_single_write && M_AXI_WREADY && axi_wvalid)                                               
	      begin                                                                    
	        write_index <= write_index + 1;                                        
	      end                                                                      
	  end 	  
	  
	  assign last_write = (write_index == 2);
	  //Check for last write completion.                                                
	                                                                                    
	  //This logic is to qualify the last write count with the final write              
	  //response. This demonstrates how to confirm that a write has been                
	  //committed.                                                                      
	                                                                                    
	  always @(posedge M_AXI_ACLK)                                                      
	  begin                                                                             
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)                                                         
	      writes_done <= 1'b0;                                                          
	                                                                                    
	      //The writes_done should be associated with a bready response                 
	    else if (last_write)                              
	      writes_done <= 1'b1;                                                          
	    else                                                                            
	      writes_done <= writes_done;                                                   
	  end
 	//--------------------
	//Write Data Channel
	//--------------------

	//The write data channel is for transfering the actual data.
	//The data generation is speific to the example design, and 
	//so only the WVALID/WREADY handshake is shown here

	   always @(posedge M_AXI_ACLK)                                        
	   begin                                                                         
	     if (M_AXI_ARESETN == 0  || init_txn_pulse == 1'b1)                                                    
	       begin                                                                     
	         axi_wvalid <= 1'b0;                                                     
	       end                                                                       
	     //Signal a new address/data command is available by user logic              
	     else if (M_AXI_WREADY && axi_wvalid)                                                
	       begin                                                                     
	         axi_wvalid <= 1'b0;                                                     
	       end                                                                       
	     //Data accepted by interconnect/slave (issue of M_AXI_WREADY by slave)      
	     else if (start_single_write)                                        
	       begin                                                                     
	        axi_wvalid <= 1'b1;                                                      
	       end                                                                       
	   end       


	  reg [C_M_AXI_ADDR_WIDTH-1:0]addr_reg[2:0];
	  //初始化寄存器
	  always @(posedge M_AXI_ACLK)
	      begin                                                     
	        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 )                                
	          begin                                                 
	            addr_reg[0] <= 'h0;
	            addr_reg[1] <= 'h0;
	            addr_reg[2] <= 'h0;                  
	          end                                                   
	        // Signals a new write address/ write data is           
	        // available by user logic                              
	        else
	          begin
	            addr_reg[0] <= 'h30;                 // S2MM DMA 控制寄存器
	            addr_reg[1] <= 'h48;                 // S2MM地址寄存器低32BIT
	            addr_reg[2] <= 'h58;                 // S2MM缓存长度
	          end    
	      end
	//--------------------------------

	//Address/Data Stimulus

	//Address/data pairs for this example. The read and write values should
	//match.
	//Modify these as desired for different address patterns.

	  //Write Addresses   
	                                       
	  always @(posedge M_AXI_ACLK)                                  
	      begin                                                     
	        if (M_AXI_ARESETN == 0  || init_txn_pulse == 1'b1)                                
	          begin                                                 
	            axi_awaddr <= addr_reg[write_index];                                                  
	          end                                                   
	          // Signals a new write address/ write data is         
	          // available by user logic                            
	        else if (M_AXI_AWREADY && axi_awvalid)                  
	          begin
	           axi_awaddr <= addr_reg[write_index];                      
	          end                                                   
	      end                                                       
	  
      //初始化寄存器
	  reg [31:0]cmd_reg[2:0];    
	  always @(posedge M_AXI_ACLK)
	      begin                                                     
	        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 )                                
	          begin                                                 
	            cmd_reg[0] <= 32'h0;                       //停止传输
	            cmd_reg[1] <= 32'h0;                       //固定地址
	            cmd_reg[2] <= 'd256;                   //突发长度  
	          end                                                   
	        // Signals a new write address/ write data is           
	        // available by user logic                              
	        else
	          begin
	           if(init_txn_ff)cmd_reg[0] <= 32'd1;         // 开始传输
	           else    cmd_reg[0] <= 32'd0;               // 停止传输,复位
	           cmd_reg[1] <= 32'd0;                       // 固定地址（后续改为递增）
	           cmd_reg[2] <= 'd256;                     // 长度256（以字节为单位）
	          end    
	      end  
	                                                       
        	                                                           
	  // Write data generation                                      
	  always @(posedge M_AXI_ACLK)                                  
	      begin                                                     
	        if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 )                                
	          begin                                                 
	            axi_wdata <= cmd_reg[write_index];                       
	          end                                                   
	        // Signals a new write address/ write data is           
	        // available by user logic                              
	        else if (M_AXI_WREADY && axi_wvalid)                    
	          begin                                                 
	            axi_wdata <= cmd_reg[write_index];
	          end                                                   
	      end          	        
	         
endmodule
