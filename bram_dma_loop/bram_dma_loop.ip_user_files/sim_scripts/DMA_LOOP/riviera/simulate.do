onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+DMA_LOOP -L xpm -L blk_mem_gen_v8_4_5 -L xil_defaultlib -L axi_bram_ctrl_v4_1_6 -L xbip_utils_v3_0_10 -L c_reg_fd_v12_0_6 -L c_mux_bit_v12_0_6 -L c_shift_ram_v12_0_14 -L lib_pkg_v1_0_2 -L fifo_generator_v13_2_7 -L lib_fifo_v1_0_16 -L lib_srl_fifo_v1_0_2 -L lib_cdc_v1_0_2 -L axi_datamover_v5_1_28 -L axi_sg_v4_1_15 -L axi_dma_v7_1_27 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.DMA_LOOP xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {DMA_LOOP.udo}

run -all

endsim

quit -force
