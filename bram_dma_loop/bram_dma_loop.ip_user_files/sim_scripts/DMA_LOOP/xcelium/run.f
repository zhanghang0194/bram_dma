-makelib xcelium_lib/xpm -sv \
  "D:/SYSTEM_SOFTWARE/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/SYSTEM_SOFTWARE/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "D:/SYSTEM_SOFTWARE/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/SYSTEM_SOFTWARE/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/DMA_LOOP/ip/DMA_LOOP_DATA_GEN_0_0/sim/DMA_LOOP_DATA_GEN_0_0.v" \
  "../../../bd/DMA_LOOP/ip/DMA_LOOP_M_AXI_LITE_0_0/sim/DMA_LOOP_M_AXI_LITE_0_0.v" \
  "../../../bd/DMA_LOOP/ip/DMA_LOOP_PL_BRAM_WR_0_0/sim/DMA_LOOP_PL_BRAM_WR_0_0.v" \
  "../../../bd/DMA_LOOP/ip/DMA_LOOP_RGB565_888_0_0/sim/DMA_LOOP_RGB565_888_0_0.v" \
-endlib
-makelib xcelium_lib/axi_bram_ctrl_v4_1_6 \
  "../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/3c31/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/DMA_LOOP/ip/DMA_LOOP_axi_bram_ctrl_0_0/sim/DMA_LOOP_axi_bram_ctrl_0_0.vhd" \
-endlib
-makelib xcelium_lib/lib_pkg_v1_0_2 \
  "../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_7 \
  "../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_7 \
  "../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_7 \
  "../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/lib_fifo_v1_0_16 \
  "../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/6c82/hdl/lib_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_srl_fifo_v1_0_2 \
  "../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_datamover_v5_1_28 \
  "../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/1bb8/hdl/axi_datamover_v5_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_sg_v4_1_15 \
  "../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/751a/hdl/axi_sg_v4_1_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_dma_v7_1_27 \
  "../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/7b0b/hdl/axi_dma_v7_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/DMA_LOOP/ip/DMA_LOOP_axi_dma_0_1/sim/DMA_LOOP_axi_dma_0_1.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_5 \
  "../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/25a8/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/DMA_LOOP/ip/DMA_LOOP_blk_mem_gen_0_0/sim/DMA_LOOP_blk_mem_gen_0_0.v" \
-endlib
-makelib xcelium_lib/xbip_utils_v3_0_10 \
  "../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/364f/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/c_reg_fd_v12_0_6 \
  "../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/edec/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/c_mux_bit_v12_0_6 \
  "../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/ecb4/hdl/c_mux_bit_v12_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/c_shift_ram_v12_0_14 \
  "../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/2598/hdl/c_shift_ram_v12_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/DMA_LOOP/ip/DMA_LOOP_c_shift_ram_0_0/sim/DMA_LOOP_c_shift_ram_0_0.vhd" \
-endlib
-makelib xcelium_lib/util_vector_logic_v2_0_2 \
  "../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/3d84/hdl/util_vector_logic_v2_0_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/DMA_LOOP/ip/DMA_LOOP_util_vector_logic_0_0/sim/DMA_LOOP_util_vector_logic_0_0.v" \
  "../../../bd/DMA_LOOP/ip/DMA_LOOP_vio_0_0/sim/DMA_LOOP_vio_0_0.v" \
  "../../../bd/DMA_LOOP/ip/DMA_LOOP_VID_AXIS_0_0/sim/DMA_LOOP_VID_AXIS_0_0.v" \
  "../../../bd/DMA_LOOP/sim/DMA_LOOP.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

