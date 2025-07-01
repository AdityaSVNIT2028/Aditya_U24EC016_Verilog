`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 24.06.2025 22:46:15
// Description: elements rewuired are D flip flop and 4X1 muxes and the number of ff is dependent on the number of bit  
//////////////////////////////////////////////////////////////////////////////////

module universal_design( input [1:0]i_s,
input i_clk, i_rst, i_d, [3:0]i_p,
output  [3:0]o_q
    );
    wire d0, d1, d2 ,d3;
    mux_4X1 m1(.i_s(i_s), .i_a0(o_q[0]), .i_a1(i_d), .i_a2(o_q[1]), .i_a3(i_p[0]), .o_f(d0));
    mux_4X1 m2(.i_s(i_s), .i_a0(o_q[1]), .i_a1(o_q[0]), .i_a2(o_q[2]), .i_a3(i_p[1]) , .o_f(d1));
    mux_4X1 m3(.i_s(i_s), .i_a0(o_q[2]), .i_a1(o_q[1]), .i_a2(o_q[3]), .i_a3(i_p[2]), .o_f(d2));
    mux_4X1 m4(.i_s(i_s), .i_a0(o_q[3]), .i_a1(o_q[2]), .i_a2(i_d), .i_a3(i_p[3]), .o_f(d3));
    
    d_ff ff1(.D(d0), .rst(i_rst), .clk(i_clk), .Q(o_q[0]));
    d_ff ff2(.D(d1), .rst(i_rst), .clk(i_clk), .Q(o_q[1]));
    d_ff ff3(.D(d2), .rst(i_rst), .clk(i_clk), .Q(o_q[2]));
    d_ff ff4(.D(d3), .rst(i_rst), .clk(i_clk), .Q(o_q[3]));
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 24.06.2025 23:09:55
/////////////////////////////////////////////////////////////////////////////////////////////////
module mux_4X1( input [1:0] i_s,
input i_a0, i_a1, i_a2, i_a3,
output o_f
    );
    wire s0_bar, s1_bar;
    not g1(s0_bar, i_s[0]);
    not g2(s1_bar, i_s[1]); 
    
    wire y1, y2, y3, y0;
    and g3(y0, s0_bar, s1_bar, i_a0);
    and g4(y1, s1_bar, i_s[0], i_a1);
    and g5(y2, i_s[1], s0_bar, i_a2);
    and g6(y3, i_s[1], i_s[0], i_a3);
    
    or g7(o_f, y0, y1, y2, y3);
    
endmodule
`timescale 1ns / 1ps
module d_ff(
input clk, D, rst,
output reg Q
    );
    
    always@(negedge clk) begin
    if(rst)
    Q <= 1'b0;
    else
    Q <= D;
    end
endmodule
// now for the tb
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
  #10 i_rst = 1'b0;
  
  i_p = 4'b0110;
  #20
  $finish;
end

endmodule
