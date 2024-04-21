`timescale 1ns / 1ps

module uart_tb();

    reg clk;
    reg reset;
    reg [7:0] test_data [9:0];
    reg transmit;
    wire tx;
    wire tx_done;
    wire [7:0] rx_data;
    wire rx_done;
    integer i;

    // Instantiate the UART transmitter and receiver
    uart_tx tx_unit(
        .clk(clk),
        .reset(reset),
        .data_in(test_data[i]),
        .transmit(transmit),
        .tx(tx),
        .tx_done(tx_done)
    );

    uart_rx rx_unit(
        .clk(clk),
        .reset(reset),
        .rx(tx), // Directly connect tx to rx for loopback test
        .data_out(rx_data),
        .rx_done(rx_done)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize test data
        test_data[0] = 8'hA1;
        test_data[1] = 8'hB2;
        test_data[2] = 8'hC3;
        test_data[3] = 8'hD4;
        test_data[4] = 8'hE5;
        test_data[5] = 8'hF6;
        test_data[6] = 8'h07;
        test_data[7] = 8'h18;
        test_data[8] = 8'h29;
        test_data[9] = 8'h3A;

        // Initialize signals
        clk = 0;
        reset = 1;
        transmit = 0;

        // VCD file generation for waveform analysis
        $dumpfile("uart_test.vcd");
        $dumpvars(0, uart_tb);

        // Reset the system
        #20 reset = 0;
        #20;

        // Start the test cases
        for (i = 0; i < 10; i = i + 1) begin
            #20 transmit = 1; // Start transmission
            #20 transmit = 0; // Stop transmission request
            
            // Wait for transmission to complete
            wait(tx_done);
            #20; // Give some time for the receiver to process the last bit

            // Wait for reception to complete
            wait(rx_done);
            
            // Check the received data
            if (rx_data !== test_data[i]) begin
                $display("Test case %d failed: Sent %h, Received %h", i, test_data[i], rx_data);
            end else begin
                $display("Test case %d passed: Sent %h, Received %h", i, test_data[i], rx_data);
            end
            
            #100; // Wait a while before the next test case
        end

        $display("Testing completed");
        $finish;
    end

endmodule
