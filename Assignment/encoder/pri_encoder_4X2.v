// Code your design here
`timescale 1ns/1ns
module pri_en_4X2(input [3:0]I,output reg [1:0]Y, output reg valid);
  integer i;
  always @(*)begin
    valid = 0;
    Y = 2'b0;
    for(i=3; (i >= 0) && (valid == 0); i = i-1) begin
      if(I[i] == 1) begin
        Y = i[$clog2(4)-1:0];
        valid = 1;
        
      end
    end 
  end
endmodule 

// for tb
// Code your testbench here
// or browse Examples
`timescale 1ns/1ns
module pri_en_tb();
  reg [3:0]I;
  wire [1:0]Y;
  wire valid;
  
  pri_en_4X2 uut (
    .I(I),
    .Y(Y),
    .valid(valid)
  );
  
  initial begin
    $monitor("Time = %0t | I = %b => Y = %b, valid = %b", $time, I, Y, valid);
  end 
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, pri_en_tb);
  end 
  
  initial begin
    I = 4'b0000;#10;
    I = 4'b0001;#10;
    I = 4'b0010;#10;
    I = 4'b0011; #10;
    I = 4'b1010;#10;
    I = 4'b0111; #10;
    $finish;
  end
 
endmodule 
