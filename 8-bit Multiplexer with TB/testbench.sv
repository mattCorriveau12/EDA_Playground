// 8-bit Multiplexer module
module mux8(
    input wire [7:0] data0,
    input wire [7:0] data1,
    input wire [7:0] data2,
    input wire [7:0] data3,
    input wire [7:0] data4,
    input wire [7:0] data5,
    input wire [7:0] data6,
    input wire [7:0] data7,
    input wire [2:0] sel,
    output reg [7:0] out
);

always @(*) begin
    case(sel)
        3'b000: out = data0;
        3'b001: out = data1;
        3'b010: out = data2;
        3'b011: out = data3;
        3'b100: out = data4;
        3'b101: out = data5;
        3'b110: out = data6;
        3'b111: out = data7;
        default: out = 8'b00000000; // Default case
    endcase
end

endmodule