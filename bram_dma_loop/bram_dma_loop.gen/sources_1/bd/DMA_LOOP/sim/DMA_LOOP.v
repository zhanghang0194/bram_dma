//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Fri Feb  3 17:46:35 2023
//Host        : DESKTOP-Q1EFAHP running 64-bit major release  (build 9200)
//Command     : generate_target DMA_LOOP.bd
//Design      : DMA_LOOP
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "DMA_LOOP,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=DMA_LOOP,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=11,numReposBlks=11,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=5,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=2,da_board_cnt=3,da_clkrst_cnt=4,synth_mode=Global}" *) (* HW_HANDOFF = "DMA_LOOP.hwdef" *) 
module DMA_LOOP
   (clk,
    clk_fast,
    data_out,
    rst_n,
    start_flag);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET rst_n, CLK_DOMAIN DMA_LOOP_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk;
  input clk_fast;
  output [31:0]data_out;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rst_n;
  input start_flag;

  wire DATA_GEN_0_done_flag;
  wire DATA_GEN_0_h_flag;
  wire DATA_GEN_0_v_flag;
  wire [7:0]DATA_GEN_data_out;
  wire [9:0]M_AXI_LITE_0_M_AXI_ARADDR;
  wire M_AXI_LITE_0_M_AXI_ARREADY;
  wire M_AXI_LITE_0_M_AXI_ARVALID;
  wire [9:0]M_AXI_LITE_0_M_AXI_AWADDR;
  wire M_AXI_LITE_0_M_AXI_AWREADY;
  wire M_AXI_LITE_0_M_AXI_AWVALID;
  wire M_AXI_LITE_0_M_AXI_BREADY;
  wire [1:0]M_AXI_LITE_0_M_AXI_BRESP;
  wire M_AXI_LITE_0_M_AXI_BVALID;
  wire [31:0]M_AXI_LITE_0_M_AXI_RDATA;
  wire M_AXI_LITE_0_M_AXI_RREADY;
  wire [1:0]M_AXI_LITE_0_M_AXI_RRESP;
  wire M_AXI_LITE_0_M_AXI_RVALID;
  wire [31:0]M_AXI_LITE_0_M_AXI_WDATA;
  wire M_AXI_LITE_0_M_AXI_WREADY;
  wire M_AXI_LITE_0_M_AXI_WVALID;
  wire [31:0]PL_BRAM_WR_data_out;
  wire [31:0]PL_BRAM_WR_rd_addr;
  wire PL_BRAM_WR_rd_clk;
  wire PL_BRAM_WR_rd_en;
  wire RGB565_888_0_data_en;
  wire [23:0]RGB565_888_0_data_o;
  wire RGB565_888_0_h_flag_o;
  wire RGB565_888_0_v_flag_o;
  wire VID_AXIS_0_almost_full;
  wire [31:0]VID_AXIS_0_m_axis_TDATA;
  wire [3:0]VID_AXIS_0_m_axis_TKEEP;
  wire VID_AXIS_0_m_axis_TLAST;
  wire VID_AXIS_0_m_axis_TREADY;
  wire VID_AXIS_0_m_axis_TVALID;
  wire VID_AXIS_0_no_empty;
  wire [15:0]axi_bram_ctrl_0_BRAM_PORTA_ADDR;
  wire axi_bram_ctrl_0_BRAM_PORTA_CLK;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DIN;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DOUT;
  wire axi_bram_ctrl_0_BRAM_PORTA_RST;
  wire [3:0]axi_bram_ctrl_0_BRAM_PORTA_WE;
  wire axi_bram_ctrl_bram_en_a;
  wire [31:0]axi_dma_0_M_AXI_S2MM_AWADDR;
  wire [1:0]axi_dma_0_M_AXI_S2MM_AWBURST;
  wire [3:0]axi_dma_0_M_AXI_S2MM_AWCACHE;
  wire [7:0]axi_dma_0_M_AXI_S2MM_AWLEN;
  wire [2:0]axi_dma_0_M_AXI_S2MM_AWPROT;
  wire axi_dma_0_M_AXI_S2MM_AWREADY;
  wire [2:0]axi_dma_0_M_AXI_S2MM_AWSIZE;
  wire axi_dma_0_M_AXI_S2MM_AWVALID;
  wire axi_dma_0_M_AXI_S2MM_BREADY;
  wire [1:0]axi_dma_0_M_AXI_S2MM_BRESP;
  wire axi_dma_0_M_AXI_S2MM_BVALID;
  wire [31:0]axi_dma_0_M_AXI_S2MM_WDATA;
  wire axi_dma_0_M_AXI_S2MM_WLAST;
  wire axi_dma_0_M_AXI_S2MM_WREADY;
  wire [3:0]axi_dma_0_M_AXI_S2MM_WSTRB;
  wire axi_dma_0_M_AXI_S2MM_WVALID;
  wire [31:0]blk_mem_gen_doutb;
  wire [0:0]c_shift_ram_0_Q;
  wire clk_fast_1;
  wire clk_wiz_0_clk_out1;
  wire rst_n_0_1;
  wire start_flag_0_1;
  wire [0:0]util_vector_logic_0_Res;
  wire [7:0]vio_0_probe_out0;

  assign clk_fast_1 = clk_fast;
  assign clk_wiz_0_clk_out1 = clk;
  assign data_out[31:0] = PL_BRAM_WR_data_out;
  assign rst_n_0_1 = rst_n;
  assign start_flag_0_1 = start_flag;
  DMA_LOOP_DATA_GEN_0_0 DATA_GEN
       (.clk(clk_wiz_0_clk_out1),
        .data_out(DATA_GEN_data_out),
        .done_flag(DATA_GEN_0_done_flag),
        .h_flag(DATA_GEN_0_h_flag),
        .rst_n(rst_n_0_1),
        .start_flag(start_flag_0_1),
        .v_flag(DATA_GEN_0_v_flag));
  DMA_LOOP_M_AXI_LITE_0_0 M_AXI_LITE_0
       (.M_AXI_ACLK(clk_fast_1),
        .M_AXI_ARADDR(M_AXI_LITE_0_M_AXI_ARADDR),
        .M_AXI_ARESETN(rst_n_0_1),
        .M_AXI_ARREADY(M_AXI_LITE_0_M_AXI_ARREADY),
        .M_AXI_ARVALID(M_AXI_LITE_0_M_AXI_ARVALID),
        .M_AXI_AWADDR(M_AXI_LITE_0_M_AXI_AWADDR),
        .M_AXI_AWREADY(M_AXI_LITE_0_M_AXI_AWREADY),
        .M_AXI_AWVALID(M_AXI_LITE_0_M_AXI_AWVALID),
        .M_AXI_BREADY(M_AXI_LITE_0_M_AXI_BREADY),
        .M_AXI_BRESP(M_AXI_LITE_0_M_AXI_BRESP),
        .M_AXI_BVALID(M_AXI_LITE_0_M_AXI_BVALID),
        .M_AXI_RDATA(M_AXI_LITE_0_M_AXI_RDATA),
        .M_AXI_RREADY(M_AXI_LITE_0_M_AXI_RREADY),
        .M_AXI_RRESP(M_AXI_LITE_0_M_AXI_RRESP),
        .M_AXI_RVALID(M_AXI_LITE_0_M_AXI_RVALID),
        .M_AXI_WDATA(M_AXI_LITE_0_M_AXI_WDATA),
        .M_AXI_WREADY(M_AXI_LITE_0_M_AXI_WREADY),
        .M_AXI_WVALID(M_AXI_LITE_0_M_AXI_WVALID),
        .data_size({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .start_flag(util_vector_logic_0_Res));
  DMA_LOOP_PL_BRAM_WR_0_0 PL_BRAM_WR
       (.clk(clk_wiz_0_clk_out1),
        .data_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .data_out(PL_BRAM_WR_data_out),
        .done_flag(DATA_GEN_0_done_flag),
        .h_flag(DATA_GEN_0_h_flag),
        .rd_addr(PL_BRAM_WR_rd_addr),
        .rd_clk(PL_BRAM_WR_rd_clk),
        .rd_data(blk_mem_gen_doutb),
        .rd_en(PL_BRAM_WR_rd_en),
        .rst_n(rst_n_0_1),
        .start_flag(c_shift_ram_0_Q),
        .v_flag(DATA_GEN_0_v_flag));
  DMA_LOOP_RGB565_888_0_0 RGB565_888_0
       (.data_en(RGB565_888_0_data_en),
        .data_i(DATA_GEN_data_out),
        .data_o(RGB565_888_0_data_o),
        .h_flag_i(DATA_GEN_0_h_flag),
        .h_flag_o(RGB565_888_0_h_flag_o),
        .pclk(clk_wiz_0_clk_out1),
        .rst_n(rst_n_0_1),
        .start_flag(start_flag_0_1),
        .v_flag_i(DATA_GEN_0_v_flag),
        .v_flag_o(RGB565_888_0_v_flag_o));
  DMA_LOOP_VID_AXIS_0_0 VID_AXIS_0
       (.almost_full(VID_AXIS_0_almost_full),
        .m_axis_aclk(clk_fast_1),
        .m_axis_tdata(VID_AXIS_0_m_axis_TDATA),
        .m_axis_tkeep(VID_AXIS_0_m_axis_TKEEP),
        .m_axis_tlast(VID_AXIS_0_m_axis_TLAST),
        .m_axis_tready(VID_AXIS_0_m_axis_TREADY),
        .m_axis_tvalid(VID_AXIS_0_m_axis_TVALID),
        .no_empty(VID_AXIS_0_no_empty),
        .vid_alpha(vio_0_probe_out0),
        .vid_clk(clk_wiz_0_clk_out1),
        .vid_data(RGB565_888_0_data_o),
        .vid_de(RGB565_888_0_data_en),
        .vid_hs(RGB565_888_0_h_flag_o),
        .vid_rst_n(rst_n_0_1),
        .vid_vs(RGB565_888_0_v_flag_o));
  DMA_LOOP_axi_bram_ctrl_0_0 axi_bram_ctrl
       (.bram_addr_a(axi_bram_ctrl_0_BRAM_PORTA_ADDR),
        .bram_clk_a(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .bram_en_a(axi_bram_ctrl_bram_en_a),
        .bram_rddata_a(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .bram_rst_a(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .bram_we_a(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .bram_wrdata_a(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .s_axi_aclk(clk_fast_1),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b1}),
        .s_axi_arcache({1'b0,1'b0,1'b1,1'b1}),
        .s_axi_aresetn(rst_n_0_1),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b1,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr(axi_dma_0_M_AXI_S2MM_AWADDR[15:0]),
        .s_axi_awburst(axi_dma_0_M_AXI_S2MM_AWBURST),
        .s_axi_awcache(axi_dma_0_M_AXI_S2MM_AWCACHE),
        .s_axi_awlen(axi_dma_0_M_AXI_S2MM_AWLEN),
        .s_axi_awlock(1'b0),
        .s_axi_awprot(axi_dma_0_M_AXI_S2MM_AWPROT),
        .s_axi_awready(axi_dma_0_M_AXI_S2MM_AWREADY),
        .s_axi_awsize(axi_dma_0_M_AXI_S2MM_AWSIZE),
        .s_axi_awvalid(axi_dma_0_M_AXI_S2MM_AWVALID),
        .s_axi_bready(axi_dma_0_M_AXI_S2MM_BREADY),
        .s_axi_bresp(axi_dma_0_M_AXI_S2MM_BRESP),
        .s_axi_bvalid(axi_dma_0_M_AXI_S2MM_BVALID),
        .s_axi_rready(1'b0),
        .s_axi_wdata(axi_dma_0_M_AXI_S2MM_WDATA),
        .s_axi_wlast(axi_dma_0_M_AXI_S2MM_WLAST),
        .s_axi_wready(axi_dma_0_M_AXI_S2MM_WREADY),
        .s_axi_wstrb(axi_dma_0_M_AXI_S2MM_WSTRB),
        .s_axi_wvalid(axi_dma_0_M_AXI_S2MM_WVALID));
  DMA_LOOP_axi_dma_0_1 axi_dma_0
       (.axi_resetn(rst_n_0_1),
        .m_axi_s2mm_aclk(clk_fast_1),
        .m_axi_s2mm_awaddr(axi_dma_0_M_AXI_S2MM_AWADDR),
        .m_axi_s2mm_awburst(axi_dma_0_M_AXI_S2MM_AWBURST),
        .m_axi_s2mm_awcache(axi_dma_0_M_AXI_S2MM_AWCACHE),
        .m_axi_s2mm_awlen(axi_dma_0_M_AXI_S2MM_AWLEN),
        .m_axi_s2mm_awprot(axi_dma_0_M_AXI_S2MM_AWPROT),
        .m_axi_s2mm_awready(axi_dma_0_M_AXI_S2MM_AWREADY),
        .m_axi_s2mm_awsize(axi_dma_0_M_AXI_S2MM_AWSIZE),
        .m_axi_s2mm_awvalid(axi_dma_0_M_AXI_S2MM_AWVALID),
        .m_axi_s2mm_bready(axi_dma_0_M_AXI_S2MM_BREADY),
        .m_axi_s2mm_bresp(axi_dma_0_M_AXI_S2MM_BRESP),
        .m_axi_s2mm_bvalid(axi_dma_0_M_AXI_S2MM_BVALID),
        .m_axi_s2mm_wdata(axi_dma_0_M_AXI_S2MM_WDATA),
        .m_axi_s2mm_wlast(axi_dma_0_M_AXI_S2MM_WLAST),
        .m_axi_s2mm_wready(axi_dma_0_M_AXI_S2MM_WREADY),
        .m_axi_s2mm_wstrb(axi_dma_0_M_AXI_S2MM_WSTRB),
        .m_axi_s2mm_wvalid(axi_dma_0_M_AXI_S2MM_WVALID),
        .s_axi_lite_aclk(clk_fast_1),
        .s_axi_lite_araddr(M_AXI_LITE_0_M_AXI_ARADDR),
        .s_axi_lite_arready(M_AXI_LITE_0_M_AXI_ARREADY),
        .s_axi_lite_arvalid(M_AXI_LITE_0_M_AXI_ARVALID),
        .s_axi_lite_awaddr(M_AXI_LITE_0_M_AXI_AWADDR),
        .s_axi_lite_awready(M_AXI_LITE_0_M_AXI_AWREADY),
        .s_axi_lite_awvalid(M_AXI_LITE_0_M_AXI_AWVALID),
        .s_axi_lite_bready(M_AXI_LITE_0_M_AXI_BREADY),
        .s_axi_lite_bresp(M_AXI_LITE_0_M_AXI_BRESP),
        .s_axi_lite_bvalid(M_AXI_LITE_0_M_AXI_BVALID),
        .s_axi_lite_rdata(M_AXI_LITE_0_M_AXI_RDATA),
        .s_axi_lite_rready(M_AXI_LITE_0_M_AXI_RREADY),
        .s_axi_lite_rresp(M_AXI_LITE_0_M_AXI_RRESP),
        .s_axi_lite_rvalid(M_AXI_LITE_0_M_AXI_RVALID),
        .s_axi_lite_wdata(M_AXI_LITE_0_M_AXI_WDATA),
        .s_axi_lite_wready(M_AXI_LITE_0_M_AXI_WREADY),
        .s_axi_lite_wvalid(M_AXI_LITE_0_M_AXI_WVALID),
        .s_axis_s2mm_tdata(VID_AXIS_0_m_axis_TDATA),
        .s_axis_s2mm_tkeep(VID_AXIS_0_m_axis_TKEEP),
        .s_axis_s2mm_tlast(VID_AXIS_0_m_axis_TLAST),
        .s_axis_s2mm_tready(VID_AXIS_0_m_axis_TREADY),
        .s_axis_s2mm_tvalid(VID_AXIS_0_m_axis_TVALID));
  DMA_LOOP_blk_mem_gen_0_0 blk_mem_gen
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,axi_bram_ctrl_0_BRAM_PORTA_ADDR}),
        .addrb(PL_BRAM_WR_rd_addr),
        .clka(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .clkb(PL_BRAM_WR_rd_clk),
        .dina(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .douta(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .doutb(blk_mem_gen_doutb),
        .ena(axi_bram_ctrl_bram_en_a),
        .enb(PL_BRAM_WR_rd_en),
        .rsta(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .rstb(1'b0),
        .wea(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .web({1'b0,1'b0,1'b0,1'b0}));
  DMA_LOOP_c_shift_ram_0_0 c_shift_ram_0
       (.CLK(clk_wiz_0_clk_out1),
        .D(axi_bram_ctrl_bram_en_a),
        .Q(c_shift_ram_0_Q));
  DMA_LOOP_util_vector_logic_0_0 util_vector_logic_0
       (.Op1(VID_AXIS_0_no_empty),
        .Op2(VID_AXIS_0_almost_full),
        .Res(util_vector_logic_0_Res));
  DMA_LOOP_vio_0_0 vio_0
       (.clk(clk_fast_1),
        .probe_out0(vio_0_probe_out0));
endmodule
