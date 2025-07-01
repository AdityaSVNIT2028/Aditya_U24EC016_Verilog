// for design
// Code your design here
module xor_behavioural(input a , input b, output reg y);
  always@(a,b)begin
    y =  a^b;
  end 

endmodule 

// for testbench
module xor_tb();
  reg a, b;
  wire y;

  // DUT instantiation
  xor_behavioural uut (
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
