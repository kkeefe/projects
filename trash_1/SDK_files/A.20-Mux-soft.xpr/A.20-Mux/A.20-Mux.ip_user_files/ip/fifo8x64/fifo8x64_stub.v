// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Sat Sep 15 20:42:35 2018
// Host        : olorin running 64-bit Devuan GNU/Linux 2.0 (ascii)
// Command     : write_verilog -force -mode synth_stub
//               /home/twili/kurtis_work/A.20-Skeleton/A.20-Skeleton.srcs/sources_1/ip/fifo8x64/fifo8x64_stub.v
// Design      : fifo8x64
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_2,Vivado 2018.1" *)
module fifo8x64(clk, srst, din, wr_en, rd_en, dout, full, empty, 
  almost_empty, valid)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[7:0],wr_en,rd_en,dout[7:0],full,empty,almost_empty,valid" */;
  input clk;
  input srst;
  input [7:0]din;
  input wr_en;
  input rd_en;
  output [7:0]dout;
  output full;
  output empty;
  output almost_empty;
  output valid;
endmodule
