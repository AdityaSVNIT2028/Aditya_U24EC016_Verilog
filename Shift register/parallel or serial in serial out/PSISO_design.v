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
