// Code your design here
module two_bit_comp(input [1:0]a, input [1:0]b, output reg y);
  always@(a, b) begin
    if(a>b)
      y = 1;
    else if(a == b)
      y = 1;
    else if(a < b)
      y = 0;
  end 
endmodule

// for test bench
// Code your testbench here
// or browse Examples
module two_bit_comp_tb();
  reg [1:0]a;
  reg [1:0]b;
  wire y;
  
  two_bit_comp uut (
    .a(a),
    .b(b),
    .y(y)
  );
  
  
  initial begin
    $monitor("Time = %0t | a = %b, b = %b, y = %b", $time, a, b, y);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, two_bit_comp_tb);
  end 
  
  initial begin
    a = 2'b00; b = 2'b00; #10;
    a = 2'b00; b = 2'b01; #10;
    a = 2'b00; b = 2'b10; #10;
    a = 2'b00; b = 2'b11; #10;
//     a = 2'b01; b = 2'b00; #10;
//     a = 2'b01; b = 2'b01; #10;
//     a = 2'b01; b = 2'b10; #10;
//     a = 2'b01; b = 2'b11; #10;
//     a = 2'b10; b = 2'b00; #10;
//      a = 2'b10; b = 2'b01; #10;
//     a = 2'b10; b = 2'b10; #10;
//     a = 2'b10; b = 2'b11; #10;
//     a = 2'b11; b = 2'b00; #10;
//     a = 2'b11; b = 2'b01; #10;
//     a = 2'b01; b = 2'b10; #10;
//     a = 2'b01; b = 2'b11; #10;
    
    $finish;
  end 
endmodule  
