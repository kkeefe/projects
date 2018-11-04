vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/microblaze_v10_0_6
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/mdm_v3_2_13
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_12
vlib riviera/lmb_v10_v3_0_9
vlib riviera/lmb_bram_if_cntlr_v4_0_14
vlib riviera/blk_mem_gen_v8_4_1
vlib riviera/axis_infrastructure_v1_1_0
vlib riviera/fifo_generator_v13_2_2
vlib riviera/axis_data_fifo_v1_1_17
vlib riviera/axis_register_slice_v1_1_16
vlib riviera/axis_dwidth_converter_v1_1_15
vlib riviera/iomodule_v3_1_3
vlib riviera/axis_switch_v1_1_16

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap microblaze_v10_0_6 riviera/microblaze_v10_0_6
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap mdm_v3_2_13 riviera/mdm_v3_2_13
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_12 riviera/proc_sys_reset_v5_0_12
vmap lmb_v10_v3_0_9 riviera/lmb_v10_v3_0_9
vmap lmb_bram_if_cntlr_v4_0_14 riviera/lmb_bram_if_cntlr_v4_0_14
vmap blk_mem_gen_v8_4_1 riviera/blk_mem_gen_v8_4_1
vmap axis_infrastructure_v1_1_0 riviera/axis_infrastructure_v1_1_0
vmap fifo_generator_v13_2_2 riviera/fifo_generator_v13_2_2
vmap axis_data_fifo_v1_1_17 riviera/axis_data_fifo_v1_1_17
vmap axis_register_slice_v1_1_16 riviera/axis_register_slice_v1_1_16
vmap axis_dwidth_converter_v1_1_15 riviera/axis_dwidth_converter_v1_1_15
vmap iomodule_v3_1_3 riviera/iomodule_v3_1_3
vmap axis_switch_v1_1_16 riviera/axis_switch_v1_1_16

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v10_0_6 -93 \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/6141/hdl/microblaze_v10_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/base_mb/ip/base_mb_microblaze_0_0/sim/base_mb_microblaze_0_0.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/cced/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work mdm_v3_2_13 -93 \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/351e/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/base_mb/ip/base_mb_mdm_1_0/sim/base_mb_mdm_1_0.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_12 -93 \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/base_mb/ip/base_mb_rst_clk_wiz_1_100M_0/sim/base_mb_rst_clk_wiz_1_100M_0.vhd" \

vcom -work lmb_v10_v3_0_9 -93 \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/78eb/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/base_mb/ip/base_mb_dlmb_v10_0/sim/base_mb_dlmb_v10_0.vhd" \
"../../../bd/base_mb/ip/base_mb_ilmb_v10_0/sim/base_mb_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_14 -93 \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/226d/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/base_mb/ip/base_mb_dlmb_bram_if_cntlr_0/sim/base_mb_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/base_mb/ip/base_mb_ilmb_bram_if_cntlr_0/sim/base_mb_ilmb_bram_if_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_1  -v2k5 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/67d8/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../bd/base_mb/ip/base_mb_lmb_bram_0/sim/base_mb_lmb_bram_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/base_mb/sim/base_mb.vhd" \

vlog -work axis_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_2  -v2k5 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/7aff/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_2 -93 \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_2  -v2k5 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axis_data_fifo_v1_1_17  -v2k5 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/36f8/hdl/axis_data_fifo_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../bd/base_mb/ip/base_mb_axis_data_fifo_0_0/sim/base_mb_axis_data_fifo_0_0.v" \

vlog -work axis_register_slice_v1_1_16  -v2k5 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/000e/hdl/axis_register_slice_v1_1_vl_rfs.v" \

vlog -work axis_dwidth_converter_v1_1_15  -v2k5 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/052c/hdl/axis_dwidth_converter_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../bd/base_mb/ip/base_mb_axis_dwidth_converter_0_0/sim/base_mb_axis_dwidth_converter_0_0.v" \
"../../../bd/base_mb/ip/base_mb_axis_dwidth_converter_1_0/sim/base_mb_axis_dwidth_converter_1_0.v" \
"../../../bd/base_mb/ip/base_mb_axis_data_fifo_1_0/sim/base_mb_axis_data_fifo_1_0.v" \

vcom -work iomodule_v3_1_3 -93 \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/ca2b/hdl/iomodule_v3_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/base_mb/ip/base_mb_iomodule_0_0/sim/base_mb_iomodule_0_0.vhd" \

vlog -work axis_switch_v1_1_16  -v2k5 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/bba4/hdl/axis_switch_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" "+incdir+../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl" \
"../../../bd/base_mb/ip/base_mb_axis_switch_0_0/sim/base_mb_axis_switch_0_0.v" \
"../../../bd/base_mb/ip/base_mb_axis_data_fifo_2_0/sim/base_mb_axis_data_fifo_2_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

