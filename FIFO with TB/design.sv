// Testbench for FIFO module with multiple test cases and VCD output
module fifo_tb;

parameter CLK_PERIOD = 10; // Clock period in ns
parameter TEST_CASES = 10; // Number of test cases

reg clk;
reg rst;
reg wr_en;
reg rd_en;
reg [7:0] data_in;
wire [7:0] data_out;
wire empty;
wire full;

fifo dut (
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out),
    .empty(empty),
    .full(full)
);

initial begin
    $dumpfile("fifo_tb.vcd"); // Specify the VCD file name
    $dumpvars(0, fifo_tb); // Dump all variables to VCD file
    clk = 0;
    forever #((CLK_PERIOD)/2) clk = ~clk;
end

initial begin
    rst = 1;
    wr_en = 0;
    rd_en = 0;
    data_in = 8'b0;
    #100 rst = 0;
    #10;

    // Test cases
    repeat (TEST_CASES) begin
        wr_en = 1;
        data_in = $random; // Generate random data
        #20;
        wr_en = 0;
        rd_en = 1;
        #20;
        rd_en = 0;
    end

    $finish;
end

endmodule
