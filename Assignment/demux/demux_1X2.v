// Code your design here
// Code your design here
// for demux
module demux_1X2(input I, input S, output reg [1:0]Y);
  always @(*) begin 
    if(S==0) begin 
      Y[0] = I;
      Y[1] = 1'b0;
    end 
    else begin
      Y[0] = 1'b0;
      Y[1] = I;
    end 
  end
endmodule

// for tb
// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module demux_tb();
  reg I, S;
  wire [1:0]Y;
  
  demux_1X2 uut (
    .I(I), 
    .S(S),
    .Y(Y)
  );
  
  initial begin
    $monitor("Time = %0t | I = %b, S = %b => Y = %b", $time, I, S, Y);
  end 
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, demux_tb);
    
  end 
  
  initial begin
    I = 1; S = 0; #10;
    I = 1; S = 1; #10;
  end 
endmodule
