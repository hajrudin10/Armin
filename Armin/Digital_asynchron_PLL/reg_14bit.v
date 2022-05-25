module reg_14bit (
						input [13:0]in,
						input rst,
						input clk,
						output reg [13:0]out


);

always @(posedge clk)
begin
 if (rst==1)
 begin
	out <= 14'b00000000000000;
 end else begin
	out <= in;
 end
end

endmodule





