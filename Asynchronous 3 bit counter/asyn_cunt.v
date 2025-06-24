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