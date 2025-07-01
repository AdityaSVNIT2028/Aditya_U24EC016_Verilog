`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 24.06.2025 16:09:06
//////////////////////////////////////////////////////////////////////////////////

module paralle_in_serial_out_design( input [3:0]i_d,
input i_rst, i_clk, i_shift,// as on shft is on then the the data can be loaded as ouput
output o_q
    );
    wire load, Q0, Q1, Q2, Q3, d2, d1, d0, b2,b1,b0, a0, a1, a2;
    not n1(load, i_shift);
    
    and n2(a2 ,i_shift, Q3);
    and n3(b2, load, i_d[2]);
    or n4(d2, a2, b2);
    
    and n5(a1, Q2, i_shift);
    and n6(b1, i_d[1], load);
    or n7(d1, a1, b1);
    
    and n8(a0, i_shift, Q1);
    and n9(b0, load, i_d[0]);
    or n10(d0, a0, b0);
    
    d_ff ff1(.D(i_d[3]), .clk(i_clk), .rst(i_rst), .Q(Q3));
    d_ff ff2(.D(d2), .clk(i_clk), .rst(i_rst), .Q(Q2));
    d_ff ff3(.D(d1), .clk(i_clk), .rst(i_rst), .Q(Q1));
    d_ff ff4(.D(d0), .clk(i_clk), .rst(i_rst), .Q(o_q));
    
    
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
// now the testbench
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 24.06.2025 17:32:25
//////////////////////////////////////////////////////////////////////////////////

module PISO_tb();
reg [3:0]i_d;
reg i_shift, i_clk, i_rst;
wire  o_q;

 paralle_in_serial_out_design uut(
 .i_d(i_d),
 .i_shift(i_shift),
 .i_clk(i_clk),
 .i_rst(i_rst),
 .o_q(o_q)
 );
 
 always #5 i_clk = ~i_clk;
 
 initial begin
 i_clk = 1'b0;
 i_rst = 1'b1;
 #10 i_rst = 1'b0;
 i_shift = 1'b0;
 i_d = 4'b1010;
 #10 i_shift = 1'b1;
 #80 $finish;
 end
 
endmodule


