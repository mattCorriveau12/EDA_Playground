module signed_mult_div(
    input signed [7:0] a,
    input signed [7:0] b,
    output reg signed [15:0] mult,
    output reg signed [7:0] div,
    output reg div_by_zero // This flag is high if division by zero is attempted
);

always @(*) begin
    // Perform signed multiplication
    mult = a * b;

    // Perform signed division
    if (b != 0) begin
        div = a / b;
        div_by_zero = 1'b0;
    end else begin
        div = 0; // Assign a default value when division by zero is attempted
        div_by_zero = 1'b1;
    end
end

endmodule
