`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2025 14:41:37 
//////////////////////////////////////////////////////////////////////////////////

module barallel_shift_right_tb();

reg [31:0] i_a;
reg clk_i;
reg [4:0] num_right_i;
wire [31:0] o_y;

// Instantiate the Unit Under Test (UUT)
barrel_shift_right_32 uut (
    .i_a(i_a),
    .clk_i(clk_i),
    .num_right_i(num_right_i),
    .o_y(o_y)
);

// Clock generation
always #5 clk_i = ~clk_i;

// Monitor output
initial begin
    $monitor("Time = %0t | i_a = %b, clk_i = %b, num_right_i = %b => o_y = %b", 
              $time, i_a, clk_i, num_right_i, o_y);
end

// Test stimulus
initial begin
    // Initialize inputs
    clk_i = 0;
      i_a = 32'b11110000111100001111000011110000;  
    num_right_i = 5'd0;

    // Wait for global reset
    @(negedge clk_i);

    num_right_i = 5'd1; 
    repeat(1) @(negedge clk_i
    );
    num_right_i = 5'd4; repeat(2) @(negedge clk_i
    );
//    num_right_i = 5'd8; #10;
//    num_right_i = 5'd16; #10;
//    num_right_i = 5'd31; #10;

    // Change input and shift again
//    i_a = 32'b11110000111100001111000011110000; #10;
//    num_right_i = 5'd2; #10;
//    num_right_i = 5'd10; #10;

    // End simulation
    $finish;
end

endmodule
