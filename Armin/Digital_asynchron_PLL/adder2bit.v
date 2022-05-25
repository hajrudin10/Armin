module adder2bit (
						input a,
						input b,
						output [1:0]sum


);

assign 	sum[0] = a^b;
assign	sum[1] = (~a)&b;






endmodule

//https://technobyte.org/verilog-code-half-full-subtractor-using-structural-modeling/