vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/blk_mem_gen_v8_4_5
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/axi_bram_ctrl_v4_1_6
vlib questa_lib/msim/xbip_utils_v3_0_10
vlib questa_lib/msim/c_reg_fd_v12_0_6
vlib questa_lib/msim/c_mux_bit_v12_0_6
vlib questa_lib/msim/c_shift_ram_v12_0_14
vlib questa_lib/msim/lib_pkg_v1_0_2
vlib questa_lib/msim/fifo_generator_v13_2_7
vlib questa_lib/msim/lib_fifo_v1_0_16
vlib questa_lib/msim/lib_srl_fifo_v1_0_2
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/axi_datamover_v5_1_28
vlib questa_lib/msim/axi_sg_v4_1_15
vlib questa_lib/msim/axi_dma_v7_1_27

vmap xpm questa_lib/msim/xpm
vmap blk_mem_gen_v8_4_5 questa_lib/msim/blk_mem_gen_v8_4_5
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap axi_bram_ctrl_v4_1_6 questa_lib/msim/axi_bram_ctrl_v4_1_6
vmap xbip_utils_v3_0_10 questa_lib/msim/xbip_utils_v3_0_10
vmap c_reg_fd_v12_0_6 questa_lib/msim/c_reg_fd_v12_0_6
vmap c_mux_bit_v12_0_6 questa_lib/msim/c_mux_bit_v12_0_6
vmap c_shift_ram_v12_0_14 questa_lib/msim/c_shift_ram_v12_0_14
vmap lib_pkg_v1_0_2 questa_lib/msim/lib_pkg_v1_0_2
vmap fifo_generator_v13_2_7 questa_lib/msim/fifo_generator_v13_2_7
vmap lib_fifo_v1_0_16 questa_lib/msim/lib_fifo_v1_0_16
vmap lib_srl_fifo_v1_0_2 questa_lib/msim/lib_srl_fifo_v1_0_2
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap axi_datamover_v5_1_28 questa_lib/msim/axi_datamover_v5_1_28
vmap axi_sg_v4_1_15 questa_lib/msim/axi_sg_v4_1_15
vmap axi_dma_v7_1_27 questa_lib/msim/axi_dma_v7_1_27

vlog -work xpm  -incr -mfcu -sv "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/1b7e/hdl/verilog" "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/122e/hdl/verilog" "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/3cb1/hdl" \
"D:/SYSTEM_SOFTWARE/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/SYSTEM_SOFTWARE/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93 \
"D:/SYSTEM_SOFTWARE/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work blk_mem_gen_v8_4_5  -incr -mfcu "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/1b7e/hdl/verilog" "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/122e/hdl/verilog" "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/3cb1/hdl" \
"../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/25a8/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -incr -mfcu "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/1b7e/hdl/verilog" "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/122e/hdl/verilog" "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/3cb1/hdl" \
"../../../bd/DMA_LOOP/ip/DMA_LOOP_blk_mem_gen_0_0/sim/DMA_LOOP_blk_mem_gen_0_0.v" \

vcom -work axi_bram_ctrl_v4_1_6  -93 \
"../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/3c31/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/DMA_LOOP/ip/DMA_LOOP_axi_bram_ctrl_0_0/sim/DMA_LOOP_axi_bram_ctrl_0_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/1b7e/hdl/verilog" "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/122e/hdl/verilog" "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/3cb1/hdl" \
"../../../bd/DMA_LOOP/ip/DMA_LOOP_PL_BRAM_WR_0_0/sim/DMA_LOOP_PL_BRAM_WR_0_0.v" \

vcom -work xbip_utils_v3_0_10  -93 \
"../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/364f/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_6  -93 \
"../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/edec/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work c_mux_bit_v12_0_6  -93 \
"../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/ecb4/hdl/c_mux_bit_v12_0_vh_rfs.vhd" \

vcom -work c_shift_ram_v12_0_14  -93 \
"../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/2598/hdl/c_shift_ram_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/DMA_LOOP/ip/DMA_LOOP_c_shift_ram_0_0/sim/DMA_LOOP_c_shift_ram_0_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/1b7e/hdl/verilog" "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/122e/hdl/verilog" "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/3cb1/hdl" \
"../../../bd/DMA_LOOP/ip/DMA_LOOP_DATA_GEN_0_0/sim/DMA_LOOP_DATA_GEN_0_0.v" \

vcom -work lib_pkg_v1_0_2  -93 \
"../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_7  -incr -mfcu "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/1b7e/hdl/verilog" "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/122e/hdl/verilog" "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/3cb1/hdl" \
"../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7  -93 \
"../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7  -incr -mfcu "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/1b7e/hdl/verilog" "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/122e/hdl/verilog" "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/3cb1/hdl" \
"../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_16  -93 \
"../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/6c82/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2  -93 \
"../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2  -93 \
"../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_28  -93 \
"../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/1bb8/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_15  -93 \
"../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/751a/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_27  -93 \
"../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/7b0b/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/DMA_LOOP/ip/DMA_LOOP_axi_dma_0_1/sim/DMA_LOOP_axi_dma_0_1.vhd" \

vlog -work xil_defaultlib  -incr -mfcu "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/1b7e/hdl/verilog" "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/122e/hdl/verilog" "+incdir+../../../../bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ipshared/3cb1/hdl" \
"../../../bd/DMA_LOOP/ip/DMA_LOOP_VID_AXIS_0_0/sim/DMA_LOOP_VID_AXIS_0_0.v" \
"../../../bd/DMA_LOOP/ip/DMA_LOOP_vio_0_0/sim/DMA_LOOP_vio_0_0.v" \
"../../../bd/DMA_LOOP/ip/DMA_LOOP_RGB565_888_0_0/sim/DMA_LOOP_RGB565_888_0_0.v" \
"../../../bd/DMA_LOOP/ip/DMA_LOOP_M_AXI_LITE_0_0/sim/DMA_LOOP_M_AXI_LITE_0_0.v" \
"../../../bd/DMA_LOOP/sim/DMA_LOOP.v" \

vlog -work xil_defaultlib \
"glbl.v"

