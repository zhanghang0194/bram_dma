`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/12 08:56:49
// Design Name: 
// Module Name: RGB565_888
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


module RGB565_888(
    input pclk              ,
    input rst_n             ,
    input h_flag_i          ,
    input v_flag_i          ,
    input [7:0] data_i      ,
    input start_flag        ,
    
    output data_en          ,
    output h_flag_o         ,
    output v_flag_o         ,
    output [23:0] data_o    
    );
    //参数定义
    
    //连线
    assign h_flag_o = h_flag_i                  ;
    assign v_flag_o = v_flag_i                  ;
    assign data_en = (cnt == 1) &  start_flag   ;
    assign data_o = data_o_reg                  ;
    
    //reg定义
    reg  cnt                    ; // 8转16计数器 8bit -> 565：16bit
    reg [7:0] data_reg1         ;
    reg [23:0] data_o_reg       ;
    //wire定义
    
    
    always @(posedge pclk or negedge rst_n) begin
        if(!rst_n) begin
            data_reg1 <= 8'd0 ;
            data_o_reg <= 24'd0;
            cnt <= 1'b0;
        end
        else if (start_flag && (cnt<1) ) begin
            cnt <= cnt + 1;
            data_reg1 <= data_i ;
        end
        else if (cnt == 1) begin
            cnt <= 0 ;
            data_o_reg <= {data_reg1[7:3],3'b000,   data_reg1[2:0],data_i[7:5],2'b00,   data_i[4:0],3'b000} ; 
            //                  R,000 ;                         G,00 ;                          B,000 ;
        end
    end
endmodule
