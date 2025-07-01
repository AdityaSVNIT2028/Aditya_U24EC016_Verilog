// Code your design here
// implemeanttion of not gate using mux
module mux_not(input [1:0]I, input A, output reg Y);
  always @(*) begin
    if(A == 1'b1)
      Y = I[0];
    else
      Y = I[1];
  end 
endmodule 

// for testbench
// Code your testbench here
// or browse Examples
module mux_not_tb();
  reg [1:0]I;
  reg A;
  wire Y;
  
  mux_not uut(
    .I(I), 
    .A(A),
    .Y(Y)
  );
  
  initial begin
    $monitor("Time = %0t | I = %b, A = %b => Y = %b", $time, I, A, Y);
  end 
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, mux_not_tb);
  end
  
  initial begin
    I = 2'b10; A = 0; #10;
    I = 2'b10; A = 1; #10;
  end 
endmodule
