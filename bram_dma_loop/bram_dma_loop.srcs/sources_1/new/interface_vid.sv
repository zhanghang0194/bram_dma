`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/13 14:49:53
// Design Name: 
// Module Name: interface_vid
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


interface interface_vid(input vid_clk);
    logic vid_rst_n             ;
    logic vid_de                ;
    logic vid_hs                ;
    logic vid_vs                ;
    logic [23:0] vid_data       ;

    modport A(
        input vid_rst_n         ,
        output vid_de           ,
        output vid_hs           ,
        output vid_vs           ,
        output vid_data
    );

    modport B(
        input vid_rst_n         ,
        input vid_de            ,
        input vid_hs            ,
        input vid_vs            ,
        input vid_data
    );
    
endinterface
