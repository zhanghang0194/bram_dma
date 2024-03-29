# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

# IP: ip/fifo_generator_0/fifo_generator_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==fifo_generator_0 || ORIG_REF_NAME==fifo_generator_0} -quiet] -quiet

# Block Designs: bd/DMA_LOOP/DMA_LOOP.bd
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==DMA_LOOP || ORIG_REF_NAME==DMA_LOOP} -quiet] -quiet

# IP: bd/DMA_LOOP/ip/DMA_LOOP_blk_mem_gen_0_0/DMA_LOOP_blk_mem_gen_0_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==DMA_LOOP_blk_mem_gen_0_0 || ORIG_REF_NAME==DMA_LOOP_blk_mem_gen_0_0} -quiet] -quiet

# IP: bd/DMA_LOOP/ip/DMA_LOOP_axi_bram_ctrl_0_0/DMA_LOOP_axi_bram_ctrl_0_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==DMA_LOOP_axi_bram_ctrl_0_0 || ORIG_REF_NAME==DMA_LOOP_axi_bram_ctrl_0_0} -quiet] -quiet

# IP: bd/DMA_LOOP/ip/DMA_LOOP_PL_BRAM_WR_0_0/DMA_LOOP_PL_BRAM_WR_0_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==DMA_LOOP_PL_BRAM_WR_0_0 || ORIG_REF_NAME==DMA_LOOP_PL_BRAM_WR_0_0} -quiet] -quiet

# IP: bd/DMA_LOOP/ip/DMA_LOOP_c_shift_ram_0_0/DMA_LOOP_c_shift_ram_0_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==DMA_LOOP_c_shift_ram_0_0 || ORIG_REF_NAME==DMA_LOOP_c_shift_ram_0_0} -quiet] -quiet

# IP: bd/DMA_LOOP/ip/DMA_LOOP_DATA_GEN_0_0/DMA_LOOP_DATA_GEN_0_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==DMA_LOOP_DATA_GEN_0_0 || ORIG_REF_NAME==DMA_LOOP_DATA_GEN_0_0} -quiet] -quiet

# IP: bd/DMA_LOOP/ip/DMA_LOOP_axi_dma_0_1/DMA_LOOP_axi_dma_0_1.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==DMA_LOOP_axi_dma_0_1 || ORIG_REF_NAME==DMA_LOOP_axi_dma_0_1} -quiet] -quiet

# IP: bd/DMA_LOOP/ip/DMA_LOOP_vio_0_0/DMA_LOOP_vio_0_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==DMA_LOOP_vio_0_0 || ORIG_REF_NAME==DMA_LOOP_vio_0_0} -quiet] -quiet

# IP: bd/DMA_LOOP/ip/DMA_LOOP_RGB565_888_0_0/DMA_LOOP_RGB565_888_0_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==DMA_LOOP_RGB565_888_0_0 || ORIG_REF_NAME==DMA_LOOP_RGB565_888_0_0} -quiet] -quiet

# IP: bd/DMA_LOOP/ip/DMA_LOOP_VID_AXIS_0_0/DMA_LOOP_VID_AXIS_0_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==DMA_LOOP_VID_AXIS_0_0 || ORIG_REF_NAME==DMA_LOOP_VID_AXIS_0_0} -quiet] -quiet

# IP: ip/fifo_generator_0/fifo_generator_0.xci
#dup# set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==fifo_generator_0 || ORIG_REF_NAME==fifo_generator_0} -quiet] -quiet

# IP: bd/DMA_LOOP/ip/DMA_LOOP_M_AXI_LITE_0_0/DMA_LOOP_M_AXI_LITE_0_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==DMA_LOOP_M_AXI_LITE_0_0 || ORIG_REF_NAME==DMA_LOOP_M_AXI_LITE_0_0} -quiet] -quiet

# XDC: d:/Z_MILIANKE_FPGA/0_origin/bram_dma_loop/bram_dma_loop.gen/sources_1/ip/fifo_generator_0/fifo_generator_0.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==fifo_generator_0 || ORIG_REF_NAME==fifo_generator_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: d:/Z_MILIANKE_FPGA/0_origin/bram_dma_loop/bram_dma_loop.gen/sources_1/ip/fifo_generator_0/fifo_generator_0_clocks.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==fifo_generator_0 || ORIG_REF_NAME==fifo_generator_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: d:/Z_MILIANKE_FPGA/0_origin/bram_dma_loop/bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ip/DMA_LOOP_blk_mem_gen_0_0/DMA_LOOP_blk_mem_gen_0_0_ooc.xdc

# XDC: d:/Z_MILIANKE_FPGA/0_origin/bram_dma_loop/bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ip/DMA_LOOP_axi_dma_0_1/DMA_LOOP_axi_dma_0_1.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==DMA_LOOP_axi_dma_0_1 || ORIG_REF_NAME==DMA_LOOP_axi_dma_0_1} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: d:/Z_MILIANKE_FPGA/0_origin/bram_dma_loop/bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ip/DMA_LOOP_axi_dma_0_1/DMA_LOOP_axi_dma_0_1_clocks.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==DMA_LOOP_axi_dma_0_1 || ORIG_REF_NAME==DMA_LOOP_axi_dma_0_1} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: d:/Z_MILIANKE_FPGA/0_origin/bram_dma_loop/bram_dma_loop.gen/sources_1/bd/DMA_LOOP/ip/DMA_LOOP_vio_0_0/DMA_LOOP_vio_0_0.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==DMA_LOOP_vio_0_0 || ORIG_REF_NAME==DMA_LOOP_vio_0_0} -quiet] -quiet

# XDC: d:/Z_MILIANKE_FPGA/0_origin/bram_dma_loop/bram_dma_loop.gen/sources_1/ip/fifo_generator_0/fifo_generator_0.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==fifo_generator_0 || ORIG_REF_NAME==fifo_generator_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: d:/Z_MILIANKE_FPGA/0_origin/bram_dma_loop/bram_dma_loop.gen/sources_1/ip/fifo_generator_0/fifo_generator_0_clocks.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==fifo_generator_0 || ORIG_REF_NAME==fifo_generator_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: d:/Z_MILIANKE_FPGA/0_origin/bram_dma_loop/bram_dma_loop.gen/sources_1/bd/DMA_LOOP/DMA_LOOP_ooc.xdc
