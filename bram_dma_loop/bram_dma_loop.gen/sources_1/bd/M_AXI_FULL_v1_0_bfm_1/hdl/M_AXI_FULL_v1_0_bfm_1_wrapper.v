//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Sun Jan  8 20:59:16 2023
//Host        : DESKTOP-Q1EFAHP running 64-bit major release  (build 9200)
//Command     : generate_target M_AXI_FULL_v1_0_bfm_1_wrapper.bd
//Design      : M_AXI_FULL_v1_0_bfm_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module M_AXI_FULL_v1_0_bfm_1_wrapper
   (ACLK,
    ARESETN,
    M00_AXI_ERROR,
    M00_AXI_INIT_AXI_TXN,
    M00_AXI_TXN_DONE);
  input ACLK;
  input ARESETN;
  output M00_AXI_ERROR;
  input M00_AXI_INIT_AXI_TXN;
  output M00_AXI_TXN_DONE;

  wire ACLK;
  wire ARESETN;
  wire M00_AXI_ERROR;
  wire M00_AXI_INIT_AXI_TXN;
  wire M00_AXI_TXN_DONE;

  M_AXI_FULL_v1_0_bfm_1 M_AXI_FULL_v1_0_bfm_1_i
       (.ACLK(ACLK),
        .ARESETN(ARESETN),
        .M00_AXI_ERROR(M00_AXI_ERROR),
        .M00_AXI_INIT_AXI_TXN(M00_AXI_INIT_AXI_TXN),
        .M00_AXI_TXN_DONE(M00_AXI_TXN_DONE));
endmodule
