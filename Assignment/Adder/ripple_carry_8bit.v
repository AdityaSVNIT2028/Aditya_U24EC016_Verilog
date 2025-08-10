// for design
 // Code your design here
// code for 8 bit ripple carry adder
module ripple_carry_adder_8_bit(input [7:0]A,input [7:0]B, output reg [8:0]C, output reg Cout, output reg [7:0]S);
  integer i;
  always @(*)
                                  begin
                                    C[0] = 0;
                                    for(i=0; i<8; i++)
                                      begin
                                      S[i] = A[i]^B[i]^C[i];
                                        C[i+1] = (A[i]^B[i])&C[i] | A[i]&B[i];    
                                      end
                                      Cout = C[8];
                                      end
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
  
  ripple_carry_adder_8_bit uut(
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
