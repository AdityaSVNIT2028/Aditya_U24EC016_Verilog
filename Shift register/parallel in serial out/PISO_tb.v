`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 24.06.2025 17:32:25
//////////////////////////////////////////////////////////////////////////////////

module PISO_tb();
reg [3:0]i_d;
reg i_shift, i_clk, i_rst;
wire  o_q;

 paralle_in_serial_out_design uut(
 .i_d(i_d),
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
 i_d = 4'b1010;
 #10 i_shift = 1'b1;
 #80 $finish;
 end
 
endmodule
