module biquad_filter(
							input clk,
							input reset,
							input signed [15:0]filt_in,
							input valid_in,
							
							
							input signed[15:0]a1,
							input signed[15:0]a2,
							input signed[15:0]b0,
							input signed[15:0]b1,
							input signed[15:0]b2,
							
							output reg signed[15:0]filt_out,
							output reg valid_out
							
							);

reg [2:0]state;							

reg signed[31:0]temp;
reg signed[15:0]temp_in;
reg signed[15:0]in_z1;
reg signed[15:0]in_z2;
reg signed[15:0]out_z1;
reg signed[15:0]out_z2;

reg signed[15:0]mult_in_a;
reg signed[15:0]mult_in_b;
reg signed[31:0]mult_out;

always@(posedge(clk)) mult_out <= mult_in_a * mult_in_b;


always@(posedge(clk))
begin
	if(~reset) begin
		temp<=32'h0;
		temp_in<=16'h0;
		in_z1<=16'h0;
		in_z2<=16'h0;
		out_z1<=16'h0;
		out_z2<=16'h0;
	end else begin
		case(state)
			3'b000: begin
					if(valid_in) begin
						mult_in_a <= filt_in;
						mult_in_b <= b0;
						temp_in <= filt_in;
						state <= 3'b001;
					end
			
				end
			3'b001: begin
						temp <= mult_out>>15;
						mult_in_a <= in_z1;
						mult_in_b <=b1;
						state<=3'b010;
					end
			3'b010: begin
						temp <= temp+(mult_out>>15);
						mult_in_a <= in_z2;
						mult_in_b <=b2;
						state<=3'b011;
					end
			3'b011: begin
						temp <= temp+(mult_out>>15);
						mult_in_a <= out_z1;
						mult_in_b <=a1;
						state<=3'b100;
					end
			3'b100: begin
						temp <= temp-(mult_out>>15);
						mult_in_a <= out_z2;
						mult_in_b <=a2;
						state<=3'b101;
					end
			3'b101: begin
						temp <= temp-(mult_out>>15);
						state<=3'b110;
					end
			3'b110: begin
						filt_out <= temp;
						out_z1 <= temp;
						out_z2 <= out_z1;
						in_z2 <= in_z1;
						in_z1 <= temp_in;
						
						valid_out <= 1'b1;
						
						state<=3'b111;
					end
			default: begin
							valid_out <= 0;
							state<= 3'b000;
							
						end
		
		endcase
	
	
	end




end							
							
							
endmodule