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
    parameter DATA_WIDTH = 8                 //���ݿ��
)
(
    input clk                               ,
    input rst_n                             ,
    input start_flag                        , //��ʼ�ź�
    output h_flag                           , //ģ�����ź�
    output v_flag                           , //ģ�ⳡ�ź�
    
    output done_flag                        , //�����ź�
    output [DATA_WIDTH-1 :0] data_out         //���ݳ���

    );
    parameter DATA_MAX = 2560;
    //wire ����
    
    //reg ����
    reg h_flag_reg                          ;
    reg v_flag_reg                          ; 
    reg [11:0] data_reg                     ; //�������ɼĴ���
    reg done_flag_reg                       ; //���ݴ�������ź�
    //����
    assign v_flag = v_flag_reg ;
    assign h_flag = h_flag_reg ;
    assign data_out = data_reg ;
    assign done_flag = done_flag_reg;
    
    //����������
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
                    if((data_reg != 0)&&(data_reg % 10 == 0))begin         //ÿ10������һ�����ź�
                       h_flag_reg <= 1'b1; 
                    end
                    if((data_reg != 0)&&(data_reg % 256 == 0))begin       //ÿ256������һ�����ź�
                       v_flag_reg <= 1'b1; 
                    end
                end
                else begin                              //ѭ��������start_flag_reg����
                    data_reg <= 1'b0;
                    done_flag_reg <= 1'b1;
                end
            end        
            else begin
            end
        end
    end
    
    
endmodule
