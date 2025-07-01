// Code your design here
// 1X16 demux using a task
`timescale 1ns/1ns
module demux_1X16(input I, input [3:0]S, output reg [15:0]Y);
 
  always @(*) begin
    Y = 16'b0;
    demux_value(I, S, Y);
  end
  
  task demux_value;
    input I;
    input [3:0]S;
    output [15:0]Y;
    begin 
      Y = 16'b0;
      Y[S] = I;
    end
  
  endtask
endmodule 

// now for testbech
// Code your testbench here
// or browse Examples
`timescale 1ns/1ns
module demux_tb();
  reg I;
  reg [3:0]S;
  wire [15:0]Y;
  
  demux_1X16 uut (
    .I(I), 
    .Y(Y), 
    .S(S)
  );
  
  initial begin
    $monitor("Time = %0t | I = %b, S = %b => Y = %b",$time, I, S, Y);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, demux_tb);
  end 
  
  initial begin
    I = 1'b0; S = 4'b0;#5;
    I = 1'b1; S = 4'd0;#5;
    I = 1'b1; S = 4'd1;#5;
    I = 1'b1; S = 4'd2;#5;
    I = 1'b1; S = 4'd3;#5;
    I = 1'b1; S = 4'd4;#5;
    I = 1'b1; S = 4'd5;#5;
    $finish;
  end 
  
endmodule
