// Code your design here
module cla_8_bit(input [7:0]A, input [7:0]B, output reg [8:0]C, output reg [7:0]S, output Cout );
  integer i;
  reg [7:0]G;
  reg [7:0]P;
  always @(*)
    begin
      
      C[0] = 0;
      
      G = A & B;
      P = A ^ B;
      
       for(i = 0; i<8; i++)
        begin
         C[i+1] = G[i] | (P[i]&C[i]);
          S[i] = P[i]^C[i];
        end 
      
    end
  assign Cout = C[8];
endmodule 

// for test bench
// Code your testbench here
// or browse Examples
module ripple_carry_adder_tb;
  reg [7:0]A;
  reg [7:0]B;
  
  wire [8:0]C;
  wire [7:0]S;
  wire Cout;
  
  cla_8_bit uut(
    .A(A), 
    .B(B),
    .C(C),
    .S(S),
    .Cout(Cout)
  );
  
  initial begin
    $monitor("Time = %0t | A = %b, B = %b, C = %b, S = %b, Cout = %b", $time, A, B, C, S, Cout);
  end 
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, ripple_carry_adder_tb);
  end 
  
  initial begin
    A = 8'b10101011; 
    B = 8'b01100110; 
    $finish;
  end 
endmodule  
