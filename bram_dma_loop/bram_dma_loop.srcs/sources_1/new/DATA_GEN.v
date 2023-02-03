`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/07 11:28:38
// Design Name: 
// Module Name: DATA_GEN
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


module DATA_GEN#(
    parameter DATA_WIDTH = 8                 //数据宽度
)
(
    input clk                               ,
    input rst_n                             ,
    input start_flag                        , //开始信号
    output h_flag                           , //模拟行信号
    output v_flag                           , //模拟场信号
    
    output done_flag                        , //结束信号
    output [DATA_WIDTH-1 :0] data_out         //数据出口

    );
    parameter DATA_MAX = 2560;
    //wire 定义
    
    //reg 定义
    reg h_flag_reg                          ;
    reg v_flag_reg                          ; 
    reg [11:0] data_reg                     ; //数据生成寄存器
    reg done_flag_reg                       ; //数据传输结束信号
    //连线
    assign v_flag = v_flag_reg ;
    assign h_flag = h_flag_reg ;
    assign data_out = data_reg ;
    assign done_flag = done_flag_reg;
    
    //数据生成器
    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            data_reg <= 'd0 ;
            h_flag_reg <= 1'b0 ;
            v_flag_reg <= 1'b0 ;
            done_flag_reg <= 1'b0;
        end
        else begin
            if(start_flag)begin
                if(data_reg < DATA_MAX)begin
                    done_flag_reg <= 1'b0;
                    data_reg <= data_reg + 1'b1 ;
                    h_flag_reg <= 1'b0;
                    v_flag_reg <= 1'b0;
                    if((data_reg != 0)&&(data_reg % 10 == 0))begin         //每10个数出一个行信号
                       h_flag_reg <= 1'b1; 
                    end
                    if((data_reg != 0)&&(data_reg % 256 == 0))begin       //每256个数出一个场信号
                       v_flag_reg <= 1'b1; 
                    end
                end
                else begin                              //循环结束，start_flag_reg置零
                    data_reg <= 1'b0;
                    done_flag_reg <= 1'b1;
                end
            end        
            else begin
            end
        end
    end
    
    
endmodule
