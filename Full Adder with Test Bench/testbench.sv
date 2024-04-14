// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module full_adder_tb;

// Parameters
parameter PERIOD = 10; // Simulation period

// Signals
reg a, b, cin;
wire sum, cout;

// Instantiate the full adder
full_adder FA (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

// Stimulus
initial begin
    $dumpfile("full_adder_tb.vcd");
    $dumpvars(0, full_adder_tb);

    // Test case 1
    a = 1; b = 0; cin = 0;
    #PERIOD;
    
    // Test case 2
    a = 1; b = 1; cin = 0;
    #PERIOD;
    
    // Test case 3
    a = 0; b = 0; cin = 1;
    #PERIOD;
    
    // Test case 4
    a = 0; b = 1; cin = 1;
    #PERIOD;
    
    // Test case 5
    a = 1; b = 1; cin = 1;
    #PERIOD;
    
    $finish;
end

endmodule
