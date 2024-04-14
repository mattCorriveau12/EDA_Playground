module accumulator(
    input wire clk,
    input wire rst,
    input wire add_sub, // 0 for addition, 1 for subtraction
    input wire [7:0] data_in,
    output reg [15:0] acc
);

always @(posedge clk or posedge rst)
begin
    if (rst)
        acc <= 0;
    else if (add_sub)
        acc <= acc - data_in;
    else
        acc <= acc + data_in;
end

endmodule
