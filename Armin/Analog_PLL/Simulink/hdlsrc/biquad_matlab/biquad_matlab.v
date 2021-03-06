// -------------------------------------------------------------
// 
// File Name: hdlsrc\biquad_matlab\biquad_matlab.v
// Created: 2022-05-03 11:57:31
// 
// Generated by MATLAB 9.12 and HDL Coder 3.20
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 0.2
// Target subsystem base rate: 0.2
// 
// 
// Clock Enable  Sample Time
// -- -------------------------------------------------------------
// ce_out        0.2
// -- -------------------------------------------------------------
// 
// 
// Output Signal                 Clock Enable  Sample Time
// -- -------------------------------------------------------------
// Out1                          ce_out        0.2
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: biquad_matlab
// Source Path: biquad_matlab
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module biquad_matlab
          (clk,
           reset,
           clk_enable,
           In1,
           In3_0,
           In3_1,
           In3_2,
           In2_0,
           In2_1,
           In4_0,
           In4_1,
           ce_out,
           Out1);


  input   clk;
  input   reset;
  input   clk_enable;
  input   signed [15:0] In1;  // int16
  input   signed [15:0] In3_0;  // int16
  input   signed [15:0] In3_1;  // int16
  input   signed [15:0] In3_2;  // int16
  input   signed [15:0] In2_0;  // int16
  input   signed [15:0] In2_1;  // int16
  input   signed [15:0] In4_0;  // int16
  input   signed [15:0] In4_1;  // int16
  output  ce_out;
  output  signed [15:0] Out1;  // int16


  wire signed [15:0] Biquad_Filter_out1;  // int16


  Biquad_Filter u_Biquad_Filter (.clk(clk),
                                 .reset(reset),
                                 .enb(clk_enable),
                                 .Biquad_Filter_in(In1),  // int16
                                 .Biquad_Filter_num_0(In3_0),  // int16
                                 .Biquad_Filter_num_1(In3_1),  // int16
                                 .Biquad_Filter_num_2(In3_2),  // int16
                                 .Biquad_Filter_den_0(In2_0),  // int16
                                 .Biquad_Filter_den_1(In2_1),  // int16
                                 .Biquad_Filter_g_0(In4_0),  // int16
                                 .Biquad_Filter_g_1(In4_1),  // int16
                                 .Biquad_Filter_out(Biquad_Filter_out1)  // int16
                                 );

  assign Out1 = Biquad_Filter_out1;

  assign ce_out = clk_enable;

endmodule  // biquad_matlab

