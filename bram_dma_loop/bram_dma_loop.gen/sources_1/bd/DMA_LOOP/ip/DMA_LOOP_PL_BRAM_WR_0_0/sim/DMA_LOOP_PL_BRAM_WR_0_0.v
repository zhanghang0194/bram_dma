// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:PL_BRAM_WR:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module DMA_LOOP_PL_BRAM_WR_0_0 (
  clk,
  rst_n,
  data_in,
  data_out,
  start_flag,
  done_flag,
  h_flag,
  v_flag,
  wr_clk,
  wr_addr,
  wr_en,
  wr_data,
  wr_we,
  wr_rst_n,
  rd_clk,
  rd_addr,
  rd_en,
  rd_data,
  rd_we,
  rd_rst_n
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN DMA_LOOP_clk, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *)
input wire rst_n;
input wire [31 : 0] data_in;
output wire [31 : 0] data_out;
input wire start_flag;
input wire done_flag;
input wire h_flag;
input wire v_flag;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME wr_clk, ASSOCIATED_RESET wr_rst_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN DMA_LOOP_PL_BRAM_WR_0_0_wr_clk, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 wr_clk CLK" *)
output wire wr_clk;
output wire [31 : 0] wr_addr;
output wire wr_en;
output wire [31 : 0] wr_data;
output wire [3 : 0] wr_we;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME wr_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 wr_rst_n RST" *)
output wire wr_rst_n;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rd_clk, ASSOCIATED_RESET rd_rst_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN DMA_LOOP_PL_BRAM_WR_0_0_rd_clk, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 rd_clk CLK" *)
output wire rd_clk;
output wire [31 : 0] rd_addr;
output wire rd_en;
input wire [31 : 0] rd_data;
output wire [3 : 0] rd_we;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rd_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rd_rst_n RST" *)
output wire rd_rst_n;

  PL_BRAM_WR #(
    .DATA_WIDTH(32),
    .ADDR_WIDTH(32)
  ) inst (
    .clk(clk),
    .rst_n(rst_n),
    .data_in(data_in),
    .data_out(data_out),
    .start_flag(start_flag),
    .done_flag(done_flag),
    .h_flag(h_flag),
    .v_flag(v_flag),
    .wr_clk(wr_clk),
    .wr_addr(wr_addr),
    .wr_en(wr_en),
    .wr_data(wr_data),
    .wr_we(wr_we),
    .wr_rst_n(wr_rst_n),
    .rd_clk(rd_clk),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .rd_data(rd_data),
    .rd_we(rd_we),
    .rd_rst_n(rd_rst_n)
  );
endmodule