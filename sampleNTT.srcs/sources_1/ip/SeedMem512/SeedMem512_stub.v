// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Wed Apr  9 14:13:15 2025
// Host        : rourab running 64-bit Ubuntu 24.04.2 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/rourab/Documents/sampleNTT/sampleNTT.srcs/sources_1/ip/SeedMem512/SeedMem512_stub.v
// Design      : SeedMem512
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_12,Vivado 2018.3" *)
module SeedMem512(a, clk, spo)
/* synthesis syn_black_box black_box_pad_pin="a[8:0],clk,spo[7:0]" */;
  input [8:0]a;
  input clk;
  output [7:0]spo;
endmodule
