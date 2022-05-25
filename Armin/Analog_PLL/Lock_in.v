module Lock_in( 
					input wire CLOCK_50,
					input wire RESET,
					input wire [15:0]ADC_in,

					output wire [9:0]sine_out


);
//wires**********************
wire [31:0]phase_inc;


//modules*********************
constants constants(	.clk(CLOCK_50),
							.reset_n(RESET),
							.phase(phase_inc)


);


NCO_ nco(	.clk(CLOCK_50),
				.reset(RESET),
				.phase_inc(phase_inc)

);


endmodule