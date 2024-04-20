module ALU_tb;

reg [3:0] operand_a;
reg [3:0] operand_b;
reg [2:0] opcode;
wire [3:0] result;

ALU dut(
    .operand_a(operand_a),
    .operand_b(operand_b),
    .opcode(opcode),
    .result(result)
);

initial begin
    // Open VCD file
    $dumpfile("ALU_tb.vcd");
    $dumpvars(0, ALU_tb);

    // Test case 1: Addition
    operand_a = 4'b1010;
    operand_b = 4'b0011;
    opcode = 3'b000;
    #10;
    $display("Addition: %b + %b = %b", operand_a, operand_b, result);

    // Test case 2: Subtraction
    operand_a = 4'b1010;
    operand_b = 4'b0011;
    opcode = 3'b001;
    #10;
    $display("Subtraction: %b - %b = %b", operand_a, operand_b, result);

    // Test case 3: Bitwise AND
    operand_a = 4'b1010;
    operand_b = 4'b0011;
    opcode = 3'b010;
    #10;
    $display("Bitwise AND: %b & %b = %b", operand_a, operand_b, result);

    // Test case 4: Bitwise OR
    operand_a = 4'b1010;
    operand_b = 4'b0011;
    opcode = 3'b011;
    #10;
    $display("Bitwise OR: %b | %b = %b", operand_a, operand_b, result);

    // Test case 5: Bitwise XOR
    operand_a = 4'b1010;
    operand_b = 4'b0011;
    opcode = 3'b100;
    #10;
    $display("Bitwise XOR: %b ^ %b = %b", operand_a, operand_b, result);

    // Test case 6: Left shift
    operand_a = 4'b1010;
    operand_b = 4'b0000;
    opcode = 3'b101;
    #10;
    $display("Left shift: %b << 1 = %b", operand_a, result);

    // Test case 7: Right shift
    operand_a = 4'b1010;
    operand_b = 4'b0000;
    opcode = 3'b110;
    #10;
    $display("Right shift: %b >> 1 = %b", operand_a, result);

    // Finish simulation
    $finish;
end

endmodule
