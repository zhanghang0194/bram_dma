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
    parameter DATA_WIDTH = 32               , //数据宽度
    parameter ADDR_WIDTH = 32                 //地址宽度
)
(
    input clk                               ,
    input rst_n                             ,
    input [DATA_WIDTH-1 :0] data_in         , //输入数据
    output [DATA_WIDTH-1 :0] data_out       , //输出数据
    input start_flag                        , //开始信号
    input done_flag                         , //结束信号
    
    input h_flag                            , //模拟行信号
    input v_flag                            , //模拟场信号
    //写BRAM通道
    output wr_clk                           , //写时钟
    output [ADDR_WIDTH-1 :0] wr_addr        , //写地址
    output wr_en                            , //写使能
    output [DATA_WIDTH-1 :0] wr_data        , //数据写入口
    output [DATA_WIDTH/8-1:0] wr_we         , //写有效字节数 = 数据宽度/8
    output wr_rst_n                         , //写BRAM复位信号
    
    //读BRAM通道
    output rd_clk                           , //读时钟
    output [ADDR_WIDTH-1 :0] rd_addr        , //读地址
    output rd_en                            , //读使能
    input [DATA_WIDTH-1 :0] rd_data         , //数据读出口
    output [DATA_WIDTH/8-1:0] rd_we         , //读有效字节数 = 数据宽度/8
    output rd_rst_n                           //读BRAM复位信号     
    );
    
    //parameter 定义
    parameter BRAM_DEPTH = 2**ADDR_WIDTH -1 ;

    
    //wire 定义
    
    //reg 定义
    reg [ADDR_WIDTH-1 :0] wr_addr_reg               ;
    reg [ADDR_WIDTH-1 :0] rd_addr_reg               ;
    

    //连线
    assign wr_rst = ~rst_n                          ; //bram的复位是高有效
    assign rd_rst = ~rst_n                          ; //bram的复位是高有效
    assign wr_we = 2**(DATA_WIDTH/8)-1              ; //32bit 4'b1111：15
    assign rd_we = 2**(DATA_WIDTH/8)-1              ; //32bit 4'b1111：15
    assign wr_clk = clk                             ;
    assign rd_clk = clk                             ;
    assign wr_en = start_flag && ~done_flag         ; //写使能逻辑
    assign rd_en = start_flag && ~done_flag         ; //读使能逻辑
    
    assign wr_data = data_in                        ; //写数据等于输入的用户数据
    assign data_out = rd_data                       ; //输出的用户数据等于读数据
    
    assign wr_addr = wr_addr_reg                    ;
    assign rd_addr = rd_addr_reg                    ;
    
    //********
    //写BRAM逻辑
    //********
    
    //1.写地址递增逻辑
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
    //读BRAM逻辑
    //********    
    
    //1.读地址递增逻辑
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
