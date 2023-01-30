//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Sun Jan  8 20:59:16 2023
//Host        : DESKTOP-Q1EFAHP running 64-bit major release  (build 9200)
//Command     : generate_target M_AXI_FULL_v1_0_bfm_1.bd
//Design      : M_AXI_FULL_v1_0_bfm_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "M_AXI_FULL_v1_0_bfm_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=M_AXI_FULL_v1_0_bfm_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "M_AXI_FULL_v1_0_bfm_1.hwdef" *) 
module M_AXI_FULL_v1_0_bfm_1
   (ACLK,
    ARESETN,
    M00_AXI_ERROR,
    M00_AXI_INIT_AXI_TXN,
    M00_AXI_TXN_DONE);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK, ASSOCIATED_RESET ARESETN, CLK_DOMAIN M_AXI_FULL_v1_0_bfm_1_ACLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input ACLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input ARESETN;
  output M00_AXI_ERROR;
  input M00_AXI_INIT_AXI_TXN;
  output M00_AXI_TXN_DONE;

  wire [31:0]M_AXI_FULL_0_M00_AXI_ARADDR;
  wire [1:0]M_AXI_FULL_0_M00_AXI_ARBURST;
  wire [3:0]M_AXI_FULL_0_M00_AXI_ARCACHE;
  wire [0:0]M_AXI_FULL_0_M00_AXI_ARID;
  wire [7:0]M_AXI_FULL_0_M00_AXI_ARLEN;
  wire M_AXI_FULL_0_M00_AXI_ARLOCK;
  wire [2:0]M_AXI_FULL_0_M00_AXI_ARPROT;
  wire [3:0]M_AXI_FULL_0_M00_AXI_ARQOS;
  wire M_AXI_FULL_0_M00_AXI_ARREADY;
  wire [0:0]M_AXI_FULL_0_M00_AXI_ARUSER;
  wire M_AXI_FULL_0_M00_AXI_ARVALID;
  wire [31:0]M_AXI_FULL_0_M00_AXI_AWADDR;
  wire [1:0]M_AXI_FULL_0_M00_AXI_AWBURST;
  wire [3:0]M_AXI_FULL_0_M00_AXI_AWCACHE;
  wire [0:0]M_AXI_FULL_0_M00_AXI_AWID;
  wire [7:0]M_AXI_FULL_0_M00_AXI_AWLEN;
  wire M_AXI_FULL_0_M00_AXI_AWLOCK;
  wire [2:0]M_AXI_FULL_0_M00_AXI_AWPROT;
  wire [3:0]M_AXI_FULL_0_M00_AXI_AWQOS;
  wire M_AXI_FULL_0_M00_AXI_AWREADY;
  wire [0:0]M_AXI_FULL_0_M00_AXI_AWUSER;
  wire M_AXI_FULL_0_M00_AXI_AWVALID;
  wire [0:0]M_AXI_FULL_0_M00_AXI_BID;
  wire M_AXI_FULL_0_M00_AXI_BREADY;
  wire [1:0]M_AXI_FULL_0_M00_AXI_BRESP;
  wire [0:0]M_AXI_FULL_0_M00_AXI_BUSER;
  wire M_AXI_FULL_0_M00_AXI_BVALID;
  wire [31:0]M_AXI_FULL_0_M00_AXI_RDATA;
  wire [0:0]M_AXI_FULL_0_M00_AXI_RID;
  wire M_AXI_FULL_0_M00_AXI_RLAST;
  wire M_AXI_FULL_0_M00_AXI_RREADY;
  wire [1:0]M_AXI_FULL_0_M00_AXI_RRESP;
  wire [0:0]M_AXI_FULL_0_M00_AXI_RUSER;
  wire M_AXI_FULL_0_M00_AXI_RVALID;
  wire [31:0]M_AXI_FULL_0_M00_AXI_WDATA;
  wire M_AXI_FULL_0_M00_AXI_WLAST;
  wire M_AXI_FULL_0_M00_AXI_WREADY;
  wire [3:0]M_AXI_FULL_0_M00_AXI_WSTRB;
  wire [0:0]M_AXI_FULL_0_M00_AXI_WUSER;
  wire M_AXI_FULL_0_M00_AXI_WVALID;
  wire aclk_net;
  wire aresetn_net;
  wire error_00;
  wire init_axi_txn_00;
  wire txn_done_00;

  assign M00_AXI_ERROR = error_00;
  assign M00_AXI_TXN_DONE = txn_done_00;
  assign aclk_net = ACLK;
  assign aresetn_net = ARESETN;
  assign init_axi_txn_00 = M00_AXI_INIT_AXI_TXN;
  M_AXI_FULL_v1_0_bfm_1_M_AXI_FULL_0_0 M_AXI_FULL_0
       (.m00_axi_aclk(aclk_net),
        .m00_axi_araddr(M_AXI_FULL_0_M00_AXI_ARADDR),
        .m00_axi_arburst(M_AXI_FULL_0_M00_AXI_ARBURST),
        .m00_axi_arcache(M_AXI_FULL_0_M00_AXI_ARCACHE),
        .m00_axi_aresetn(aresetn_net),
        .m00_axi_arid(M_AXI_FULL_0_M00_AXI_ARID),
        .m00_axi_arlen(M_AXI_FULL_0_M00_AXI_ARLEN),
        .m00_axi_arlock(M_AXI_FULL_0_M00_AXI_ARLOCK),
        .m00_axi_arprot(M_AXI_FULL_0_M00_AXI_ARPROT),
        .m00_axi_arqos(M_AXI_FULL_0_M00_AXI_ARQOS),
        .m00_axi_arready(M_AXI_FULL_0_M00_AXI_ARREADY),
        .m00_axi_aruser(M_AXI_FULL_0_M00_AXI_ARUSER),
        .m00_axi_arvalid(M_AXI_FULL_0_M00_AXI_ARVALID),
        .m00_axi_awaddr(M_AXI_FULL_0_M00_AXI_AWADDR),
        .m00_axi_awburst(M_AXI_FULL_0_M00_AXI_AWBURST),
        .m00_axi_awcache(M_AXI_FULL_0_M00_AXI_AWCACHE),
        .m00_axi_awid(M_AXI_FULL_0_M00_AXI_AWID),
        .m00_axi_awlen(M_AXI_FULL_0_M00_AXI_AWLEN),
        .m00_axi_awlock(M_AXI_FULL_0_M00_AXI_AWLOCK),
        .m00_axi_awprot(M_AXI_FULL_0_M00_AXI_AWPROT),
        .m00_axi_awqos(M_AXI_FULL_0_M00_AXI_AWQOS),
        .m00_axi_awready(M_AXI_FULL_0_M00_AXI_AWREADY),
        .m00_axi_awuser(M_AXI_FULL_0_M00_AXI_AWUSER),
        .m00_axi_awvalid(M_AXI_FULL_0_M00_AXI_AWVALID),
        .m00_axi_bid(M_AXI_FULL_0_M00_AXI_BID),
        .m00_axi_bready(M_AXI_FULL_0_M00_AXI_BREADY),
        .m00_axi_bresp(M_AXI_FULL_0_M00_AXI_BRESP),
        .m00_axi_buser(M_AXI_FULL_0_M00_AXI_BUSER),
        .m00_axi_bvalid(M_AXI_FULL_0_M00_AXI_BVALID),
        .m00_axi_error(error_00),
        .m00_axi_init_axi_txn(init_axi_txn_00),
        .m00_axi_rdata(M_AXI_FULL_0_M00_AXI_RDATA),
        .m00_axi_rid(M_AXI_FULL_0_M00_AXI_RID),
        .m00_axi_rlast(M_AXI_FULL_0_M00_AXI_RLAST),
        .m00_axi_rready(M_AXI_FULL_0_M00_AXI_RREADY),
        .m00_axi_rresp(M_AXI_FULL_0_M00_AXI_RRESP),
        .m00_axi_ruser(M_AXI_FULL_0_M00_AXI_RUSER),
        .m00_axi_rvalid(M_AXI_FULL_0_M00_AXI_RVALID),
        .m00_axi_txn_done(txn_done_00),
        .m00_axi_wdata(M_AXI_FULL_0_M00_AXI_WDATA),
        .m00_axi_wlast(M_AXI_FULL_0_M00_AXI_WLAST),
        .m00_axi_wready(M_AXI_FULL_0_M00_AXI_WREADY),
        .m00_axi_wstrb(M_AXI_FULL_0_M00_AXI_WSTRB),
        .m00_axi_wuser(M_AXI_FULL_0_M00_AXI_WUSER),
        .m00_axi_wvalid(M_AXI_FULL_0_M00_AXI_WVALID));
  M_AXI_FULL_v1_0_bfm_1_slave_0_0 slave_0
       (.aclk(aclk_net),
        .aresetn(aresetn_net),
        .s_axi_araddr(M_AXI_FULL_0_M00_AXI_ARADDR),
        .s_axi_arburst(M_AXI_FULL_0_M00_AXI_ARBURST),
        .s_axi_arcache(M_AXI_FULL_0_M00_AXI_ARCACHE),
        .s_axi_arid(M_AXI_FULL_0_M00_AXI_ARID),
        .s_axi_arlen(M_AXI_FULL_0_M00_AXI_ARLEN),
        .s_axi_arlock(M_AXI_FULL_0_M00_AXI_ARLOCK),
        .s_axi_arprot(M_AXI_FULL_0_M00_AXI_ARPROT),
        .s_axi_arqos(M_AXI_FULL_0_M00_AXI_ARQOS),
        .s_axi_arready(M_AXI_FULL_0_M00_AXI_ARREADY),
        .s_axi_aruser(M_AXI_FULL_0_M00_AXI_ARUSER),
        .s_axi_arvalid(M_AXI_FULL_0_M00_AXI_ARVALID),
        .s_axi_awaddr(M_AXI_FULL_0_M00_AXI_AWADDR),
        .s_axi_awburst(M_AXI_FULL_0_M00_AXI_AWBURST),
        .s_axi_awcache(M_AXI_FULL_0_M00_AXI_AWCACHE),
        .s_axi_awid(M_AXI_FULL_0_M00_AXI_AWID),
        .s_axi_awlen(M_AXI_FULL_0_M00_AXI_AWLEN),
        .s_axi_awlock(M_AXI_FULL_0_M00_AXI_AWLOCK),
        .s_axi_awprot(M_AXI_FULL_0_M00_AXI_AWPROT),
        .s_axi_awqos(M_AXI_FULL_0_M00_AXI_AWQOS),
        .s_axi_awready(M_AXI_FULL_0_M00_AXI_AWREADY),
        .s_axi_awuser(M_AXI_FULL_0_M00_AXI_AWUSER),
        .s_axi_awvalid(M_AXI_FULL_0_M00_AXI_AWVALID),
        .s_axi_bid(M_AXI_FULL_0_M00_AXI_BID),
        .s_axi_bready(M_AXI_FULL_0_M00_AXI_BREADY),
        .s_axi_bresp(M_AXI_FULL_0_M00_AXI_BRESP),
        .s_axi_buser(M_AXI_FULL_0_M00_AXI_BUSER),
        .s_axi_bvalid(M_AXI_FULL_0_M00_AXI_BVALID),
        .s_axi_rdata(M_AXI_FULL_0_M00_AXI_RDATA),
        .s_axi_rid(M_AXI_FULL_0_M00_AXI_RID),
        .s_axi_rlast(M_AXI_FULL_0_M00_AXI_RLAST),
        .s_axi_rready(M_AXI_FULL_0_M00_AXI_RREADY),
        .s_axi_rresp(M_AXI_FULL_0_M00_AXI_RRESP),
        .s_axi_ruser(M_AXI_FULL_0_M00_AXI_RUSER),
        .s_axi_rvalid(M_AXI_FULL_0_M00_AXI_RVALID),
        .s_axi_wdata(M_AXI_FULL_0_M00_AXI_WDATA),
        .s_axi_wlast(M_AXI_FULL_0_M00_AXI_WLAST),
        .s_axi_wready(M_AXI_FULL_0_M00_AXI_WREADY),
        .s_axi_wstrb(M_AXI_FULL_0_M00_AXI_WSTRB),
        .s_axi_wuser(M_AXI_FULL_0_M00_AXI_WUSER),
        .s_axi_wvalid(M_AXI_FULL_0_M00_AXI_WVALID));
endmodule
