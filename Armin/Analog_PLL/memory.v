//https://www.digikey.at/en/maker/projects/introduction-to-fpga-part-8-memory-and-block-ram/df7bcadef0de430ab89d0d9c21e3a14c
//https://github.com/ShawnHymel/introduction-to-fpga/blob/main/08-memory/solution-sequencer/memory.v

module memory #(

    // Parameters
    parameter   MEM_WIDTH = 10,
    parameter   MEM_DEPTH = 4096,
    parameter   INIT_FILE = "mem_init.txt"
) (

    // Inputs
    input               clk,
    input       [ADDR_WIDTH - 1:0]   r_addr,
    
    
    // Outputs
    output  reg [MEM_WIDTH - 1:0]  sin_data,
	 output  reg [MEM_WIDTH - 1:0]  cos_data
);

    // Calculate the number of bits required for the address
    localparam  ADDR_WIDTH = $clog2(MEM_DEPTH);

    // Declare memory
    reg [MEM_WIDTH - 1:0]  mem [0:MEM_DEPTH - 1];
    
    // Interact with the memory block
    always @ (posedge clk) begin
        

            sin_data <= mem[r_addr];
				cos_data <= mem[r_addr+256];

    end
    
    // Initialization (if available)
    initial if (INIT_FILE) begin
        $readmemh(INIT_FILE, mem);
    end
    
endmodule