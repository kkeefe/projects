// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Mon Sep 17 15:54:56 2018
// Host        : olorin running 64-bit Devuan GNU/Linux 2.0 (ascii)
// Command     : write_verilog -force -mode synth_stub
//               /home/twili/xilinx_projects/A.20-AC701-uBlaze/A.20-AC701-uBlaze.srcs/sources_1/bd/base_mb/ip/base_mb_axis_dwidth_converter_0_0/base_mb_axis_dwidth_converter_0_0_stub.v
// Design      : base_mb_axis_dwidth_converter_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axis_dwidth_converter_v1_1_15_axis_dwidth_converter,Vivado 2018.1" *)
module base_mb_axis_dwidth_converter_0_0(aclk, aresetn, s_axis_tvalid, s_axis_tready, 
  s_axis_tdata, s_axis_tlast, m_axis_tvalid, m_axis_tready, m_axis_tdata, m_axis_tkeep, 
  m_axis_tlast)
/* synthesis syn_black_box black_box_pad_pin="aclk,aresetn,s_axis_tvalid,s_axis_tready,s_axis_tdata[7:0],s_axis_tlast,m_axis_tvalid,m_axis_tready,m_axis_tdata[31:0],m_axis_tkeep[3:0],m_axis_tlast" */;
  input aclk;
  input aresetn;
  input s_axis_tvalid;
  output s_axis_tready;
  input [7:0]s_axis_tdata;
  input s_axis_tlast;
  output m_axis_tvalid;
  input m_axis_tready;
  output [31:0]m_axis_tdata;
  output [3:0]m_axis_tkeep;
  output m_axis_tlast;
endmodule