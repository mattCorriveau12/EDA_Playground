`timescale 1ns / 1ps

module seven_segment_decoder_tb;

    // Inputs
    reg [3:0] digit;

    // Outputs
    wire [6:0] segment;

    // Instantiate the Unit Under Test (UUT)
    seven_segment_decoder uut (
        .digit(digit), 
        .segment(segment)
    );

    initial begin
        // Initialize Inputs
        digit = 0;

        // Initialize VCD output
        $dumpfile("seven_segment_decoder.vcd");
        $dumpvars(0, seven_segment_decoder_tb);

        // Wait 100 ns for global reset to finish
        #20;

        // Add stimulus here
        digit = 4'b0000; #10;
        digit = 4'b0001; #10;
        digit = 4'b0010; #10;
        digit = 4'b0011; #10;
        digit = 4'b0100; #10;
        digit = 4'b0101; #10;
        digit = 4'b0110; #10;
        digit = 4'b0111; #10;
        digit = 4'b1000; #10;
        digit = 4'b1001; #10;

        // Finish simulation
        $finish;
    end

endmodule
