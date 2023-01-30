//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Tue Jan 10 16:08:51 2023
//Host        : DESKTOP-Q1EFAHP running 64-bit major release  (build 9200)
//Command     : generate_target DMA_LOOP.bd
//Design      : DMA_LOOP
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "DMA_LOOP,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=DMA_LOOP,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=6,numReposBlks=6,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=2,da_board_cnt=3,da_clkrst_cnt=1,synth_mode=Global}" *) (* HW_HANDOFF = "DMA_LOOP.hwdef" *) 
module DMA_LOOP
   (clk,
    clk_fast,
    data_out,
    done,
    rst_n,
    start_flag);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET rst_n, CLK_DOMAIN DMA_LOOP_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk;
  input clk_fast;
  output [31:0]data_out;
  output done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rst_n;
  input start_flag;

  wire AXI_DBUF_0_done;
  wire [14:0]AXI_DBUF_0_m_axi_ARADDR;
  wire [1:0]AXI_DBUF_0_m_axi_ARBURST;
  wire [3:0]AXI_DBUF_0_m_axi_ARCACHE;
  wire [7:0]AXI_DBUF_0_m_axi_ARLEN;
  wire AXI_DBUF_0_m_axi_ARLOCK;
  wire [2:0]AXI_DBUF_0_m_axi_ARPROT;
  wire AXI_DBUF_0_m_axi_ARREADY;
  wire [3:0]AXI_DBUF_0_m_axi_ARSIZE;
  wire AXI_DBUF_0_m_axi_ARVALID;
  wire [14:0]AXI_DBUF_0_m_axi_AWADDR;
  wire [1:0]AXI_DBUF_0_m_axi_AWBURST;
  wire [3:0]AXI_DBUF_0_m_axi_AWCACHE;
  wire [7:0]AXI_DBUF_0_m_axi_AWLEN;
  wire AXI_DBUF_0_m_axi_AWLOCK;
  wire [2:0]AXI_DBUF_0_m_axi_AWPROT;
  wire AXI_DBUF_0_m_axi_AWREADY;
  wire [2:0]AXI_DBUF_0_m_axi_AWSIZE;
  wire AXI_DBUF_0_m_axi_AWVALID;
  wire AXI_DBUF_0_m_axi_BREADY;
  wire [1:0]AXI_DBUF_0_m_axi_BRESP;
  wire AXI_DBUF_0_m_axi_BVALID;
  wire [31:0]AXI_DBUF_0_m_axi_RDATA;
  wire AXI_DBUF_0_m_axi_RLAST;
  wire AXI_DBUF_0_m_axi_RREADY;
  wire [1:0]AXI_DBUF_0_m_axi_RRESP;
  wire AXI_DBUF_0_m_axi_RVALID;
  wire [31:0]AXI_DBUF_0_m_axi_WDATA;
  wire AXI_DBUF_0_m_axi_WLAST;
  wire AXI_DBUF_0_m_axi_WREADY;
  wire [3:0]AXI_DBUF_0_m_axi_WSTRB;
  wire AXI_DBUF_0_m_axi_WVALID;
  wire [31:0]DATA_GEN_0_data_out;
  wire DATA_GEN_0_done_flag;
  wire DATA_GEN_0_h_flag;
  wire DATA_GEN_0_v_flag;
  wire [31:0]PL_BRAM_WR_data_out;
  wire [31:0]PL_BRAM_WR_rd_addr;
  wire PL_BRAM_WR_rd_clk;
  wire PL_BRAM_WR_rd_en;
  wire [14:0]axi_bram_ctrl_0_BRAM_PORTA_ADDR;
  wire axi_bram_ctrl_0_BRAM_PORTA_CLK;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DIN;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DOUT;
  wire axi_bram_ctrl_0_BRAM_PORTA_EN;
  wire axi_bram_ctrl_0_BRAM_PORTA_RST;
  wire [3:0]axi_bram_ctrl_0_BRAM_PORTA_WE;
  wire [31:0]blk_mem_gen_doutb;
  wire [0:0]c_shift_ram_0_Q;
  wire clk_fast_1;
  wire clk_wiz_0_clk_out1;
  wire rst_n_0_1;
  wire start_flag_0_1;

  assign clk_fast_1 = clk_fast;
  assign clk_wiz_0_clk_out1 = clk;
  assign data_out[31:0] = PL_BRAM_WR_data_out;
  assign done = AXI_DBUF_0_done;
  assign rst_n_0_1 = rst_n;
  assign start_flag_0_1 = start_flag;
  DMA_LOOP_AXI_DBUF_0_0 AXI_DBUF_0
       (.clk(clk_fast_1),
        .data_in(DATA_GEN_0_data_out),
        .done(AXI_DBUF_0_done),
        .h_flag(DATA_GEN_0_h_flag),
        .m_axi_araddr(AXI_DBUF_0_m_axi_ARADDR),
        .m_axi_arburst(AXI_DBUF_0_m_axi_ARBURST),
        .m_axi_arcache(AXI_DBUF_0_m_axi_ARCACHE),
        .m_axi_arlen(AXI_DBUF_0_m_axi_ARLEN),
        .m_axi_arlock(AXI_DBUF_0_m_axi_ARLOCK),
        .m_axi_arprot(AXI_DBUF_0_m_axi_ARPROT),
        .m_axi_arready(AXI_DBUF_0_m_axi_ARREADY),
        .m_axi_arsize(AXI_DBUF_0_m_axi_ARSIZE),
        .m_axi_arvalid(AXI_DBUF_0_m_axi_ARVALID),
        .m_axi_awaddr(AXI_DBUF_0_m_axi_AWADDR),
        .m_axi_awburst(AXI_DBUF_0_m_axi_AWBURST),
        .m_axi_awcache(AXI_DBUF_0_m_axi_AWCACHE),
        .m_axi_awlen(AXI_DBUF_0_m_axi_AWLEN),
        .m_axi_awlock(AXI_DBUF_0_m_axi_AWLOCK),
        .m_axi_awprot(AXI_DBUF_0_m_axi_AWPROT),
        .m_axi_awready(AXI_DBUF_0_m_axi_AWREADY),
        .m_axi_awsize(AXI_DBUF_0_m_axi_AWSIZE),
        .m_axi_awvalid(AXI_DBUF_0_m_axi_AWVALID),
        .m_axi_bready(AXI_DBUF_0_m_axi_BREADY),
        .m_axi_bresp(AXI_DBUF_0_m_axi_BRESP),
        .m_axi_bvalid(AXI_DBUF_0_m_axi_BVALID),
        .m_axi_rdata(AXI_DBUF_0_m_axi_RDATA),
        .m_axi_rlast(AXI_DBUF_0_m_axi_RLAST),
        .m_axi_rready(AXI_DBUF_0_m_axi_RREADY),
        .m_axi_rresp(AXI_DBUF_0_m_axi_RRESP),
        .m_axi_rvalid(AXI_DBUF_0_m_axi_RVALID),
        .m_axi_wdata(AXI_DBUF_0_m_axi_WDATA),
        .m_axi_wlast(AXI_DBUF_0_m_axi_WLAST),
        .m_axi_wready(AXI_DBUF_0_m_axi_WREADY),
        .m_axi_wstrb(AXI_DBUF_0_m_axi_WSTRB),
        .m_axi_wvalid(AXI_DBUF_0_m_axi_WVALID),
        .rst_n(rst_n_0_1),
        .start(start_flag_0_1),
        .v_flag(DATA_GEN_0_v_flag));
  DMA_LOOP_DATA_GEN_0_0 DATA_GEN
       (.clk(clk_wiz_0_clk_out1),
        .data_out(DATA_GEN_0_data_out),
        .done_flag(DATA_GEN_0_done_flag),
        .h_flag(DATA_GEN_0_h_flag),
        .rst_n(rst_n_0_1),
        .start_flag(start_flag_0_1),
        .v_flag(DATA_GEN_0_v_flag));
  DMA_LOOP_PL_BRAM_WR_0_0 PL_BRAM_WR
       (.clk(clk_wiz_0_clk_out1),
        .data_in(DATA_GEN_0_data_out),
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
  DMA_LOOP_axi_bram_ctrl_0_0 axi_bram_ctrl
       (.bram_addr_a(axi_bram_ctrl_0_BRAM_PORTA_ADDR),
        .bram_clk_a(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .bram_en_a(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .bram_rddata_a(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .bram_rst_a(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .bram_we_a(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .bram_wrdata_a(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .s_axi_aclk(clk_fast_1),
        .s_axi_araddr(AXI_DBUF_0_m_axi_ARADDR),
        .s_axi_arburst(AXI_DBUF_0_m_axi_ARBURST),
        .s_axi_arcache(AXI_DBUF_0_m_axi_ARCACHE),
        .s_axi_aresetn(rst_n_0_1),
        .s_axi_arlen(AXI_DBUF_0_m_axi_ARLEN),
        .s_axi_arlock(AXI_DBUF_0_m_axi_ARLOCK),
        .s_axi_arprot(AXI_DBUF_0_m_axi_ARPROT),
        .s_axi_arready(AXI_DBUF_0_m_axi_ARREADY),
        .s_axi_arsize(AXI_DBUF_0_m_axi_ARSIZE[2:0]),
        .s_axi_arvalid(AXI_DBUF_0_m_axi_ARVALID),
        .s_axi_awaddr(AXI_DBUF_0_m_axi_AWADDR),
        .s_axi_awburst(AXI_DBUF_0_m_axi_AWBURST),
        .s_axi_awcache(AXI_DBUF_0_m_axi_AWCACHE),
        .s_axi_awlen(AXI_DBUF_0_m_axi_AWLEN),
        .s_axi_awlock(AXI_DBUF_0_m_axi_AWLOCK),
        .s_axi_awprot(AXI_DBUF_0_m_axi_AWPROT),
        .s_axi_awready(AXI_DBUF_0_m_axi_AWREADY),
        .s_axi_awsize(AXI_DBUF_0_m_axi_AWSIZE),
        .s_axi_awvalid(AXI_DBUF_0_m_axi_AWVALID),
        .s_axi_bready(AXI_DBUF_0_m_axi_BREADY),
        .s_axi_bresp(AXI_DBUF_0_m_axi_BRESP),
        .s_axi_bvalid(AXI_DBUF_0_m_axi_BVALID),
        .s_axi_rdata(AXI_DBUF_0_m_axi_RDATA),
        .s_axi_rlast(AXI_DBUF_0_m_axi_RLAST),
        .s_axi_rready(AXI_DBUF_0_m_axi_RREADY),
        .s_axi_rresp(AXI_DBUF_0_m_axi_RRESP),
        .s_axi_rvalid(AXI_DBUF_0_m_axi_RVALID),
        .s_axi_wdata(AXI_DBUF_0_m_axi_WDATA),
        .s_axi_wlast(AXI_DBUF_0_m_axi_WLAST),
        .s_axi_wready(AXI_DBUF_0_m_axi_WREADY),
        .s_axi_wstrb(AXI_DBUF_0_m_axi_WSTRB),
        .s_axi_wvalid(AXI_DBUF_0_m_axi_WVALID));
  DMA_LOOP_blk_mem_gen_0_0 blk_mem_gen
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,axi_bram_ctrl_0_BRAM_PORTA_ADDR}),
        .addrb(PL_BRAM_WR_rd_addr),
        .clka(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .clkb(PL_BRAM_WR_rd_clk),
        .dina(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .douta(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .doutb(blk_mem_gen_doutb),
        .ena(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .enb(PL_BRAM_WR_rd_en),
        .rsta(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .rstb(1'b0),
        .wea(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .web({1'b0,1'b0,1'b0,1'b0}));
  DMA_LOOP_c_shift_ram_0_0 c_shift_ram_0
       (.CLK(clk_wiz_0_clk_out1),
        .D(start_flag_0_1),
        .Q(c_shift_ram_0_Q));
endmodule
