// Code your design here
// making 8X3 encoder using tasks
`timescale 1ns/1ns
module encoder_8X3(input [7:0]I,output reg valid, output reg [2:0]Y);
  
  always @(*) begin
    valid  = 1'b0;
    Y = 3'b0;
    encoder(I, valid, Y);
  end 
  task encoder;
    input [7:0]I;
    output valid;
    output [2:0]Y;
    integer i;
    begin
	   valid  = 1'b0;
       Y = 3'b0;
      for(i = 0; (i<8) && (valid == 0); i++) begin
        if(I[i] ==  1'b1)begin
          Y = i[2:0];
          valid = 1'b1;
        end
      end
    end 
  endtask 
endmodule 

// for tb
// Code your testbench here
// or browse Examples
`timescale 1ns/1ns
module encoder_tb;
  reg [7:0]I;
  wire valid;
  wire [2:0]Y;
  
  encoder_8X3 uut (
    .I(I), 
    .valid(valid), 
    .Y(Y)
  );
  
  initial begin
    $monitor("Time = %0t | I = %b => valid = %b, Y = %b", $time, I, valid, Y);
  end 
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, encoder_tb);
  end 
  
  initial begin 
    I = 8'b00000000; #10;
    I = 8'b00000001; #10;
    I = 8'b00000010; #10;
    I = 8'b00000100; #10;
    I = 8'b00001000; #10;
    I = 8'b00010000; #10;
    I = 8'b00100000; #10;
    I = 8'b01000000; #10;
    I = 8'b10000000; #10;
  $finish;
  end
  endmodule 
