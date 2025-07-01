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
