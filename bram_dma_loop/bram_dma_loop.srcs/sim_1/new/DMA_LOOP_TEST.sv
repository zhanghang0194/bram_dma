`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/07 14:08:26
// Design Name: 
// Module Name: DMA_LOOP_TEST
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


module DMA_LOOP_TEST();
    parameter DATA_WIDTH = 32;
    parameter ADDR_WIDTH = 32;
    
    logic clk;
    logic clk_fast;
    logic rst_n;
    logic start_flag;
    reg[DATA_WIDTH -1 :0] data_out;
    
    
    initial begin
        clk = 0 ;
        clk_fast = 0 ;
        rst_n = 0 ;
        start_flag = 0 ;
        
        #100 rst_n = 1;
        
        
        #100 start_flag = 1 ;
        #15_000 start_flag = 0 ;
        
        #100 $finish;       
        
    end
    
    always #1 clk_fast = ~clk_fast;
    always #2 clk = ~clk;
    
    DMA_LOOP_wrapper u_DMA_LOOP_wrapper
    (
        .clk(clk),
        .clk_fast(clk_fast),
        .rst_n(rst_n),
        .start_flag(start_flag),
        .data_out(data_out)
    );
        
endmodule
