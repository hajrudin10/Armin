module sig_multiplier(
							input clk,
							input reset,
							input signed [15:0]sig,
							input signed [15:0]ref,
							input valid_in,
							
							output reg signed [15:0] data_out,
							output reg valid_out

							);

//reg temp[31:0];							
							
always @(posedge(clk))
begin
	if(~reset) begin
		data_out <= 16'h0;
		valid_out <= 1'b0;
		//temp <= 32'h0;
	end else begin
		if(valid_in) begin
			data_out <= (sig * ref) >> 30;
		end
	end


end
							
							
endmodule