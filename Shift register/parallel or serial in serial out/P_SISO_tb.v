`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya
// Create Date: 24.06.2025 18:14:24
//////////////////////////////////////////////////////////////////////////////////


module P_SISO_tb();
reg [3:0]i_p;
reg i_s, i_shift, i_clk, i_rst;
wire  o_q;

 PSISO_design uut(
 .i_p(i_p),
 .i_s(i_s),
 .i_shift(i_shift),
 .i_clk(i_clk),
 .i_rst(i_rst),
 .o_q(o_q)
 );
 
 always #5 i_clk = ~i_clk;
 
 initial begin
 i_clk = 1'b0;
 i_rst = 1'b1;
 #10 i_rst = 1'b0;
 i_shift = 1'b0;
 i_p = 4'b1010;
 #10 i_shift = 1'b1;
 
 #40
 
  i_rst = 1'b1;
 #10 i_rst = 1'b0;
 
 i_s=1'b1;
 #10 i_s = 1'b0;
 #10 i_s = 1'b0;
 #10 i_s = 1'b1;
 
 #60 $finish;
 end
endmodule
