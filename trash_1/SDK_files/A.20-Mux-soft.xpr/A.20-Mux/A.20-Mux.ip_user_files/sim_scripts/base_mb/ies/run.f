-makelib ies_lib/xil_defaultlib -sv \
  "/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/microblaze_v10_0_6 \
  "../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/6141/hdl/microblaze_v10_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/base_mb/ip/base_mb_microblaze_0_0/sim/base_mb_microblaze_0_0.vhd" \
-endlib
-makelib ies_lib/axi_lite_ipif_v3_0_4 \
  "../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/cced/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/mdm_v3_2_13 \
  "../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/351e/hdl/mdm_v3_2_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/base_mb/ip/base_mb_mdm_1_0/sim/base_mb_mdm_1_0.vhd" \
-endlib
-makelib ies_lib/lib_cdc_v1_0_2 \
  "../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/proc_sys_reset_v5_0_12 \
  "../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/base_mb/ip/base_mb_rst_clk_wiz_1_100M_0/sim/base_mb_rst_clk_wiz_1_100M_0.vhd" \
-endlib
-makelib ies_lib/lmb_v10_v3_0_9 \
  "../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/78eb/hdl/lmb_v10_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/base_mb/ip/base_mb_dlmb_v10_0/sim/base_mb_dlmb_v10_0.vhd" \
  "../../../bd/base_mb/ip/base_mb_ilmb_v10_0/sim/base_mb_ilmb_v10_0.vhd" \
-endlib
-makelib ies_lib/lmb_bram_if_cntlr_v4_0_14 \
  "../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/226d/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/base_mb/ip/base_mb_dlmb_bram_if_cntlr_0/sim/base_mb_dlmb_bram_if_cntlr_0.vhd" \
  "../../../bd/base_mb/ip/base_mb_ilmb_bram_if_cntlr_0/sim/base_mb_ilmb_bram_if_cntlr_0.vhd" \
-endlib
-makelib ies_lib/blk_mem_gen_v8_4_1 \
  "../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/67d8/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/base_mb/ip/base_mb_lmb_bram_0/sim/base_mb_lmb_bram_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/base_mb/sim/base_mb.vhd" \
-endlib
-makelib ies_lib/axis_infrastructure_v1_1_0 \
  "../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/0ab1/hdl/axis_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_2 \
  "../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/7aff/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_2 \
  "../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_2 \
  "../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib ies_lib/axis_data_fifo_v1_1_17 \
  "../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/36f8/hdl/axis_data_fifo_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/base_mb/ip/base_mb_axis_data_fifo_0_0/sim/base_mb_axis_data_fifo_0_0.v" \
-endlib
-makelib ies_lib/axis_register_slice_v1_1_16 \
  "../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/000e/hdl/axis_register_slice_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axis_dwidth_converter_v1_1_15 \
  "../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/052c/hdl/axis_dwidth_converter_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/base_mb/ip/base_mb_axis_dwidth_converter_0_0/sim/base_mb_axis_dwidth_converter_0_0.v" \
  "../../../bd/base_mb/ip/base_mb_axis_dwidth_converter_1_0/sim/base_mb_axis_dwidth_converter_1_0.v" \
  "../../../bd/base_mb/ip/base_mb_axis_data_fifo_1_0/sim/base_mb_axis_data_fifo_1_0.v" \
-endlib
-makelib ies_lib/iomodule_v3_1_3 \
  "../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/ca2b/hdl/iomodule_v3_1_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/base_mb/ip/base_mb_iomodule_0_0/sim/base_mb_iomodule_0_0.vhd" \
-endlib
-makelib ies_lib/axis_switch_v1_1_16 \
  "../../../../A.20-Mux.srcs/sources_1/bd/base_mb/ipshared/bba4/hdl/axis_switch_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/base_mb/ip/base_mb_axis_switch_0_0/sim/base_mb_axis_switch_0_0.v" \
  "../../../bd/base_mb/ip/base_mb_axis_data_fifo_2_0/sim/base_mb_axis_data_fifo_2_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

