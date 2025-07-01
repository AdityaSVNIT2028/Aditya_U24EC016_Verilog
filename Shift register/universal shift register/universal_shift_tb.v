`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya
//////////////////////////////////////////////////////////////////////////////////

module universal_shift_tb();
reg i_clk, i_d, i_rst;
reg [1:0]i_s;
reg [3:0]i_p;
wire [3:0] o_q;

universal_design uut(
.i_clk(i_clk),
.i_d(i_d),
.i_rst(i_rst),
.i_s(i_s),
.i_p(i_p),
.o_q(o_q)
);

always #5 i_clk = ~i_clk;

initial begin
i_clk = 1'b0;
i_rst = 1'b1;
 i_s = 2'b01;
 i_p = 4'b1100;
 #10 i_rst = 1'b0;
  i_d = 1'b1;
  #10 i_d = 1'b0;
  #10 i_d = 1'b0;
  #10 i_d = 1'b1;
  #20
  i_s = 2'b0;
  #20
  i_rst = 1'b1;
  #10 i_rst = 1'b0;
   i_s = 2'b10;
     i_d = 1'b1;
  #10 i_d = 1'b1;
  #10 i_d = 1'b0;
  #10 i_d = 1'b1;
  #40
  i_rst = 1'b1;
  i_s = 2'b11;
  #10 i_rst = 1'b0;
  
  i_p = 4'b0110;
  #20
  $finish;
end

endmodule
