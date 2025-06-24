`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya
// Create Date: 24.06.2025 12:24:34 
//////////////////////////////////////////////////////////////////////////////////


module serial_in_design( input i_d, i_rst, i_clk,
output [3:0]o_q
    );
    
    d_ff ff1(.D(i_d), .rst(i_rst), .clk(i_clk), .Q(o_q[0]));
    d_ff ff2(.D(o_q[0]), .rst(i_rst), .clk(i_clk), .Q(o_q[1]));
    d_ff ff3(.D(o_q[1]), .rst(i_rst), .clk(i_clk), .Q(o_q[2]));
    d_ff ff4(.D(o_q[2]), .rst(i_rst), .clk(i_clk), .Q(o_q[3]));
endmodule
