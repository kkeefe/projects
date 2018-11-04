-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
-- Date        : Sun Sep 23 19:31:33 2018
-- Host        : olorin running 64-bit Devuan GNU/Linux 2.0 (ascii)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/twili/xilinx_projects/A.20-AC701-uBlaze-ExplicitStrip/A.20-AC701-uBlaze-ExplicitStrip.srcs/sources_1/ip/GtpA7GbE/GtpA7GbE_stub.vhdl
-- Design      : GtpA7GbE
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GtpA7GbE is
  Port ( 
    SOFT_RESET_TX_IN : in STD_LOGIC;
    SOFT_RESET_RX_IN : in STD_LOGIC;
    DONT_RESET_ON_DATA_ERROR_IN : in STD_LOGIC;
    Q0_CLK0_GTREFCLK_PAD_N_IN : in STD_LOGIC;
    Q0_CLK0_GTREFCLK_PAD_P_IN : in STD_LOGIC;
    GT0_TX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT0_RX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT0_DATA_VALID_IN : in STD_LOGIC;
    GT0_TXUSRCLK_OUT : out STD_LOGIC;
    GT0_TXUSRCLK2_OUT : out STD_LOGIC;
    GT0_RXUSRCLK_OUT : out STD_LOGIC;
    GT0_RXUSRCLK2_OUT : out STD_LOGIC;
    gt0_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt0_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpen_in : in STD_LOGIC;
    gt0_drprdy_out : out STD_LOGIC;
    gt0_drpwe_in : in STD_LOGIC;
    gt0_loopback_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_txpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_eyescanreset_in : in STD_LOGIC;
    gt0_rxuserrdy_in : in STD_LOGIC;
    gt0_eyescandataerror_out : out STD_LOGIC;
    gt0_eyescantrigger_in : in STD_LOGIC;
    gt0_rxcdrhold_in : in STD_LOGIC;
    gt0_rxclkcorcnt_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxdata_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_rxprbserr_out : out STD_LOGIC;
    gt0_rxprbssel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_rxprbscntreset_in : in STD_LOGIC;
    gt0_rxchariscomma_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxcharisk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_gtprxn_in : in STD_LOGIC;
    gt0_gtprxp_in : in STD_LOGIC;
    gt0_rxbufreset_in : in STD_LOGIC;
    gt0_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_rxbyteisaligned_out : out STD_LOGIC;
    gt0_rxbyterealign_out : out STD_LOGIC;
    gt0_rxcommadet_out : out STD_LOGIC;
    gt0_rxmcommaalignen_in : in STD_LOGIC;
    gt0_rxpcommaalignen_in : in STD_LOGIC;
    gt0_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt0_rxlpmhfhold_in : in STD_LOGIC;
    gt0_rxlpmhfovrden_in : in STD_LOGIC;
    gt0_rxlpmlfhold_in : in STD_LOGIC;
    gt0_rxoutclkfabric_out : out STD_LOGIC;
    gt0_gtrxreset_in : in STD_LOGIC;
    gt0_rxlpmreset_in : in STD_LOGIC;
    gt0_rxpcsreset_in : in STD_LOGIC;
    gt0_rxpmareset_in : in STD_LOGIC;
    gt0_rxpolarity_in : in STD_LOGIC;
    gt0_rxresetdone_out : out STD_LOGIC;
    gt0_txpostcursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt0_txprecursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt0_gttxreset_in : in STD_LOGIC;
    gt0_txuserrdy_in : in STD_LOGIC;
    gt0_txdata_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_txelecidle_in : in STD_LOGIC;
    gt0_txprbsforceerr_in : in STD_LOGIC;
    gt0_txchardispmode_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_txchardispval_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_txcharisk_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_txbufstatus_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_gtptxn_out : out STD_LOGIC;
    gt0_gtptxp_out : out STD_LOGIC;
    gt0_txdiffctrl_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gt0_txinhibit_in : in STD_LOGIC;
    gt0_txoutclkfabric_out : out STD_LOGIC;
    gt0_txoutclkpcs_out : out STD_LOGIC;
    gt0_txpcsreset_in : in STD_LOGIC;
    gt0_txpmareset_in : in STD_LOGIC;
    gt0_txresetdone_out : out STD_LOGIC;
    gt0_txpolarity_in : in STD_LOGIC;
    gt0_txprbssel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    GT0_PLL0RESET_OUT : out STD_LOGIC;
    GT0_PLL0OUTCLK_OUT : out STD_LOGIC;
    GT0_PLL0OUTREFCLK_OUT : out STD_LOGIC;
    GT0_PLL0LOCK_OUT : out STD_LOGIC;
    GT0_PLL0REFCLKLOST_OUT : out STD_LOGIC;
    GT0_PLL1OUTCLK_OUT : out STD_LOGIC;
    GT0_PLL1OUTREFCLK_OUT : out STD_LOGIC;
    sysclk_in : in STD_LOGIC
  );

