// for design flow
// Code your design here
module full_adder_dataflow(A, B, Cin, S, Cout);
  input A, B, Cin;
  output reg S, Cout;
  assign S = A^B^Cin;
  assign Cout = (Cin & ( A^B )) + (A&B);
endmodule

// for testbech
// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module  full_adder_tb;
  reg A, B, Cin;
  wire S, Cout;
  
  full_adder_dataflow uut(
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
