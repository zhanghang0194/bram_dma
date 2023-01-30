`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/07 11:28:38
// Design Name: 
// Module Name: PL_BRAM_WR
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


module PL_BRAM_WR#(
    parameter DATA_WIDTH = 32               , //���ݿ��
    parameter ADDR_WIDTH = 32                 //��ַ���
)
(
    input clk                               ,
    input rst_n                             ,
    input [DATA_WIDTH-1 :0] data_in         , //��������
    output [DATA_WIDTH-1 :0] data_out       , //�������
    input start_flag                        , //��ʼ�ź�
    input done_flag                         , //�����ź�
    
    input h_flag                            , //ģ�����ź�
    input v_flag                            , //ģ�ⳡ�ź�
    //дBRAMͨ��
    output wr_clk                           , //дʱ��
    output [ADDR_WIDTH-1 :0] wr_addr        , //д��ַ
    output wr_en                            , //дʹ��
    output [DATA_WIDTH-1 :0] wr_data        , //����д���
    output [DATA_WIDTH/8-1:0] wr_we         , //д��Ч�ֽ��� = ���ݿ��/8
    output wr_rst_n                         , //дBRAM��λ�ź�
    
    //��BRAMͨ��
    output rd_clk                           , //��ʱ��
    output [ADDR_WIDTH-1 :0] rd_addr        , //����ַ
    output rd_en                            , //��ʹ��
    input [DATA_WIDTH-1 :0] rd_data         , //���ݶ�����
    output [DATA_WIDTH/8-1:0] rd_we         , //����Ч�ֽ��� = ���ݿ��/8
    output rd_rst_n                           //��BRAM��λ�ź�     
    );
    
    //parameter ����
    parameter BRAM_DEPTH = 2**ADDR_WIDTH -1 ;

    
    //wire ����
    
    //reg ����
    reg [ADDR_WIDTH-1 :0] wr_addr_reg               ;
    reg [ADDR_WIDTH-1 :0] rd_addr_reg               ;
    

    //����
    assign wr_rst = ~rst_n                          ; //bram�ĸ�λ�Ǹ���Ч
    assign rd_rst = ~rst_n                          ; //bram�ĸ�λ�Ǹ���Ч
    assign wr_we = 2**(DATA_WIDTH/8)-1              ; //32bit 4'b1111��15
    assign rd_we = 2**(DATA_WIDTH/8)-1              ; //32bit 4'b1111��15
    assign wr_clk = clk                             ;
    assign rd_clk = clk                             ;
    assign wr_en = start_flag && ~done_flag         ; //дʹ���߼�
    assign rd_en = start_flag && ~done_flag         ; //��ʹ���߼�
    
    assign wr_data = data_in                        ; //д���ݵ���������û�����
    assign data_out = rd_data                       ; //������û����ݵ��ڶ�����
    
    assign wr_addr = wr_addr_reg                    ;
    assign rd_addr = rd_addr_reg                    ;
    
    //********
    //дBRAM�߼�
    //********
    
    //1.д��ַ�����߼�
    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            wr_addr_reg <= 'd0;
        end
        else if(start_flag && ~done_flag && wr_addr_reg < BRAM_DEPTH) begin
            wr_addr_reg <= wr_addr_reg + DATA_WIDTH/8;
        end
        else if(start_flag && ~done_flag && wr_addr_reg == BRAM_DEPTH) begin
            wr_addr_reg <= 'd0;
        end
        else begin
        end
    end
    
    //********
    //��BRAM�߼�
    //********    
    
    //1.����ַ�����߼�
    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            rd_addr_reg <= 'd0;
        end
        else if(start_flag && ~done_flag && rd_addr_reg < BRAM_DEPTH) begin
            rd_addr_reg <= rd_addr_reg + DATA_WIDTH/8;
        end
        else if(start_flag && ~done_flag && rd_addr_reg == BRAM_DEPTH) begin
            rd_addr_reg <= 'd0;
        end
        else begin
        end
    end

    
endmodule
