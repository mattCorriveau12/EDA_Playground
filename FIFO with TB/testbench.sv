// FIFO module
module fifo(
    input wire clk,
    input wire rst,
    input wire wr_en,
    input wire rd_en,
    input wire [7:0] data_in,
    output reg [7:0] data_out,
    output reg empty,
    output reg full
);

parameter DEPTH = 8; // Depth of the FIFO

reg [7:0] memory [0:DEPTH-1];
reg [3:0] wr_ptr = 4'b0000; // Write pointer
reg [3:0] rd_ptr = 4'b0000; // Read pointer

always @(posedge clk or posedge rst) begin
    if (rst) begin
        wr_ptr <= 4'b0000;
        rd_ptr <= 4'b0000;
        empty <= 1'b1;
        full <= 1'b0;
        data_out <= 8'b0;
    end else begin
        // Write operation
        if (wr_en && !full) begin
            memory[wr_ptr] <= data_in;
            wr_ptr <= wr_ptr + 1;
            if (wr_ptr == DEPTH) wr_ptr <= 0;
            empty <= 0;
            if (wr_ptr == rd_ptr) full <= 1;
        end
        // Read operation
        if (rd_en && !empty) begin
            data_out <= memory[rd_ptr];
            rd_ptr <= rd_ptr + 1;
            if (rd_ptr == DEPTH) rd_ptr <= 0;
            full <= 0;
            if (rd_ptr == wr_ptr) empty <= 1;
        end
    end
end

endmodule
