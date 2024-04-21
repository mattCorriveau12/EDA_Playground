// Testbench
module testbench;
    reg clk;
    reg we;
    reg [7:0] addr;
    reg [7:0] data_in;
    wire [7:0] data_out;

    // Instantiate the memory module
    memory_module uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #2 clk = ~clk; // Generate a clock with a period of 4 time units
    end

    // Test cases
    initial begin
        // Initialize signals
        we = 0;
        addr = 0;
        data_in = 0;
        
        // Initialize VCD dump
        $dumpfile("memory.vcd");
        $dumpvars(0, testbench);
        
        // Test case 1: Write to memory location 0
        #10 we = 1; addr = 8'h00; data_in = 8'hAA;
        #10 we = 0;

        // Test case 2: Write to memory location 1
        #10 we = 1; addr = 8'h01; data_in = 8'hBB;
        #10 we = 0;

        // Test case 3: Write to memory location 2
        #10 we = 1; addr = 8'h02; data_in = 8'hCC;
        #10 we = 0;

        // Test case 4: Write to memory location 3
        #10 we = 1; addr = 8'h03; data_in = 8'hDD;
        #10 we = 0;

        // Test case 5: Write to memory location 3
        #10 we = 1; addr = 8'h04; data_in = 8'hEE;
        #10 we = 0;      
      
        // Test case 6: Write to memory location 3
        #10 we = 1; addr = 8'h05; data_in = 8'hFF;
        #10 we = 0;    
      
        // Test case 7: Write to memory location 3
        #10 we = 1; addr = 8'h06; data_in = 8'hA0;
        #10 we = 0;
      
        // Test case 8: Write to memory location 3
        #10 we = 1; addr = 8'h07; data_in = 8'hB0;
        #10 we = 0;
      
        // Test case 9: Write to memory location 3
        #10 we = 1; addr = 8'h08; data_in = 8'hC0;
        #10 we = 0;
      
            
        // Test case 10: Read from the previously written memory locations
        #10 addr = 8'h00; // Read from location 0
        #10 addr = 8'h01; // Read from location 1
        #10 addr = 8'h02; // Read from location 2
        #10 addr = 8'h03; // Read from location 3
        #10 addr = 8'h04; // Read from location 4
        #10 addr = 8'h05; // Read from location 5
        #10 addr = 8'h06; // Read from location 6
        #10 addr = 8'h07; // Read from location 7      
        #10 addr = 8'h08; // Read from location 8
        #10 addr = 8'h09; // Read from location 9
        #10 addr = 8'h0A; // Read from location a
        #10 addr = 8'h0B; // Read from location b 
        #10 addr = 8'h0C; // Read from location c
        #10 addr = 8'h0D; // Read from location d
             

        #10;

        // Finish the simulation
        $finish;
    end
endmodule