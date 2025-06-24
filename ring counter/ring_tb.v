`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Testbench for: ring_design
// Engineer: Aditya
//////////////////////////////////////////////////////////////////////////////////

module tb_ring_design();

  // Inputs
  reg clk;
  reg rst;

  // Outputs
  wire [2:0] Q;

  // Instantiate the Unit Under Test (UUT)
  ring_design uut (
    .clk(clk),
    .rst(rst),
    .Q(Q)
  );

  // Clock generation: 10ns period
  always #5 clk = ~clk;

  initial begin
    // Initial values
    clk = 0;
    rst = 1;

    // Apply reset
    #10;
    rst = 0;

    // Run simulation for a few cycles
    #100;

    // Apply reset again
    rst = 1;
    #10;
    rst = 0;

    // Run more simulation
    #50;

    // Finish simulation
    $finish;
  end

  // Monitor output
  initial begin
    $monitor("Time = %0t | clk = %b | rst = %b | Q = %b", $time, clk, rst, Q);
  end

endmodule
