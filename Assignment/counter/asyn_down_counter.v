`timescale 1ns/1ps
module asyn_down_counter(input clk, rst,
                         output [2:0]Q);
  wire T = 1'b1;
  wire clk1 = ~Q[0];
  wire clk2 = ~Q[1];
  //instancing the ff
  t_ff ff1(.T(T), .clk(clk), .rst(rst), .Q(Q[0]));
  t_ff ff2(.T(T), .clk(clk1), .rst(rst), .Q(Q[1]));
  t_ff ff3(.T(T), .clk(clk2), .rst(rst), .Q(Q[2]));
endmodule 

// making a tff 
module t_ff(input T, clk, rst,
            output reg Q);
  always @(negedge clk) begin
    if(rst) 
      Q <= 1'b1;
    else if(T) 
      Q <= ~Q;
  end
endmodule 

// testbench
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
