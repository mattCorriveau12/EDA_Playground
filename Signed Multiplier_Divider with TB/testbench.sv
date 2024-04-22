`timescale 1ns / 1ps

module signed_mult_div_tb;

reg signed [7:0] a, b;
wire signed [15:0] mult;
wire signed [7:0] div;
wire div_by_zero;

signed_mult_div uut(
    .a(a),
    .b(b),
    .mult(mult),
    .div(div),
    .div_by_zero(div_by_zero)
);

initial begin
    // Initialize inputs
    a = 0;
    b = 0;

    // Create VCD file
    $dumpfile("signed_mult_div.vcd");
    $dumpvars(0, signed_mult_div_tb);

    // Test cases
    #10 a = 8'd127; b = 8'd127; // Case 1: Max positive numbers
    #10 a = -8'd128; b = 8'd127; // Case 2: Max negative and max positive
    #10 a = 8'd127; b = -8'd128; // Case 3: Max positive and max negative
    #10 a = -8'd128; b = -8'd128; // Case 4: Max negative numbers
    #10 a = 8'd10; b = 8'd5; // Case 5: Positive division
    #10 a = -8'd10; b = 8'd5; // Case 6: Negative division (numerator)
    #10 a = 8'd10; b = -8'd5; // Case 7: Negative division (denominator)
    #10 a = -8'd10; b = -8'd5; // Case 8: Negative division (both)
    #10 a = 8'd10; b = 8'd0; // Case 9: Division by zero
    #10 a = 0; b = -8'd10; // Case 10: Zero numerator

    #10 $finish; // End simulation
end

endmodule
