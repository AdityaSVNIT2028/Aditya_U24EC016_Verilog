// Code your design here
module full_adder_structural(A, B, Cin, S, Cout);
  input A, B, Cin;  
  output S, Cout;
  wire w1, w2, w3; 
  and(w1, A, B);
  and(w2, B, Cin);
  and(w3, A, Cin);
  
  xor(S, A, B, Cin);
  or(Cout, w1, w2, w3);
  
endmodule

// for test bench
// Code your testbench here
// or browse Examples
module  full_adder_tb;
  reg A, B, Cin;
  wire S, Cout;
  
  full_adder_structural uut(
    .A(A),
    .B(B),
    .Cin(Cin),
    .S(S),
    .Cout(Cout)
  );
  
  initial begin
    $monitor("Time = %0t | A = %b, B = %b, Cin = %b => S = %b, Cout = %b", $time, A, B, Cin, S, Cout);
             end
             
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0, full_adder_tb);
  end
             
  initial begin
  A = 0; B = 0; Cin = 0; #10;  
  A = 0; B = 0; Cin = 1; #10;  
  A = 0; B = 1; Cin = 0; #10;  
  A = 0; B = 1; Cin = 1; #10;  
  A = 1; B = 0; Cin = 0; #10;
  A = 1; B = 0; Cin = 1; #10;  
  A = 1; B = 1; Cin = 0; #10;   
  A = 1; B = 1; Cin = 1; #10;   
  $finish ;
  end
              
endmodule
