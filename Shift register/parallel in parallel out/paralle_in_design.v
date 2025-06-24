`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 24.06.2025 12:55:56
//////////////////////////////////////////////////////////////////////////////////

module parallel_in_design(input [3:0]i_d, 
input i_clk, i_rst,
output [3:0]o_q
    );
    d_ff ff1(.D(i_d[0]), .clk(i_clk), .rst(i_rst), .Q(o_q[0]));
    d_ff ff2(.D(i_d[1]), .clk(i_clk), .rst(i_rst), .Q(o_q[1]));
    d_ff ff3(.D(i_d[2]), .clk(i_clk), .rst(i_rst), .Q(o_q[2]));
    d_ff ff4(.D(i_d[3]), .clk(i_clk), .rst(i_rst), .Q(o_q[3]));
endmodule
