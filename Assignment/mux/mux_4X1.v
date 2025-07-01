// design
// Code your design here
// 4X1 mux
module mux_4X1(input [1:0]I0,input [1:0]I1,input [1:0]I2,input [1:0]I3,
               input [1:0]S,
               output reg [1:0]Y);
  always @(*) begin
    if(S == 2'b0)
      Y = I0;
    else if( S == 2'b01)
    Y = I1;
  else if (S == 2'b10)
    Y = I2;
  else 
    Y = I3;
  end 
endmodule 

// for test bench
// Code your testbench here
// or browse Examples
module mux_tb();
  reg [1:0]I0;
  reg[1:0]I1;
  reg[1:0]I2; reg [1:0]I3; reg [1:0]S;
  wire [1:0]Y;
  
  mux_4X1 uut(
    .I0(I0), 
    .I1(I1),
    .I2(I2),
    .I3(I3),
    .S(S),
    .Y(Y)
  );
  
  initial begin 
    $monitor("Time = %0t | I0 = %b, I1 = %b, I2 = %b, I3 = %b, S = %b=> Y = %b",$time, I0, I1, I2, I3, S, Y);
  end 
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, mux_tb);
  end 
  initial begin
    I0 = 2'b00; I1 =2'b01;  I2 =2'b10 ; I3 =2'b11 ; S = 2'b00; #10;
    I0 = 2'b00; I1 = 2'b01; I2 =2'b10 ; I3 =2'b11 ; S = 2'b01; #10;
    I0 = 2'b00; I1 = 2'b01; I2 =2'b10 ; I3 =2'b11 ; S = 2'b11; #10;
    I0 = 2'b00; I1 = 2'b01; I2 =2'b10 ; I3 =2'b11 ; S = 2'b10; #10;
    
  end
endmodule 
             
