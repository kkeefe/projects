vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm

vlog -work xil_defaultlib  -sv2k12 \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../A.20-AC701-uBlaze-ExplicitStrip.srcs/sources_1/ip/GtpA7GbE/gtpa7gbe_common_reset.vhd" \
"../../../../A.20-AC701-uBlaze-ExplicitStrip.srcs/sources_1/ip/GtpA7GbE/gtpa7gbe_common.vhd" \
"../../../../A.20-AC701-uBlaze-ExplicitStrip.srcs/sources_1/ip/GtpA7GbE/gtpa7gbe_gt_usrclk_source.vhd" \
"../../../../A.20-AC701-uBlaze-ExplicitStrip.srcs/sources_1/ip/GtpA7GbE/gtpa7gbe_support.vhd" \
"../../../../A.20-AC701-uBlaze-ExplicitStrip.srcs/sources_1/ip/GtpA7GbE/gtpa7gbe_cpll_railing.vhd" \
"../../../../A.20-AC701-uBlaze-ExplicitStrip.srcs/sources_1/ip/GtpA7GbE/GtpA7GbE/example_design/gtpa7gbe_tx_startup_fsm.vhd" \
"../../../../A.20-AC701-uBlaze-ExplicitStrip.srcs/sources_1/ip/GtpA7GbE/GtpA7GbE/example_design/gtpa7gbe_rx_startup_fsm.vhd" \
"../../../../A.20-AC701-uBlaze-ExplicitStrip.srcs/sources_1/ip/GtpA7GbE/gtpa7gbe_init.vhd" \
"../../../../A.20-AC701-uBlaze-ExplicitStrip.srcs/sources_1/ip/GtpA7GbE/gtpa7gbe_gt.vhd" \
"../../../../A.20-AC701-uBlaze-ExplicitStrip.srcs/sources_1/ip/GtpA7GbE/gtpa7gbe_multi_gt.vhd" \
"../../../../A.20-AC701-uBlaze-ExplicitStrip.srcs/sources_1/ip/GtpA7GbE/GtpA7GbE/example_design/gtpa7gbe_gtrxreset_seq.vhd" \
"../../../../A.20-AC701-uBlaze-ExplicitStrip.srcs/sources_1/ip/GtpA7GbE/GtpA7GbE/example_design/gtpa7gbe_rxpmarst_seq.vhd" \
"../../../../A.20-AC701-uBlaze-ExplicitStrip.srcs/sources_1/ip/GtpA7GbE/GtpA7GbE/example_design/gtpa7gbe_rxrate_seq.vhd" \
"../../../../A.20-AC701-uBlaze-ExplicitStrip.srcs/sources_1/ip/GtpA7GbE/GtpA7GbE/example_design/gtpa7gbe_sync_block.vhd" \
"../../../../A.20-AC701-uBlaze-ExplicitStrip.srcs/sources_1/ip/GtpA7GbE/gtpa7gbe.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

