`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer:Aditya  
// Create Date: 24.a06.2025 17:58:11
//////////////////////////////////////////////////////////////////////////////////

module PSISO_design( input [3:0]i_p,
input i_s, i_shift, i_rst, i_clk,
output o_q
    );
     wire load, Q0, Q1, Q2, Q3, d3, d2, d1, d0,b3, b2,b1,b0, a0, a1, a2, a3;
    not n1(load, i_shift);
    
    and g2(a3 ,i_shift, i_s);
    and g3(b3, load, i_p[3]);
    or g4(d3, a3, b3);
    
    and n2(a2 ,i_shift, Q3);
    and n3(b2, load, i_p[2]);
    or n4(d2, a2, b2);
    
    and n5(a1, Q2, i_shift);
    and n6(b1, i_p[1], load);
    or n7(d1, a1, b1);
    
    and n8(a0, i_shift, Q1);
    and n9(b0, load, i_p[0]);
    or n10(d0, a0, b0);
    
    d_ff ff1(.D(d3), .clk(i_clk), .rst(i_rst), .Q(Q3));
    d_ff ff2(.D(d2), .clk(i_clk), .rst(i_rst), .Q(Q2));
    d_ff ff3(.D(d1), .clk(i_clk), .rst(i_rst), .Q(Q1));
    d_ff ff4(.D(d0), .clk(i_clk), .rst(i_rst), .Q(o_q));
    
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
// now for tb
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
