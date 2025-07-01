// for design module 
// Code your design here
module xor_nand_structural(input a, input b, output y);
  wire w1, w2, w3, w4;
  not(w1, a);
  not(w2, b);
  
  nand(w3, w1, b);
  nand(w4, a, w2);
  
  nand(y, w3, w4);
  
endmodule

// for test bench
// Code your testbench here
// or browse Examples
module xor_tb();
  reg a, b;
  wire y;

  // DUT instantiation
  xor_nand_structural uut (
    .a(a),
    .b(b),
    .y(y)
  );

  // Monitor signals
  initial begin
    $monitor("Time = %0t | a = %b, b = %b => y = %b", $time, a, b, y);
  end

  // VCD dump for waveform viewing
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0, xor_tb);
  end 

  // Test vectors
  initial begin
    a = 0; b = 0; #10;    
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;
    $finish;
  end
endmodule
