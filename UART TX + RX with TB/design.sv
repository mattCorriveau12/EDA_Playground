`timescale 1ns / 1ps

module uart_tx (
    input wire clk,
    input wire reset,
    input wire [7:0] data_in,
    input wire transmit,
    output reg tx,
    output reg tx_done
);

parameter IDLE = 0;
parameter SEND = 1;

reg [3:0] bit_index;
reg [1:0] state;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= IDLE;
        tx <= 1'b1; // Idle state for UART is high
        tx_done <= 1'b0;
        bit_index <= 0;
    end else begin
        case (state)
            IDLE: begin
                tx_done <= 1'b0;
                if (transmit) begin
                    tx <= 0; // Start bit
                    bit_index <= 0;
                    state <= SEND;
                end
            end
            SEND: begin
                tx <= data_in[bit_index];
                bit_index <= bit_index + 1;
                if (bit_index == 8) begin
                    state <= IDLE;
                    tx_done <= 1'b1;
                end
            end
        endcase
    end
end

endmodule



///////////////////////////////////////////////////


module uart_rx (
    input wire clk,
    input wire reset,
    input wire rx,
    output reg [7:0] data_out,
    output reg rx_done
);

parameter IDLE = 0;
parameter RECEIVE = 1;

reg [3:0] bit_index;
reg [1:0] state;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= IDLE;
        rx_done <= 1'b0;
        bit_index <= 0;
    end else begin
        case (state)
            IDLE: begin
                rx_done <= 1'b0;
                if (rx == 0) begin // Start bit detected
                    bit_index <= 0;
                    state <= RECEIVE;
                end
            end
            RECEIVE: begin
                data_out[bit_index] <= rx;
                bit_index <= bit_index + 1;
                if (bit_index == 8) begin
                    state <= IDLE;
                    rx_done <= 1'b1;
                end
            end
        endcase
    end
end

endmodule
