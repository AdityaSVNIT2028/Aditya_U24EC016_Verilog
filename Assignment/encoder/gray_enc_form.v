// for design
// Code your design here
// gray code encoder
module gray_code_en_8X3(input [7:0]I, output reg valid, output reg [2:0]Y);
  integer i;
  reg [2:0]A;
  always @(*) begin
    valid = 1'b0;
    Y = 3'b0;
    for (i = 0; (i< 8) && (valid==0); i++) begin
      if(I[i] == 1 ) begin 
        // gray = bin(bin>>1)
        A = i[2:0];
        Y = A^(A>>1);
        valid = 1;
      end 
    end 
      
  end
endmodule 

// tb
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
