// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Sun Sep 23 19:31:32 2018
// Host        : olorin running 64-bit Devuan GNU/Linux 2.0 (ascii)
// Command     : write_verilog -force -mode synth_stub
//               /home/twili/xilinx_projects/A.20-AC701-uBlaze-ExplicitStrip/A.20-AC701-uBlaze-ExplicitStrip.srcs/sources_1/ip/GtpA7GbE/GtpA7GbE_stub.v
// Design      : GtpA7GbE
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "GtpA7GbE,gtwizard_v3_6_9,{protocol_file=gigabit_ethernet_CC}" *)
module GtpA7GbE(SOFT_RESET_TX_IN, SOFT_RESET_RX_IN, 
  DONT_RESET_ON_DATA_ERROR_IN, Q0_CLK0_GTREFCLK_PAD_N_IN, Q0_CLK0_GTREFCLK_PAD_P_IN, 
  GT0_TX_FSM_RESET_DONE_OUT, GT0_RX_FSM_RESET_DONE_OUT, GT0_DATA_VALID_IN, 
  GT0_TXUSRCLK_OUT, GT0_TXUSRCLK2_OUT, GT0_RXUSRCLK_OUT, GT0_RXUSRCLK2_OUT, gt0_drpaddr_in, 
  gt0_drpdi_in, gt0_drpdo_out, gt0_drpen_in, gt0_drprdy_out, gt0_drpwe_in, gt0_loopback_in, 
  gt0_rxpd_in, gt0_txpd_in, gt0_eyescanreset_in, gt0_rxuserrdy_in, 
  gt0_eyescandataerror_out, gt0_eyescantrigger_in, gt0_rxcdrhold_in, gt0_rxclkcorcnt_out, 
  gt0_rxdata_out, gt0_rxprbserr_out, gt0_rxprbssel_in, gt0_rxprbscntreset_in, 
  gt0_rxchariscomma_out, gt0_rxcharisk_out, gt0_rxdisperr_out, gt0_rxnotintable_out, 
  gt0_gtprxn_in, gt0_gtprxp_in, gt0_rxbufreset_in, gt0_rxbufstatus_out, 
  gt0_rxbyteisaligned_out, gt0_rxbyterealign_out, gt0_rxcommadet_out, 
  gt0_rxmcommaalignen_in, gt0_rxpcommaalignen_in, gt0_dmonitorout_out, 
  gt0_rxlpmhfhold_in, gt0_rxlpmhfovrden_in, gt0_rxlpmlfhold_in, gt0_rxoutclkfabric_out, 
  gt0_gtrxreset_in, gt0_rxlpmreset_in, gt0_rxpcsreset_in, gt0_rxpmareset_in, 
  gt0_rxpolarity_in, gt0_rxresetdone_out, gt0_txpostcursor_in, gt0_txprecursor_in, 
  gt0_gttxreset_in, gt0_txuserrdy_in, gt0_txdata_in, gt0_txelecidle_in, 
  gt0_txprbsforceerr_in, gt0_txchardispmode_in, gt0_txchardispval_in, gt0_txcharisk_in, 
  gt0_txbufstatus_out, gt0_gtptxn_out, gt0_gtptxp_out, gt0_txdiffctrl_in, gt0_txinhibit_in, 
  gt0_txoutclkfabric_out, gt0_txoutclkpcs_out, gt0_txpcsreset_in, gt0_txpmareset_in, 
  gt0_txresetdone_out, gt0_txpolarity_in, gt0_txprbssel_in, GT0_PLL0RESET_OUT, 
  GT0_PLL0OUTCLK_OUT, GT0_PLL0OUTREFCLK_OUT, GT0_PLL0LOCK_OUT, GT0_PLL0REFCLKLOST_OUT, 
  GT0_PLL1OUTCLK_OUT, GT0_PLL1OUTREFCLK_OUT, sysclk_in)
