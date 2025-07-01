`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Aditya
// Create Date: 28.06.2025
// Module Name: tb
// Description: Testbench for barrel_shifter_multifunction
//////////////////////////////////////////////////////////////////////////////////

module tb();
    reg [31:0] data_i;
    reg [4:0] s_i;
    reg right_i;
    wire [31:0] o_y;

    // DUT instantiation
    barrel_shifter_multifunction uut (
        .data_i(data_i), 
        .s_i(s_i),
        .right_i(right_i),
        .o_y(o_y)
    );

    initial begin
        // Monitor changes
        $monitor("Time=%0t | right_i=%b | s_i=%d | data_i=%b | o_y=%b", 
                 $time, right_i, s_i, data_i, o_y);
        
        // Test 1: Right shift by 0
        data_i = 32'hA5A5A5A5;  // 10100101...
        s_i = 5'd0;
        right_i = 1'b1; // Right shift
        #10;

        // Test 2: Right shift by 4
        s_i = 5'd4;
        #10;

        // Test 3: Left shift by 4
        right_i = 1'b0;
        s_i = 5'd4;
        #10;

        // Test 4: Left shift by 8
        s_i = 5'd8;
        #10;

        // Test 5: Right shift by 8
        right_i = 1'b1;
        s_i = 5'd8;
        #10;

        // Test 6: Right shift by 31
        s_i = 5'd31;
        #10;

        // Test 7: Random input
        data_i = 32'h12345678;
        s_i = 5'd5;
        right_i = 1'b0; // Left shift
        #10;

        s_i = 5'd5;
        right_i = 1'b1; // Right shift
        #10;

        $finish;
    end
endmodule
