`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 24.06.2025 21:18:40
//////////////////////////////////////////////////////////////////////////////////

module BI_shift_design(input i_d, i_right, i_clk, i_rst,
output [3:0]o_q
    );
    wire w_left;
    not n1(w_left, i_right);
    wire d0, d1, d2, d3, a0, b0, a1, b1, a2, b2, a3, b3;
    
    and g1(a0, i_right, i_d);
    and g2(b0, w_left, o_q[1]);
    or g3 (d0, a0, b0);
    
    and g4(a1, i_right, o_q[0]);
    and g5(b1, w_left, o_q[2]);
    or g6(d1, a1, b1);
    
    and g7(a2, i_right, o_q[1]);
    and g8(b2, w_left, o_q[3]);
    or g9(d2, a2, b2);
    
    and g10(a3, i_right, o_q[2]);
    and g11(b3, w_left, i_d);
    or d12(d3, a3, b3);
    
    d_ff ff1(.D(d0), .clk(i_clk), .rst(i_rst), .Q(o_q[0]));
    d_ff ff2(.D(d1), .clk(i_clk), .rst(i_rst), .Q(o_q[1])); 
    d_ff ff3(.D(d2), .clk(i_clk), .rst(i_rst), .Q(o_q[2]));
    d_ff ff4(.D(d3), .clk(i_clk), .rst(i_rst), .Q(o_q[3]));
    
endmodule
`timescale 1ns / 1ps
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

// now for tb
`timescale 1ns / 1ps
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
