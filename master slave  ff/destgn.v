`timescale 1ns/1ps
module mas_sl(input J, K , clk , rst,
output Q);
wire Qbar;
wire w1, w2, w3, w4, w5, w6, w7, w8,  w9;
wire clk_bar, rst_bar, w8_bar;


// making not wires
not g1(Qbar, Q);
not g2 (clk_bar, clk);
not g3(w8_bar, w8);
not g4(rst_bar, rst);

// declaration of the gates 
nand n1(w1, clk, J, Qbar);
nand n2(w2, K, clk, Q);
nand n3(w3, w1, w4);
nand n4(w4, w2, w3);
// making slave
nand n5(w5, w3, clk_bar);
nand n6(w6, w4, clk_bar);
nand n7(w7, w5, Qbar);
nand n8(w8, w6, Q);
// now reset logic

and a1(Q, rst_bar, w7);
and a2(w9, rst_bar, w8_bar);
or a3(Qbar, w9, w8);

endmodule