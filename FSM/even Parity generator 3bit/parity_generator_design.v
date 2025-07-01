`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya  
// 
// Create Date: 25.06.2025 12:10:50
//////////////////////////////////////////////////////////////////////////////////
// designing the mealy state machine 
// 1 bit parity generator
// using moore FSM
module parity_generator_design( input i_x, input i_rst, input i_clk, 
output o_p
    );
    // the state o determine that the number of 1's is even so we need 1 parity bit 
    // and the state 1 determine that the number of 1's is odd and hence we need 0 parity bit
    wire q, d;
    not n1( o_p, q);
    xor n2(d, q, i_x);
    d_ff ff1(.D(d), .rst(i_rst), .clk(i_clk), .Q(q));
     
    
endmodule
