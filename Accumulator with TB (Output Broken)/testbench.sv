`timescale 1ns / 1ps

module accumulator_tb;

// Parameters
parameter PERIOD = 10; // Simulation period

// Signals
reg clk, rst, add_sub;
reg [7:0] data_in;
wire [15:0] acc;

// Instantiate the accumulator
accumulator Acc (
    .clk(clk),
    .rst(rst),
    .add_sub(add_sub),
    .data_in(data_in),
    .acc(acc)
);

// Clock generation
always #5 clk = ~clk;

// Stimulus
initial begin
    $dumpfile("accumulator_tb.vcd");
    $dumpvars(0, accumulator_tb);

    // Reset
    rst = 1;
    add_sub = 0;
    data_in = 8'h00;
    #PERIOD;
    rst = 0;
    #PERIOD;

    // Add some values
    data_in = 8'h05; // Add 5
    add_sub = 0;
    #PERIOD;
    
    data_in = 8'h0A; // Add 10
    #PERIOD;
    
    // Subtract some values
    data_in = 8'h03; // Subtract 3
    add_sub = 1;
    #PERIOD;
    
    data_in = 8'h04; // Subtract 4
    #PERIOD;
    
    $finish;
end

endmodule
