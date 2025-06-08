// Code your design here

// creating 32 bit adder 
module Carry_select_adder_32bit(input [31:0]A, input [31:0]B, output reg [31:0]S, output reg Cout);
  
  wire [15:0] S_lower;// by gpt
  wire[15:0] S_0, S_1;
  wire Cout_lower,  Cout_0, Cout_1;
  
  
  
  // for right hand bit
  rca_16_bit rca_lower(
    .A(A[15:0]),
    .B(B[15:0]), 
    .Cin(1'b0),
    .S(S_lower), 
    .Cout(Cout_lower)
  );
  // for next 16 bit if carry bit is 0
  rca_16_bit rca_carry_0(
    .A(A[31:16]),
    .B(B[31:16]),
    .Cin(1'b0),
    .S(S_0[15:0]),
    .Cout(Cout_0)
  );
  // for next 16 bit if carry bit is 1
  rca_16_bit rca_carry_1(
    .A(A[31:16]),
    .B(B[31:16]),
    .Cin(1'b1),
    .S(S_1[15:0]),
    .Cout(Cout_1)
  );
  
  mux_2X1 lower(
    .I0(S_0), 
    .I1(S_1),
    .Smux(Cout_lower),
    .Y(S[31:16])
  );
    always @(*) begin
      
      S[15:0] = S_lower;
      
    if(Cout_lower == 1'b0)
     Cout = Cout_0;
  else 
     Cout = Cout_1;
    end 
endmodule 
    
// for 16 bit ripple carry adder
module rca_16_bit(input [15:0]A, input [15:0]B, input Cin, output reg [15:0]S, output reg Cout);
  reg [16:0]C;
  integer i;
  
  always @(*) begin
    C[0] = Cin;
  
    for(i = 0; i<16; i++) begin
      S[i] = A[i]^B[i]^C[i];
      C[i+1] = ((A[i]^B[i])&C[i])|(A[i]&B[i]);
    end 
    Cout = C[16];
  end
endmodule 

module mux_2X1(input [15:0]I0, input [15:0]I1, input Smux, output reg [15:0] Y);
  always @(*) begin 
    if(Smux == 1'b0)
      Y = I0;
    else if (Smux== 1'b1)
      Y = I1;
  end 
endmodule

// for test bench
// Code your testbench here
// or browse Examples
module csa_tb();
  reg [31:0] A, B;
  wire [31:0] S;
  wire Cout;
  
  Carry_select_adder_32bit uut(
    .A(A), 
    .B(B),
    .S(S),
    .Cout(Cout)
  );
  
  initial begin
    $monitor("Time  = %0t | A = %b, B = %b => S = %b, Cout = %b", $time, A, B, S, Cout);
  end 
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, csa_tb);
  end
  
  initial begin
    A = 32'b10110001010001110101001100010101; B = 32'b00101011101000101010011010110001;#10;
    $finish;
  end 
endmodule 
