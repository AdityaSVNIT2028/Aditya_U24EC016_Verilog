// Code your design here
// 16X1 mux using function 
`timescale 1ns/1ns
module mux_16X1(input [63:0]A, input [3:0]S, output reg [3:0]Y);
  
  always@(*) begin
    Y = mux_value(A,S);
  end 
  
  function [3:0]mux_value;
    input  [63:0]A;
    input  [3:0]S;
    begin
      mux_value = A[4*S +: 4];
    end 
  endfunction
endmodule 

// now tb
// Code your testbench here
// or browse Examples
`timescale 1ns/1ns
module mux_tb;
  reg [63:0]A;
  reg [3:0]S;
  wire [3:0]Y;
  
  mux_16X1 uut(
    .A(A),
    .S(S),
    .Y(Y)
  );
  
  initial begin
    $monitor(" Time = %0t | A = %b, S = %b => Y = %b", $realtime, A , S , Y );
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, mux_tb);
  end 
  
  initial begin
    A[0 +:4] = 4'd0;
    A[1*4 +: 4] = 4'd1;
    A[2*4 +: 4] = 4'd2;
    A[3*4 +: 4] = 4'd3;
    A[4*4 +: 4] = 4'd4;
    A[5*4 +: 4] = 4'd5;
    A[6*4 +: 4] = 4'd6;
    A[7*4 +: 4] = 4'd7;
    A[8*4 +: 4] = 4'd8;
    A[9*4 +: 4] = 4'd9;
    A[10*4 +: 4] = 4'd10;
    A[11*4 +: 4] = 4'd11;
    A[12*4 +: 4] = 4'd12;
    A[13*4 +: 4] = 4'd13;
    A[14*4 +: 4] = 4'd14;
    A[15*4 +: 4] = 4'd15;
 S = 4'd0; #10;
 S = 4'd1 ; #10;
    

 S = 4'd2; #10;
    

 S = 4'd3; #10;
    

 S = 4'd4; #10;
    $finish;
  end 
endmodule 
