// sine lookup value module using two symmetries
// appears like a 2048x10bit LUT even if it uses a 512x10bit internally
// 3 clock latency
module sine_lookup(input clk, input [10:0] addr, output reg [9:0] value);

wire [9:0] sine_1sym;  // sine with 1 symmetry
memory 	#(   
			  .MEM_WIDTH(10), 
			  .MEM_DEPTH(2048), 
			  .INIT_FILE("mem_init.txt")
	) my_quarter_sine_LUT	(     // the LUT contains only one quarter of the sine wave
		 .clk(clk),
		 .r_addr(addr),   // first symmetry
		 .r_data(sine_1sym[9:0])
	);

// now for the second symmetry, we need to use addr[10]
// but since our blockram has 2 clock latencies on reads
// we need a two-clock delayed version of addr[10]
//reg addr10_delay1; always @(posedge clk) addr10_delay1 <= addr[10];
//reg addr10_delay2; always @(posedge clk) addr10_delay2 <= addr10_delay1;

//wire [15:0] sine_2sym = addr10_delay2 ? {1'b0,-sine_1sym} : {1'b1,sine_1sym};  // second symmetry

// add a third latency to the module output for best performance
always @(posedge clk) value <= sine_1sym;
endmodule