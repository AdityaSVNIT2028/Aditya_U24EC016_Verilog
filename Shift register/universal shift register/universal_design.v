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
