module NCO_(
				input clk,
				input reset,
				input [31:0]phase_inc,
				
				output  reg signed[9:0] sine,
				output  reg signed[9:0] cosine
				



);


reg [31:0] phase_acc;   // 32bit phase accumulator
always @(posedge clk) 
begin
	if(~reset) begin
		phase_acc <= 32'h0;
	end else begin
		phase_acc <= phase_acc + phase_inc;   // 440Hz output when clocked at 100MHz
	end
end

wire [9:0] sine_lookup_output;
wire [9:0] cosine_lookup_output;

memory 	#(   
			  .MEM_WIDTH(10), 
			  .MEM_DEPTH(4096), 
			  .INIT_FILE("mem_init.txt")
	) my_quarter_sine_LUT	(     // the LUT contains only one quarter of the sine wave
		 .clk(clk),
		 .r_addr(phase_acc[31:20]),   // first symmetry
		 .sin_data(sine_lookup_output[9:0]),
		 .cos_data(cosine_lookup_output[9:0])
	);

always @(posedge(clk))
begin
	if(~reset) begin
		sine <= 10'h0;
	end else begin
		sine<= sine_lookup_output;
		cosine<= cosine_lookup_output;
	end
	

end



endmodule