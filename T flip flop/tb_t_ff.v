`timescale 1ns / 1ps

module t_ff_tb();

  // Testbench signals
  reg clk, T, rst;
  wire Q;

  // Instantiate the T flip-flop
  t_ff uut (
    .clk(clk),
    .T(T),
    .rst(rst),
    .Q(Q)
  );

  // Generate a clock: 10 ns period
  always #5 clk = ~clk;

  initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    T = 0;

    // Display header
    
    $monitor("Time = %0t | clk = %b, T = %b, rst = %b => Q = %b", $time, clk, T, rst, Q);

    /// Apply reset
    #10 rst = 1;  // async reset
    #3 rst = 0;

    // Test T = 0 (hold)
    #10 T = 0;
    #10;

    // Test T = 1 (toggle)
    #10 T = 1;
    #20;

    // Toggle again
    #10 T = 1;
    #20;

    // Set T = 0 again
    #10 T = 0;
    #20;

    // Reset during operation
    #5 rst = 1;
    #5 rst = 0;

    // Final toggle
    #10 T = 1;
    #20;

    // End simulation
    #10 $finish;
  end

endmodule