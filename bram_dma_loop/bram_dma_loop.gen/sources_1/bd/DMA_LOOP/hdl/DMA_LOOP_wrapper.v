//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Fri Feb  3 17:46:35 2023
//Host        : DESKTOP-Q1EFAHP running 64-bit major release  (build 9200)
//Command     : generate_target DMA_LOOP_wrapper.bd
//Design      : DMA_LOOP_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module DMA_LOOP_wrapper
   (clk,
    clk_fast,
    data_out,
    rst_n,
    start_flag);
  input clk;
  input clk_fast;
  output [31:0]data_out;
  input rst_n;
  input start_flag;

  wire clk;
  wire clk_fast;
  wire [31:0]data_out;
  wire rst_n;
  wire start_flag;

  DMA_LOOP DMA_LOOP_i
       (.clk(clk),
        .clk_fast(clk_fast),
        .data_out(data_out),
        .rst_n(rst_n),
        .start_flag(start_flag));
endmodule