end GtpA7GbE;

architecture stub of GtpA7GbE is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "SOFT_RESET_TX_IN,SOFT_RESET_RX_IN,DONT_RESET_ON_DATA_ERROR_IN,Q0_CLK0_GTREFCLK_PAD_N_IN,Q0_CLK0_GTREFCLK_PAD_P_IN,GT0_TX_FSM_RESET_DONE_OUT,GT0_RX_FSM_RESET_DONE_OUT,GT0_DATA_VALID_IN,GT0_TXUSRCLK_OUT,GT0_TXUSRCLK2_OUT,GT0_RXUSRCLK_OUT,GT0_RXUSRCLK2_OUT,gt0_drpaddr_in[8:0],gt0_drpdi_in[15:0],gt0_drpdo_out[15:0],gt0_drpen_in,gt0_drprdy_out,gt0_drpwe_in,gt0_loopback_in[2:0],gt0_rxpd_in[1:0],gt0_txpd_in[1:0],gt0_eyescanreset_in,gt0_rxuserrdy_in,gt0_eyescandataerror_out,gt0_eyescantrigger_in,gt0_rxcdrhold_in,gt0_rxclkcorcnt_out[1:0],gt0_rxdata_out[15:0],gt0_rxprbserr_out,gt0_rxprbssel_in[2:0],gt0_rxprbscntreset_in,gt0_rxchariscomma_out[1:0],gt0_rxcharisk_out[1:0],gt0_rxdisperr_out[1:0],gt0_rxnotintable_out[1:0],gt0_gtprxn_in,gt0_gtprxp_in,gt0_rxbufreset_in,gt0_rxbufstatus_out[2:0],gt0_rxbyteisaligned_out,gt0_rxbyterealign_out,gt0_rxcommadet_out,gt0_rxmcommaalignen_in,gt0_rxpcommaalignen_in,gt0_dmonitorout_out[14:0],gt0_rxlpmhfhold_in,gt0_rxlpmhfovrden_in,gt0_rxlpmlfhold_in,gt0_rxoutclkfabric_out,gt0_gtrxreset_in,gt0_rxlpmreset_in,gt0_rxpcsreset_in,gt0_rxpmareset_in,gt0_rxpolarity_in,gt0_rxresetdone_out,gt0_txpostcursor_in[4:0],gt0_txprecursor_in[4:0],gt0_gttxreset_in,gt0_txuserrdy_in,gt0_txdata_in[15:0],gt0_txelecidle_in,gt0_txprbsforceerr_in,gt0_txchardispmode_in[1:0],gt0_txchardispval_in[1:0],gt0_txcharisk_in[1:0],gt0_txbufstatus_out[1:0],gt0_gtptxn_out,gt0_gtptxp_out,gt0_txdiffctrl_in[3:0],gt0_txinhibit_in,gt0_txoutclkfabric_out,gt0_txoutclkpcs_out,gt0_txpcsreset_in,gt0_txpmareset_in,gt0_txresetdone_out,gt0_txpolarity_in,gt0_txprbssel_in[2:0],GT0_PLL0RESET_OUT,GT0_PLL0OUTCLK_OUT,GT0_PLL0OUTREFCLK_OUT,GT0_PLL0LOCK_OUT,GT0_PLL0REFCLKLOST_OUT,GT0_PLL1OUTCLK_OUT,GT0_PLL1OUTREFCLK_OUT,sysclk_in";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "GtpA7GbE,gtwizard_v3_6_9,{protocol_file=gigabit_ethernet_CC}";
begin
end;
