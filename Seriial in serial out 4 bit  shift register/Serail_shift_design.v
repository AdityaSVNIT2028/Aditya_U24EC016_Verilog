`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 24.06.2025 10:05:54
// Module Name: Serail_shift_design
// Description: making a 4 bit shift register of type serial in erail out using D flip flop
//////////////////////////////////////////////////////////////////////////////////

module Serial_shift_design( input i_d, i_clk, i_rst,
output o_q
    );
    wire [2:0]Q;
    d_ff ff1(.D(i_d), .clk(i_clk), .rst(i_rst), .Q(Q[0]));
    d_ff ff2(.D(Q[0]), .clk(i_clk), .rst(i_rst), .Q(Q[1]));
    d_ff ff3(.D(Q[1]), .clk(i_clk), .rst(i_rst), .Q(Q[2]));
    d_ff ff4(.D(Q[2]), .clk(i_clk), .rst(i_rst), .Q(o_q));
endmodule

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