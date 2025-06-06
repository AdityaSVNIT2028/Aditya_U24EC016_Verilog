// design
// Code your design here
// creating a mux of size 2X1
module mux_2X1(input I0, input I1, input S, output reg Y);
  always @(*) begin 
    if(S == 0)
      Y = I0;
    else if(S==1)
      Y = I1;
  end 
endmodule 

// for test bench
// Code your testbench here
// or browse Examples
// `timescale 1ns/1ps
module mux_tb();
  reg I0, I1, S;
  wire Y;
  
  mux_2X1 uut (
    .I0(I0), 
    .I1(I1),
    .S(S),
    .Y(Y)
  );
  
  initial begin
    $monitor("Time = %0t | I0 = %b, I1 = %b, S = %b => Y = %b", $time, I0, I1, S, Y);
  end 
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, mux_tb);
  end 
  initial begin
    I0 = 0; I1 =1; S = 0; #10;
    I0 = 0; I1 = 1; S = 1; #10;
  end
endmodule
