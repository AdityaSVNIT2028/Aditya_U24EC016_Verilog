// Code your design here
// xor gate using mux
module and_mux(input A, input B, output reg Y);
  reg[1:0]I;
  
  always @(*) begin
    I[0]  = B;
    I[1] = ~B;
    if(A == 1'b0)
      Y = I[0];
    else
      Y = I[1];
  
  end
endmodule 

// for tb
// Code your testbench here
// or browse Examples
module and_mux_tb();
  reg B;
  reg A;
  wire Y;
  
  and_mux uut(
    .B(B),
    .A(A),
    .Y(Y)
  );
  
  initial begin
    $monitor("Time = %0t | A = %b, B = %b => Y = %b", $time, A, B, Y);
  end
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0,and_mux_tb);
  end
  
  initial begin
   A = 1'b0 ; B = 1'b0 ; #10;
   A = 1'b0 ; B = 1'b1 ; #10; 
   A = 1'b1 ; B = 1'b0 ; #10; 
   A = 1'b1 ; B = 1'b1 ; #10; 
    $finish;
  end
endmodule 