/* synthesis syn_black_box black_box_pad_pin="SOFT_RESET_TX_IN,SOFT_RESET_RX_IN,DONT_RESET_ON_DATA_ERROR_IN,Q0_CLK0_GTREFCLK_PAD_N_IN,Q0_CLK0_GTREFCLK_PAD_P_IN,GT0_TX_FSM_RESET_DONE_OUT,GT0_RX_FSM_RESET_DONE_OUT,GT0_DATA_VALID_IN,GT0_TXUSRCLK_OUT,GT0_TXUSRCLK2_OUT,GT0_RXUSRCLK_OUT,GT0_RXUSRCLK2_OUT,gt0_drpaddr_in[8:0],gt0_drpdi_in[15:0],gt0_drpdo_out[15:0],gt0_drpen_in,gt0_drprdy_out,gt0_drpwe_in,gt0_loopback_in[2:0],gt0_rxpd_in[1:0],gt0_txpd_in[1:0],gt0_eyescanreset_in,gt0_rxuserrdy_in,gt0_eyescandataerror_out,gt0_eyescantrigger_in,gt0_rxcdrhold_in,gt0_rxclkcorcnt_out[1:0],gt0_rxdata_out[15:0],gt0_rxprbserr_out,gt0_rxprbssel_in[2:0],gt0_rxprbscntreset_in,gt0_rxchariscomma_out[1:0],gt0_rxcharisk_out[1:0],gt0_rxdisperr_out[1:0],gt0_rxnotintable_out[1:0],gt0_gtprxn_in,gt0_gtprxp_in,gt0_rxbufreset_in,gt0_rxbufstatus_out[2:0],gt0_rxbyteisaligned_out,gt0_rxbyterealign_out,gt0_rxcommadet_out,gt0_rxmcommaalignen_in,gt0_rxpcommaalignen_in,gt0_dmonitorout_out[14:0],gt0_rxlpmhfhold_in,gt0_rxlpmhfovrden_in,gt0_rxlpmlfhold_in,gt0_rxoutclkfabric_out,gt0_gtrxreset_in,gt0_rxlpmreset_in,gt0_rxpcsreset_in,gt0_rxpmareset_in,gt0_rxpolarity_in,gt0_rxresetdone_out,gt0_txpostcursor_in[4:0],gt0_txprecursor_in[4:0],gt0_gttxreset_in,gt0_txuserrdy_in,gt0_txdata_in[15:0],gt0_txelecidle_in,gt0_txprbsforceerr_in,gt0_txchardispmode_in[1:0],gt0_txchardispval_in[1:0],gt0_txcharisk_in[1:0],gt0_txbufstatus_out[1:0],gt0_gtptxn_out,gt0_gtptxp_out,gt0_txdiffctrl_in[3:0],gt0_txinhibit_in,gt0_txoutclkfabric_out,gt0_txoutclkpcs_out,gt0_txpcsreset_in,gt0_txpmareset_in,gt0_txresetdone_out,gt0_txpolarity_in,gt0_txprbssel_in[2:0],GT0_PLL0RESET_OUT,GT0_PLL0OUTCLK_OUT,GT0_PLL0OUTREFCLK_OUT,GT0_PLL0LOCK_OUT,GT0_PLL0REFCLKLOST_OUT,GT0_PLL1OUTCLK_OUT,GT0_PLL1OUTREFCLK_OUT,sysclk_in" */;
  input SOFT_RESET_TX_IN;
  input SOFT_RESET_RX_IN;
  input DONT_RESET_ON_DATA_ERROR_IN;
  input Q0_CLK0_GTREFCLK_PAD_N_IN;
  input Q0_CLK0_GTREFCLK_PAD_P_IN;
  output GT0_TX_FSM_RESET_DONE_OUT;
  output GT0_RX_FSM_RESET_DONE_OUT;
  input GT0_DATA_VALID_IN;
  output GT0_TXUSRCLK_OUT;
  output GT0_TXUSRCLK2_OUT;
  output GT0_RXUSRCLK_OUT;
  output GT0_RXUSRCLK2_OUT;
  input [8:0]gt0_drpaddr_in;
  input [15:0]gt0_drpdi_in;
  output [15:0]gt0_drpdo_out;
  input gt0_drpen_in;
  output gt0_drprdy_out;
  input gt0_drpwe_in;
  input [2:0]gt0_loopback_in;
  input [1:0]gt0_rxpd_in;
  input [1:0]gt0_txpd_in;
  input gt0_eyescanreset_in;
  input gt0_rxuserrdy_in;
  output gt0_eyescandataerror_out;
  input gt0_eyescantrigger_in;
  input gt0_rxcdrhold_in;
  output [1:0]gt0_rxclkcorcnt_out;
  output [15:0]gt0_rxdata_out;
  output gt0_rxprbserr_out;
  input [2:0]gt0_rxprbssel_in;
  input gt0_rxprbscntreset_in;
  output [1:0]gt0_rxchariscomma_out;
  output [1:0]gt0_rxcharisk_out;
  output [1:0]gt0_rxdisperr_out;
  output [1:0]gt0_rxnotintable_out;
  input gt0_gtprxn_in;
  input gt0_gtprxp_in;
  input gt0_rxbufreset_in;
  output [2:0]gt0_rxbufstatus_out;
  output gt0_rxbyteisaligned_out;
  output gt0_rxbyterealign_out;
  output gt0_rxcommadet_out;
  input gt0_rxmcommaalignen_in;
  input gt0_rxpcommaalignen_in;
  output [14:0]gt0_dmonitorout_out;
  input gt0_rxlpmhfhold_in;
  input gt0_rxlpmhfovrden_in;
  input gt0_rxlpmlfhold_in;
  output gt0_rxoutclkfabric_out;
  input gt0_gtrxreset_in;
  input gt0_rxlpmreset_in;
  input gt0_rxpcsreset_in;
  input gt0_rxpmareset_in;
  input gt0_rxpolarity_in;
  output gt0_rxresetdone_out;
  input [4:0]gt0_txpostcursor_in;
  input [4:0]gt0_txprecursor_in;
  input gt0_gttxreset_in;
  input gt0_txuserrdy_in;
  input [15:0]gt0_txdata_in;
  input gt0_txelecidle_in;
  input gt0_txprbsforceerr_in;
  input [1:0]gt0_txchardispmode_in;
  input [1:0]gt0_txchardispval_in;
  input [1:0]gt0_txcharisk_in;
  output [1:0]gt0_txbufstatus_out;
  output gt0_gtptxn_out;
  output gt0_gtptxp_out;
  input [3:0]gt0_txdiffctrl_in;
  input gt0_txinhibit_in;
  output gt0_txoutclkfabric_out;
  output gt0_txoutclkpcs_out;
  input gt0_txpcsreset_in;
  input gt0_txpmareset_in;
  output gt0_txresetdone_out;
  input gt0_txpolarity_in;
  input [2:0]gt0_txprbssel_in;
  output GT0_PLL0RESET_OUT;
  output GT0_PLL0OUTCLK_OUT;
  output GT0_PLL0OUTREFCLK_OUT;
  output GT0_PLL0LOCK_OUT;
  output GT0_PLL0REFCLKLOST_OUT;
  output GT0_PLL1OUTCLK_OUT;
  output GT0_PLL1OUTREFCLK_OUT;
  input sysclk_in;
endmodule
