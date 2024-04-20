module ALU(
    input [3:0] operand_a,
    input [3:0] operand_b,
    input [2:0] opcode,
    output reg [3:0] result
);

always @(*) begin
    case(opcode)
        3'b000: result = operand_a + operand_b; // Addition
        3'b001: result = operand_a - operand_b; // Subtraction
        3'b010: result = operand_a & operand_b; // Bitwise AND
        3'b011: result = operand_a | operand_b; // Bitwise OR
        3'b100: result = operand_a ^ operand_b; // Bitwise XOR
        3'b101: result = operand_a << 1; // Left shift operand_a by 1
        3'b110: result = operand_a >> 1; // Right shift operand_a by 1
        default: result = 4'b0000; // Default: result is all zeros
    endcase
end

endmodule
