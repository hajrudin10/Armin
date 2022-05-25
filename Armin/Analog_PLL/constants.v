module constants(input clk,
						input reset_n,
						output reg [31:0] phase
						);


always @(posedge(clk))
begin
	if(~reset_n) begin
		phase <= 32'h0;
	
	end else begin
		phase <= 32'hff;
	end
	


end						
						
endmodule