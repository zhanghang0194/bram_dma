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
    input start                         , //����burst����
    output done                         , //burst�������
    
    input [DATA_WIDTH-1 :0] data_in     ,
 
    //AXI д��ַͨ��
    output [M_AXI_ADDR_WIDTH-1:0]m_axi_awaddr           , //д��ַ��һ��ͻ��������׵�ַ
    output [7:0]m_axi_awlen                             , //����ͻ�����ȣ�֧��1~256�δ���
    output [2:0]m_axi_awsize                            , //дͻ����С��ÿ��ͻ��������ֽ���֧��
    output [1:0]m_axi_awburst                           , 
    //ͻ�����ͣ�2`b00 FIXED��ͻ�������е�ַ�̶�������FIFO����
    //         2`b01 INCR: ����ͻ������������У���ַ������������ȡ����AWSIZE
    //         2`b10 WRAP���ػ�ͻ����������ͻ�����ƣ��������ض��ߵ�ַ�ı߽紦
    //         �ص��͵�ַ�����ػ��߽���ڣ�AWSIZE*AWLEN��
    output m_axi_awlock                                 , //�������źţ����ṩ������ԭ���ԣ�����
    output [3:0]m_axi_awcache                           , //�ڴ����ͣ�����һ�δ���������ͨ��ϵͳ��
    output [2:0]m_axi_awprot                            , //�������ͣ�����һ�δ������Ȩ������ȫ�ȼ�
    output m_axi_awvalid                                , //��Ч�źţ���ʾ��ַ�����ź���Ч
    input m_axi_awready                                 , //�������ӡ����Խ��յ���ַ�Ͷ�Ӧ�Ŀ����ź�
    
    //AXI д����ͨ�� 
    output [DATA_WIDTH-1:0] m_axi_wdata                 , //д����
    output [DATA_WIDTH/8-1:0]m_axi_wstrb                , //�ֽ�λ��Ч��־
    output m_axi_wlast                                  , //�����˴δ��������һ��ͻ������
    output m_axi_wvalid                                 , //д��Ч �������˴�д��Ч
    input m_axi_wready                                  , //�����ӻ����Խ���д����
    
    //AXI д��Ӧͨ��
    input [1:0]m_axi_bresp              , //д��Ӧ�����������״̬
    input m_axi_bvalid                  , //д��Ӧ��Ч
    output m_axi_bready                 , //���������ܹ�����д��Ӧ
    
    //AXI ����ַͨ��
    output [14:0]m_axi_araddr           , //��ͬ������Ӧ�ź�
    output [7:0]m_axi_arlen             ,
    output [3:0]m_axi_arsize            ,
    output [1:0]m_axi_arburst           ,
    output m_axi_arlock                 ,
    output [3:0]m_axi_arcache           ,
    output [2:0]m_axi_arprot            ,
    output m_axi_arvalid                ,   
    input m_axi_arready                 ,
    
    //AXI ������ͨ��
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
    
    //��������
    parameter Burst_Size_Bytes = Burst_Len * M_AXI_DATA_WIDTH/8 ; //ͻ������ĵ�ַƫ����
    assign m_axi_awlen = 8'b1111_1111                           ; //8'b11111111  : 256
    assign m_axi_awsize = 3'b011                                ; //3'b011 : 32bit 4�ֽ�
    assign m_axi_awburst = 2'b01                                ; // INCR����
    assign m_axi_awlock = 1'b0                                  ; //������
    assign m_axi_awcache = 4'b0000                              ; //Device Non-bufferable
    assign m_axi_awprot = 3'b000                                ; //???
    assign m_axi_wstrb = {(M_AXI_DATA_WIDTH/8){1'b1}}           ; //4'b1111 ��4�ֽ�ȫ��Ч
    //wire����
    
    //reg����
    reg start_reg1;
    reg start_reg2;
    reg start_pos;
    
    reg m_axi_awvalid_reg ;
    reg [14:0] m_axi_awaddr_reg ;
    reg m_axi_wvalid_reg ;
    //����
    assign m_axi_awvalid = m_axi_awvalid_reg ;
    assign m_axi_awaddr = m_axi_awaddr_reg ;
    assign m_axi_wvalid = m_axi_wvalid_reg ;
    
    
    
    //��׽start�ź�������
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
    //д��ַ���߼� ÿ��Burst����ʱ��addr����һ��
    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            m_axi_awaddr_reg <= 'd0;
        end
        else if(m_axi_awvalid && m_axi_awready) begin
            m_axi_awaddr_reg <= m_axi_awaddr_reg + Burst_Size_Bytes ;
        end
    end
    
    //дvalid���߼���ÿ�β�׽��start�����أ�ִ��һ��ͻ��
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
    reg [7:0] Burst_cnt; //����������
    
    assign m_axi_wlast = (m_axi_wvalid & m_axi_wready & (Burst_cnt == Burst_Size_Bytes-1))      ;
    assign done = m_axi_wlast                                                                   ; 
    assign m_axi_wdata = {(DATA_WIDTH/8){data_in[7:0]}}                                         ; //��32bit ÿһ�ֽ�λ��������
    //д���ݵ��߼�
    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            state <= IDLE ;
            Burst_cnt <= 'd0;
            m_axi_wvalid_reg <= 1'b0;
        end
        else begin
            case(state)
                IDLE:
               //��ʼ״̬���ȴ�start�źŴ��� 
                    if(m_axi_awvalid & m_axi_awready) begin
                        state <= WRITE ;
                    end
                WRITE:
                //д��״̬������Burst�ε�д����
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
