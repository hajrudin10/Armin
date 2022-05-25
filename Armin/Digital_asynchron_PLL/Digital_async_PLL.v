// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
// CREATED		"Wed Oct 27 11:19:39 2021"

module Digital_async_PLL(
	fref,
	fdiv,
	adder_out
);


input wire	fref;
input wire	fdiv;
output wire	[1:0] adder_out;

reg	down;
wire	pd_rst;
reg	up;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_5 = 1;
assign	SYNTHESIZED_WIRE_6 = 1;





assign	SYNTHESIZED_WIRE_0 = up & down;


adder2bit	b2v_inst4(
	.a(up),
	.b(down),
	.sum(adder_out));

assign	pd_rst =  ~SYNTHESIZED_WIRE_0;


always@(posedge fref or negedge pd_rst or negedge SYNTHESIZED_WIRE_5)
begin
if (!pd_rst)
	begin
	up <= 0;
	end
else
if (!SYNTHESIZED_WIRE_5)
	begin
	up <= 1;
	end
else
	begin
	up <= SYNTHESIZED_WIRE_5;
	end
end


always@(posedge fdiv or negedge pd_rst or negedge SYNTHESIZED_WIRE_6)
begin
if (!pd_rst)
	begin
	down <= 0;
	end
else
if (!SYNTHESIZED_WIRE_6)
	begin
	down <= 1;
	end
else
	begin
	down <= SYNTHESIZED_WIRE_6;
	end
end


endmodule
