`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 25.06.2025 19:53:02
// Description: Testbench for Moore FSM Odd Parity Generator
//////////////////////////////////////////////////////////////////////////////////

module parity_tb();

reg i_x, i_rst, i_clk;
wire o_p;

// Instantiate the DUT (Device Under Test)
parity_generator_design uut (
    .i_x(i_x),
    .i_rst(i_rst),
    .i_clk(i_clk),
    .o_p(o_p)
);

// Clock generation: 10ns period (5ns high, 5ns low)
always #5 i_clk = ~i_clk;

// Stimulus block
initial begin
    $display("Time\tClk\tRst\tX\tP");
    $monitor("%0dns\t%b\t%b\t%b\t%b", $time, i_clk, i_rst, i_x, o_p);

    // Initial values
    i_clk = 0;
    i_rst = 1;
    i_x = 0;

    // Apply reset
    #10 i_rst = 0;

    // Apply test inputs
    #10 i_x = 0;  // Even (0) ? expect o_p = 1
    #10 i_x = 1;  // 0+1 ? odd ? expect o_p = 1 (but output comes with delay)
    #10 i_x = 1;  // 0+1+1 ? even ? o_p = 0
    #10 i_x = 0;  // 0+1+1+0 ? still even ? o_p = 1
    #10 i_x = 1;  // now becomes odd again ? o_p = 0

    #20 $finish;
end

endmodule
