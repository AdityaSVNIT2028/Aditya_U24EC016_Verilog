// for design
// Code your design here
// gray code encoder
module gray_code_en_8X3(input [7:0]I, output reg valid, output reg [2:0]Y);
  integer i;
  always @(*) begin
    valid = 1'b0;
    Y = 3'b0;
    if(I[1] == 1'b1 || I[2] == 1'b1 || I[5] == 1'b1 || I[6] == 1'b1) begin
      Y[0] = 1'b1; valid = 1'b1; end 
    if(I[2] == 1'b1 || I[3] == 1'b1 || I[4] == 1'b1 || I[5] == 1'b1)begin
      Y[1] = 1'b1; valid = 1'b1; end 
    if(I[4] == 1'b1 || I[5] == 1'b1 || I[6] == 1'b1 || I[7] == 1'b1)begin
      Y[2] = 1'b1; valid = 1'b1; end 
    if(I[0] == 1'b1)
      valid = 1'b1;
      
  end
endmodule 

// for tb
// Code your testbench here
// or browse Examples
module gray_en_tb();
  reg [7:0]I;
  wire valid;
  wire [2:0]Y;
  
  gray_code_en_8X3 tb(
    .I(I), 
    .valid(valid),
    .Y(Y)
  );
  
  initial begin
    $monitor("Time = %0t | I = %b => Y = %b, valid = %b", $time, I, Y, valid );
  end 
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, gray_en_tb);
  end
  
  initial begin
    I = 8'b00000000; #10;
    I = 8'b00000001; #10; 
    I = 8'b00000010; #10;
    I = 8'b00100000; #10;
    I = 8'b10000000; #10;
    I = 8'b00001000; #10;
    $finish;
  end 
endmodule 
