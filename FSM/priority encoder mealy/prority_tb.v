`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 25.06.2025 21:27:20
//////////////////////////////////////////////////////////////////////////////////


module prority_tb();
reg i_x, i_clk, i_rst;
wire o_p;

priority_mealy_design uut(
.i_x(i_x),
.i_clk(i_clk),
.i_rst(i_rst),
.o_p(o_p)
);

always #5 i_clk = ~i_clk;

initial begin
 i_clk = 0; i_rst = 1; i_x = 0;
    #10 i_rst = 0;

    #10 i_x = 0; // even ? o_p = 1
    #10 i_x = 1; // even + 1 ? odd ? o_p = 0
    #10 i_x = 1; // odd + 1 ? even ? o_p = 1
    #10 i_x = 0; // even + 0 ? even ? o_p = 1
    #10 i_x = 1; // even + 1 ? odd ? o_p = 0

    #20 $finish;
end

endmodule
