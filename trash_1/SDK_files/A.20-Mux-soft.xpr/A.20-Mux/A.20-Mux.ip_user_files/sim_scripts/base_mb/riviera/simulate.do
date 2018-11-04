onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+base_mb -L xil_defaultlib -L xpm -L microblaze_v10_0_6 -L axi_lite_ipif_v3_0_4 -L mdm_v3_2_13 -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_12 -L lmb_v10_v3_0_9 -L lmb_bram_if_cntlr_v4_0_14 -L blk_mem_gen_v8_4_1 -L axis_infrastructure_v1_1_0 -L fifo_generator_v13_2_2 -L axis_data_fifo_v1_1_17 -L axis_register_slice_v1_1_16 -L axis_dwidth_converter_v1_1_15 -L iomodule_v3_1_3 -L axis_switch_v1_1_16 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.base_mb xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {base_mb.udo}

run -all

endsim

quit -force
