`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 25.06.2025 21:01:43
// Module Name: priority_mealy_design
//////////////////////////////////////////////////////////////////////////////////

module priority_mealy_design( input i_x, i_clk, i_rst,
output o_p 
    );
    
    wire D, Q;
    xor g1(D, i_x, Q);
    xnor g2(o_p, i_x, Q);
    
    d_ff ff1(.D(D), .clk(i_clk), .rst(i_rst), .Q(Q));
     
endmodule
