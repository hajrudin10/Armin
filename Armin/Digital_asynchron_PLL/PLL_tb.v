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

// *****************************************************************************
// This file contains a Verilog test bench template that is freely editable to  
// suit user's needs .Comments are provided in each section to help the user    
// fill out necessary details.                                                  
// *****************************************************************************
// Generated on "10/27/2021 10:47:31"
                                                                                
// Verilog Test Bench template for design : Digital_async_PLL
// 
// Simulation tool : ModelSim-Altera (Verilog)
// 

`timescale 1 ns/ 1 ps
module Digital_async_PLL_vlg_tst();
// constants                                           
// general purpose registers
reg eachvec;
// test vector input registers
reg fdiv;
reg fref;
// wires                                               
wire [1:0]  adder_out;

// assign statements (if any)                          
Digital_async_PLL i1 (
// port map - connection between master ports and signals/registers   
	.adder_out(adder_out),
	.fdiv(fdiv),
	.fref(fref)
);




//fdiv
always
begin
fdiv = 1'b0;
fdiv = #5 1'b1;
#5;
end

//fref
always
begin
fref = 1'b0;
fref = #25 1'b1;
#25;
end
                                                   
                                              
endmodule

