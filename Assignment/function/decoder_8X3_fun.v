// Code your design here
// 8X3 encoder using function
`timescale 1ns/1ns
module encoder_8X3( input [7:0]A, output reg [2:0]Y, output reg valid);
  always@(*) begin 
   Y = encoded_value(A);
   valid = valid_value(A);
  end
  
  function [2:0]encoded_value;
    input [7:0]A;
    integer i;
    begin
      encoded_value = 3'b0;
      for(i = 7; i>=0 ; i--) begin
        if( A[i] == 1)
          encoded_value = i[2:0];
      end
    end
  endfunction
  
  function valid_value;
    input [7:0]A;
    begin
      valid_value = |A;
    end
  endfunction
  
endmodule

// for testbench
// Code your testbench here
// or browse Examples
`timescale 1ns/1ns
module encoder_tb;
  reg [7:0]A;
  wire valid;
  wire [2:0]Y;
  
  encoder_8X3 uut (
    .A(A), 
    .valid(valid), 
    .Y(Y)
  );
  
  initial begin
    $monitor("Time = %0t | A = %b => valid = %b, Y = %b", $time, A, valid, Y);
  end 
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, encoder_tb);
  end 
  
  initial begin 
    A = 8'b00000000; #10;
    A = 8'b00000001; #10;
    A = 8'b00000010; #10;
    A = 8'b00000100; #10;
    A = 8'b00001000; #10;
    A = 8'b00010000; #10;
    A = 8'b00100000; #10;
    A = 8'b01000000; #10;
    A = 8'b10000000; #10;
  $finish;
  end
  endmodule 
