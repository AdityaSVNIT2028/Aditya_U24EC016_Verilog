`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya
// Date: 22-06-2025 
// /////////////

module ring_design(input rst, clk,
output [2:0]Q
    );
    
    
    wire rst_bar, Q2_bar, Q1_bar, Q0_bar ;
    not n1(Q0_bar, Q[0]);
    not n2 (Q1_bar, Q[1]);
    not n3 (Q2_bar, Q[2]);
    
    wire Dff1, Dff2, Dff3, w1, w2 ;
    and a1(w1, Q2_bar, Q1_bar);
    and a2(w2, Q[2], Q[1]);
    or  a3(Dff1, Q[0], w1, w2);
    or  a4(Dff2, Q[2], Q1_bar, Q0_bar);
    or a5(Dff3, Q2_bar, Q[1], Q0_bar);
    
    D_ff ff1(.D(Q[0]), .clk(clk), .rst(rst), .Q(Q[2]));
    Dff ff2(.D(Q[2]), .clk(clk), .rst(rst), .Q(Q[1]));
    Dff ff3(.D(Q[1]), .clk(clk), .rst(rst), .Q(Q[0]));
    // we have to apply the condition such that if invalid number comes then it will go to 
    // if  =>  
   
endmodule

// making a Dflp flop
module D_ff(input D,input clk, input rst, 
output reg Q);
always@(negedge clk) begin
if(rst)
Q <= 1'b1;
else 
Q = D;
end
endmodule

// making a Dflp flop
module Dff(input D,input clk, input rst, 
output reg Q);
always@(negedge clk) begin
if(rst)
Q <= 1'b0;
else 
Q = D;
end
endmodule

//module D_latch(input D, clk, rst,
//output Q);
//wire Q_bar, clk_bar, D_bar;

//not n1(Q_bar, Q);
//not n2(clk_bar, clk);
//not n3(D_bar, D);
////  if rst = 1 Q = 0;
//wire a1, a2, a3;
//// this means if any of them is low all are low
//and g1(a1, D, Q_bar);
//and g2(a2, clk, D);
//and g3(a3, clk_bar, D_bar, Q);
//or( 
//endmodule