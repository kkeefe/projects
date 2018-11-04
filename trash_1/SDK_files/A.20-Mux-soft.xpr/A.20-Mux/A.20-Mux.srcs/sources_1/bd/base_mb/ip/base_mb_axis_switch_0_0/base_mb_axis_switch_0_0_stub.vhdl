-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
-- Date        : Fri Oct 19 18:05:25 2018
-- Host        : olorin running 64-bit Devuan GNU/Linux 2.0 (ascii)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/twili/xilinx_projects/A.20-Mux/A.20-Mux.srcs/sources_1/bd/base_mb/ip/base_mb_axis_switch_0_0/base_mb_axis_switch_0_0_stub.vhdl
-- Design      : base_mb_axis_switch_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity base_mb_axis_switch_0_0 is
  Port ( 
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_req_suppress : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_decode_err : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );

end base_mb_axis_switch_0_0;

architecture stub of base_mb_axis_switch_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aclk,aresetn,s_axis_tvalid[1:0],s_axis_tready[1:0],s_axis_tdata[15:0],s_axis_tlast[1:0],m_axis_tvalid[0:0],m_axis_tready[0:0],m_axis_tdata[7:0],m_axis_tlast[0:0],s_req_suppress[1:0],s_decode_err[1:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "axis_switch_v1_1_16_axis_switch,Vivado 2018.1";
begin
end;
