//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
//Date        : Thu Jun 25 10:37:40 2020
//Host        : lsa running 64-bit Ubuntu 18.04.4 LTS
//Command     : generate_target axis_s_const.bd
//Design      : axis_s_const
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "axis_s_const,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=axis_s_const,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "axis_s_const.hwdef" *) 
module axis_s_const
   (data_o,
    ready_i,
    valid_o);
  output [31:0]data_o;
  input ready_i;
  output [0:0]valid_o;

  wire [31:0]data_o_dout;
  wire [0:0]valid_o_dout;

  assign data_o[31:0] = data_o_dout;
  assign valid_o[0] = valid_o_dout;
  axis_s_const_data_const_0 data_const
       (.dout(data_o_dout));
  axis_s_const_valid_const_0 valid_const
       (.dout(valid_o_dout));
endmodule
