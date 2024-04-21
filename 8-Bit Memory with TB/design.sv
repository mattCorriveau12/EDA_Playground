// 8-bit memory module
module memory_module (
    input wire clk,
    input wire we,                 // Write enable
    input wire [7:0] addr,         // Address bus
    input wire [7:0] data_in,      // Data input bus
    output reg [7:0] data_out      // Data output bus
);

    // Define the memory size
    parameter MEM_DEPTH = 256;
    
    // Memory array
    reg [7:0] mem [0:MEM_DEPTH-1];

    // Write operation
    always @(posedge clk) begin
        if (we) begin
            mem[addr] <= data_in;
        end
    end
    
    // Read operation
    always @(posedge clk) begin
        if (!we) begin
            data_out <= mem[addr];
        end
    end

endmodule