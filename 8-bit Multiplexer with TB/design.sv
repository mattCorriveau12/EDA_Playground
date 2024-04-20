// Testbench for 8-bit Multiplexer module with VCD output
module mux8_tb;

parameter CLK_PERIOD = 10; // Clock period in ns
parameter TEST_CASES = 10; // Number of test cases

reg clk;
reg [7:0] data0, data1, data2, data3, data4, data5, data6, data7;
reg [2:0] sel;
wire [7:0] out;

mux8 dut (
    .data0(data0),
    .data1(data1),
    .data2(data2),
    .data3(data3),
    .data4(data4),
    .data5(data5),
    .data6(data6),
    .data7(data7),
    .sel(sel),
    .out(out)
);

initial begin
    $dumpfile("mux8_tb.vcd"); // Specify the VCD file name
    $dumpvars(0, mux8_tb); // Dump all variables to VCD file
    clk = 0;
    forever #((CLK_PERIOD)/2) clk = ~clk;
end

initial begin
    // Test cases
    repeat (TEST_CASES) begin
        // Randomize inputs
        data0 = $random;
        data1 = $random;
        data2 = $random;
        data3 = $random;
        data4 = $random;
        data5 = $random;
        data6 = $random;
        data7 = $random;
        sel = $random % 8; // Randomly select one of the inputs
        #20; // Allow some time for simulation
    end
    $finish;
end

endmodule