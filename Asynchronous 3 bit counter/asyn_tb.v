`timescale 1ns / 1ps

module asyn_tb();
  reg clk, rst;
  wire [2:0] Q;

  asyn_down_counter uut (
    .clk(clk),
    .rst(rst),
    .Q(Q)
  );

  initial clk = 0;
  always #5 clk = ~clk;
  
  initial begin
    $monitor("Time = %0t | clk = %b | rst = %b | Q = %b", $time, clk, rst, Q);
  end

  initial begin
    rst = 1;     
    #12 rst = 0; 
    #200;
    rst = 1;
    #10;
    rst = 0;
    #100;
    $finish;
  end
endmodule
