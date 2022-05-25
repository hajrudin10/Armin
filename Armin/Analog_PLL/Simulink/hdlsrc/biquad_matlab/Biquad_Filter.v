// -------------------------------------------------------------
// 
// File Name: hdlsrc\biquad_matlab\Biquad_Filter.v
// Created: 2022-05-03 11:57:30
// 
// Generated by MATLAB 9.12 and HDL Coder 3.20
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Biquad_Filter
// Source Path: biquad_matlab/Biquad Filter
// Hierarchy Level: 1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Biquad_Filter
          (clk,
           reset,
           enb,
           Biquad_Filter_in,
           Biquad_Filter_num_0,
           Biquad_Filter_num_1,
           Biquad_Filter_num_2,
           Biquad_Filter_den_0,
           Biquad_Filter_den_1,
           Biquad_Filter_g_0,
           Biquad_Filter_g_1,
           Biquad_Filter_out);


  input   clk;
  input   reset;
  input   enb;
  input   signed [15:0] Biquad_Filter_in;  // int16
  input   signed [15:0] Biquad_Filter_num_0;  // int16
  input   signed [15:0] Biquad_Filter_num_1;  // int16
  input   signed [15:0] Biquad_Filter_num_2;  // int16
  input   signed [15:0] Biquad_Filter_den_0;  // int16
  input   signed [15:0] Biquad_Filter_den_1;  // int16
  input   signed [15:0] Biquad_Filter_g_0;  // int16
  input   signed [15:0] Biquad_Filter_g_1;  // int16
  output  signed [15:0] Biquad_Filter_out;  // int16


  wire signed [31:0] scale1;  // sfix32
  wire signed [15:0] inputconv1;  // sfix16
  wire signed [31:0] multiplier_mul_temp;  // sfix32
  wire signed [15:0] b2mul1;  // sfix16
  wire signed [31:0] multiplier_mul_temp_1;  // sfix32
  wire signed [15:0] b3mul1;  // sfix16
  wire signed [31:0] multiplier_mul_temp_2;  // sfix32
  wire signed [15:0] b1mul1;  // sfix16
  wire signed [15:0] ab1sum1;  // sfix16
  wire signed [31:0] multiplier_mul_temp_3;  // sfix32
  wire signed [15:0] a2mul1;  // sfix16
  wire signed [31:0] multiplier_mul_temp_4;  // sfix32
  wire signed [15:0] a3mul1;  // sfix16
  wire signed [16:0] Sub_1;  // sfix17
  wire signed [16:0] Sub_2;  // sfix17
  wire signed [16:0] ab3sum1_temp;  // sfix17
  wire signed [15:0] ab3sum1;  // sfix16
  reg signed [15:0] delay2_section1;  // sfix16
  wire signed [15:0] b2sum1;  // sfix16
  wire signed [16:0] Sub_4;  // sfix17
  wire signed [16:0] Sub_5;  // sfix17
  wire signed [16:0] ab2sum1_temp;  // sfix17
  wire signed [15:0] ab2sum1;  // sfix16
  reg signed [15:0] delay1_section1;  // sfix16
  wire signed [31:0] scale2;  // sfix32
  wire signed [15:0] output_typeconvert;  // sfix16


  assign scale1 = Biquad_Filter_in * Biquad_Filter_g_0;



  assign inputconv1 = scale1[15:0];



  assign multiplier_mul_temp = inputconv1 * Biquad_Filter_num_1;
  assign b2mul1 = multiplier_mul_temp[15:0];



  assign multiplier_mul_temp_1 = inputconv1 * Biquad_Filter_num_2;
  assign b3mul1 = multiplier_mul_temp_1[15:0];



  assign multiplier_mul_temp_2 = inputconv1 * Biquad_Filter_num_0;
  assign b1mul1 = multiplier_mul_temp_2[15:0];



  assign multiplier_mul_temp_3 = ab1sum1 * Biquad_Filter_den_0;
  assign a2mul1 = multiplier_mul_temp_3[15:0];



  assign multiplier_mul_temp_4 = ab1sum1 * Biquad_Filter_den_1;
  assign a3mul1 = multiplier_mul_temp_4[15:0];



  assign Sub_1 = {b3mul1[15], b3mul1};
  assign Sub_2 = {a3mul1[15], a3mul1};
  assign ab3sum1_temp = Sub_1 - Sub_2;



  assign ab3sum1 = ab3sum1_temp[15:0];



  always @(posedge clk or negedge reset)
    begin : delay_process_section1_process
      if (reset == 1'b0) begin
        delay2_section1 <= 16'sb0000000000000000;
      end
      else begin
        if (enb) begin
          delay2_section1 <= ab3sum1;
        end
      end
    end



  assign b2sum1 = b2mul1 + delay2_section1;



  assign Sub_4 = {b2sum1[15], b2sum1};
  assign Sub_5 = {a2mul1[15], a2mul1};
  assign ab2sum1_temp = Sub_4 - Sub_5;



  assign ab2sum1 = ab2sum1_temp[15:0];



  always @(posedge clk or negedge reset)
    begin : delay_process_section1_1_process
      if (reset == 1'b0) begin
        delay1_section1 <= 16'sb0000000000000000;
      end
      else begin
        if (enb) begin
          delay1_section1 <= ab2sum1;
        end
      end
    end



  assign ab1sum1 = delay1_section1 + b1mul1;



  assign scale2 = ab1sum1 * Biquad_Filter_g_1;



  assign output_typeconvert = scale2[15:0];



  assign Biquad_Filter_out = output_typeconvert;

endmodule  // Biquad_Filter

