-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
-- Date        : Sat Sep 15 20:42:54 2018
-- Host        : olorin running 64-bit Devuan GNU/Linux 2.0 (ascii)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/twili/kurtis_work/A.20-Skeleton/A.20-Skeleton.srcs/sources_1/ip/fifo18x16/fifo18x16_stub.vhdl
-- Design      : fifo18x16
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fifo18x16 is
  Port ( 
    rst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 17 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 17 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    valid : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );

end fifo18x16;

architecture stub of fifo18x16 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "rst,wr_clk,rd_clk,din[17:0],wr_en,rd_en,dout[17:0],full,empty,valid,wr_rst_busy,rd_rst_busy";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "fifo_generator_v13_2_2,Vivado 2018.1";
begin
end;
