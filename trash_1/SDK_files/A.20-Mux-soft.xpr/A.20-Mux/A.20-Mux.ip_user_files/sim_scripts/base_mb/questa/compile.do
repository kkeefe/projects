vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm
vlib questa_lib/msim/microblaze_v10_0_6
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/mdm_v3_2_13
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/proc_sys_reset_v5_0_12
vlib questa_lib/msim/lmb_v10_v3_0_9
vlib questa_lib/msim/lmb_bram_if_cntlr_v4_0_14
vlib questa_lib/msim/blk_mem_gen_v8_4_1
vlib questa_lib/msim/axis_infrastructure_v1_1_0
vlib questa_lib/msim/fifo_generator_v13_2_2
vlib questa_lib/msim/axis_data_fifo_v1_1_17
vlib questa_lib/msim/axis_register_slice_v1_1_16
vlib questa_lib/msim/axis_dwidth_converter_v1_1_15
vlib questa_lib/msim/iomodule_v3_1_3
vlib questa_lib/msim/axis_switch_v1_1_16

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm
vmap microblaze_v10_0_6 questa_lib/msim/microblaze_v10_0_6
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap mdm_v3_2_13 questa_lib/msim/mdm_v3_2_13
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_12 questa_lib/msim/proc_sys_reset_v5_0_12
vmap lmb_v10_v3_0_9 questa_lib/msim/lmb_v10_v3_0_9
vmap lmb_bram_if_cntlr_v4_0_14 questa_lib/msim/lmb_bram_if_cntlr_v4_0_14
vmap blk_mem_gen_v8_4_1 questa_lib/msim/blk_mem_gen_v8_4_1
vmap axis_infrastructure_v1_1_0 questa_lib/msim/axis_infrastructure_v1_1_0
vmap fifo_generator_v13_2_2 questa_lib/msim/fifo_generator_v13_2_2
vmap axis_data_fifo_v1_1_17 questa_lib/msim/axis_data_fifo_v1_1_17
vmap axis_register_slice_v1_1_16 questa_lib/msim/axis_register_slice_v1_1_16
vmap axis_dwidth_converter_v1_1_15 questa_lib/msim/axis_dwidth_converter_v1_1_15
vmap iomodule_v3_1_3 questa_lib/msim/iomodule_v3_1_3
vmap axis_switch_v1_1_16 questa_lib/msim/axis_switch_v1_1_16

vlog -work xil_defaultlib -64 -sv "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v10_0_6 -64 -93 \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/6141/hdl/microblaze_v10_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/base_mb/ip/base_mb_microblaze_0_0/sim/base_mb_microblaze_0_0.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/cced/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work mdm_v3_2_13 -64 -93 \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/351e/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/base_mb/ip/base_mb_mdm_1_0/sim/base_mb_mdm_1_0.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_12 -64 -93 \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/base_mb/ip/base_mb_rst_clk_wiz_1_100M_0/sim/base_mb_rst_clk_wiz_1_100M_0.vhd" \

vcom -work lmb_v10_v3_0_9 -64 -93 \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/78eb/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/base_mb/ip/base_mb_dlmb_v10_0/sim/base_mb_dlmb_v10_0.vhd" \
"../../../bd/base_mb/ip/base_mb_ilmb_v10_0/sim/base_mb_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_14 -64 -93 \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/226d/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/base_mb/ip/base_mb_dlmb_bram_if_cntlr_0/sim/base_mb_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/base_mb/ip/base_mb_ilmb_bram_if_cntlr_0/sim/base_mb_ilmb_bram_if_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_1 -64 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/67d8/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../bd/base_mb/ip/base_mb_lmb_bram_0/sim/base_mb_lmb_bram_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/base_mb/sim/base_mb.vhd" \

vlog -work axis_infrastructure_v1_1_0 -64 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_2 -64 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/7aff/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_2 -64 -93 \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_2 -64 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axis_data_fifo_v1_1_17 -64 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/36f8/hdl/axis_data_fifo_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../bd/base_mb/ip/base_mb_axis_data_fifo_0_0/sim/base_mb_axis_data_fifo_0_0.v" \

vlog -work axis_register_slice_v1_1_16 -64 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/000e/hdl/axis_register_slice_v1_1_vl_rfs.v" \

vlog -work axis_dwidth_converter_v1_1_15 -64 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/052c/hdl/axis_dwidth_converter_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../bd/base_mb/ip/base_mb_axis_dwidth_converter_0_0/sim/base_mb_axis_dwidth_converter_0_0.v" \
"../../../bd/base_mb/ip/base_mb_axis_dwidth_converter_1_0/sim/base_mb_axis_dwidth_converter_1_0.v" \
"../../../bd/base_mb/ip/base_mb_axis_data_fifo_1_0/sim/base_mb_axis_data_fifo_1_0.v" \

vcom -work iomodule_v3_1_3 -64 -93 \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/ca2b/hdl/iomodule_v3_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/base_mb/ip/base_mb_iomodule_0_0/sim/base_mb_iomodule_0_0.vhd" \

vlog -work axis_switch_v1_1_16 -64 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/bba4/hdl/axis_switch_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../bd/base_mb/ip/base_mb_axis_switch_0_0/sim/base_mb_axis_switch_0_0.v" \
"../../../bd/base_mb/ip/base_mb_axis_data_fifo_2_0/sim/base_mb_axis_data_fifo_2_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

