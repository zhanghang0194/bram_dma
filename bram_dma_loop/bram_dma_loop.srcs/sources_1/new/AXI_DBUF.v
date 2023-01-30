`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/07 21:22:56
// Design Name: 
// Module Name: AXI_DBUF
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


module AXI_DBUF#(
    parameter DATA_WIDTH = 32                   ,
    parameter FIFO_DEPTH = 2048                 ,
    
    parameter SLAVE_BASE_ADDR = 16'h0x0000      ,
    parameter M_AXI_DATA_WIDTH = 32             ,
    parameter M_AXI_ADDR_WIDTH = 15             ,
    parameter Burst_ID_WIDTH = 1                ,
    parameter Burst_Len = 256                    
    
)
(
    input clk                           ,
    input rst_n                         ,
    input h_flag                        ,
    input v_flag                        ,
    input start                         , //启动burst传输
    output done                         , //burst传输结束
    
    input [DATA_WIDTH-1 :0] data_in     ,
 
    //AXI 写地址通道
    output [M_AXI_ADDR_WIDTH-1:0]m_axi_awaddr           , //写地址，一次突发传输的首地址
    output [7:0]m_axi_awlen                             , //决定突发长度，支持1~256次传输
    output [2:0]m_axi_awsize                            , //写突发大小，每次突发传输的字节数支持
    output [1:0]m_axi_awburst                           , 
    //突发类型：2`b00 FIXED：突发过程中地址固定，用于FIFO访问
    //         2`b01 INCR: 增量突发，传输过程中，地址递增。增加量取决于AWSIZE
    //         2`b10 WRAP：回环突发，和增量突发类似，但会在特定高地址的边界处
    //         回到低地址处。回环边界等于（AWSIZE*AWLEN）
    output m_axi_awlock                                 , //总线锁信号，可提供操作的原子性？？？
    output [3:0]m_axi_awcache                           , //内存类型，表明一次传输是怎样通过系统的
    output [2:0]m_axi_awprot                            , //保护类型，表明一次传输的特权级及安全等级
    output m_axi_awvalid                                , //有效信号，表示地址控制信号有效
    input m_axi_awready                                 , //表明“从”可以接收到地址和对应的控制信号
    
    //AXI 写数据通道 
    output [DATA_WIDTH-1:0] m_axi_wdata                 , //写数据
    output [DATA_WIDTH/8-1:0]m_axi_wstrb                , //字节位有效标志
    output m_axi_wlast                                  , //表明此次传输是最后一个突发传输
    output m_axi_wvalid                                 , //写有效 ，表明此次写有效
    input m_axi_wready                                  , //表明从机可以接收写数据
    
    //AXI 写响应通道
    input [1:0]m_axi_bresp              , //写响应，表明传输的状态
    input m_axi_bvalid                  , //写响应有效
    output m_axi_bready                 , //表明主机能够接收写响应
    
    //AXI 读地址通道
    output [14:0]m_axi_araddr           , //等同上述对应信号
    output [7:0]m_axi_arlen             ,
    output [3:0]m_axi_arsize            ,
    output [1:0]m_axi_arburst           ,
    output m_axi_arlock                 ,
    output [3:0]m_axi_arcache           ,
    output [2:0]m_axi_arprot            ,
    output m_axi_arvalid                ,   
    input m_axi_arready                 ,
    
    //AXI 读数据通道
    input [31:0]m_axi_rdata             ,
    input [1:0]m_axi_rresp              ,
    input m_axi_rlast                   ,
    input m_axi_rvalid                  ,
    output m_axi_rready                 
    );
    
    	// function called clogb2 that returns an integer which has the
	//value of the ceiling of the log base 2

	  // function called clogb2 that returns an integer which has the 
	  // value of the ceiling of the log base 2.                      
	  function integer clogb2 (input integer bit_depth);              
	  begin                                                           
	    for(clogb2 = 0 ; bit_depth > 0 ; clogb2 = clogb2+1 )                   
	      bit_depth = bit_depth >> 1;                                 
	    end                                                           
	  endfunction 
    
    //参数定义
    parameter Burst_Size_Bytes = Burst_Len * M_AXI_DATA_WIDTH/8 ; //突发传输的地址偏移量
    assign m_axi_awlen = 8'b1111_1111                           ; //8'b11111111  : 256
    assign m_axi_awsize = 3'b011                                ; //3'b011 : 32bit 4字节
    assign m_axi_awburst = 2'b01                                ; // INCR类型
    assign m_axi_awlock = 1'b0                                  ; //？？？
    assign m_axi_awcache = 4'b0000                              ; //Device Non-bufferable
    assign m_axi_awprot = 3'b000                                ; //???
    assign m_axi_wstrb = {(M_AXI_DATA_WIDTH/8){1'b1}}           ; //4'b1111 ：4字节全有效
    //wire定义
    
    //reg定义
    reg start_reg1;
    reg start_reg2;
    reg start_pos;
    
    reg m_axi_awvalid_reg ;
    reg [14:0] m_axi_awaddr_reg ;
    reg m_axi_wvalid_reg ;
    //连线
    assign m_axi_awvalid = m_axi_awvalid_reg ;
    assign m_axi_awaddr = m_axi_awaddr_reg ;
    assign m_axi_wvalid = m_axi_wvalid_reg ;
    
    
    
    //捕捉start信号上升沿
    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            start_reg1 <= 1'b0;
            start_reg2 <= 1'b0;
        end
        else begin
            start_reg1 <= start ;
            start_reg2 <= start_reg1 ;
        end
    end
    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            start_pos <= 1'b0;
        end
        else if (start_reg1 & ~start_reg2)begin
            start_pos <= 1'b1;
        end    
        else begin
            start_pos <= 1'b0;
        end
    end
    //写地址的逻辑 每次Burst传输时，addr递增一次
    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            m_axi_awaddr_reg <= 'd0;
        end
        else if(m_axi_awvalid && m_axi_awready) begin
            m_axi_awaddr_reg <= m_axi_awaddr_reg + Burst_Size_Bytes ;
        end
    end
    
    //写valid的逻辑，每次捕捉到start上升沿，执行一次突发
    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            m_axi_awvalid_reg <= 1'b0;
        end
        else if(~m_axi_awvalid & start_pos)begin
            m_axi_awvalid_reg <= 1'b1;
        end
        else if (m_axi_awvalid & m_axi_awready)begin
            m_axi_awvalid_reg <= 1'b0;
        end
        else begin
        end
    end
    
    
    
    parameter IDLE = 0 ;
    parameter WRITE = 1 ;
    
    reg [1:0] state;
    reg [7:0] Burst_cnt; //参数化配置
    
    assign m_axi_wlast = (m_axi_wvalid & m_axi_wready & (Burst_cnt == Burst_Size_Bytes-1))      ;
    assign done = m_axi_wlast                                                                   ; 
    assign m_axi_wdata = {(DATA_WIDTH/8){data_in[7:0]}}                                         ; //让32bit 每一字节位都有数据
    //写数据的逻辑
    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            state <= IDLE ;
            Burst_cnt <= 'd0;
            m_axi_wvalid_reg <= 1'b0;
        end
        else begin
            case(state)
                IDLE:
               //初始状态，等待start信号触发 
                    if(m_axi_awvalid & m_axi_awready) begin
                        state <= WRITE ;
                    end
                WRITE:
                //写入状态，进行Burst次的写操作
                    if(Burst_cnt == Burst_Len) begin
                        state <= IDLE ;
                        Burst_cnt <= 'd0;                        
                    end
                    else begin
                        if(~m_axi_wvalid)
                            m_axi_wvalid_reg <= 1'b1;
                        else if(m_axi_wvalid_reg & m_axi_wready) begin
                            m_axi_wvalid_reg <= 1'b0;
                            Burst_cnt <= Burst_cnt + 1'b1;
                        end
                    end
                
                default:
                    state <= IDLE ;
            endcase
        end

    end
    
    
    
endmodule
