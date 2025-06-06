// Code your design here
// it is 2X4 instead of 2X1
module decoder_2X1(input [1:0]A, input En, output reg [3:0]I);
  

  always @(A, En)
    begin 
      if (En == 0) begin 
        I = 4'b0000;
      end 
      else begin
        
      if(A == 2'b00) begin
        I = 4'b0001;
      end
      else if(A == 2'b01) begin
        I = 4'b0010;
      end 
      else if(A == 2'b10) begin
        I = 4'b0100;
      end
      
      else if (A == 2'b11) begin
        I = 4'b1000;
          end 
        
      end 
    end 
  
endmodule 

// for test bench
module decoder_tb;
  reg [1:0] A;
  reg En;
  wire [3:0] I;

  decoder_2X1 uut (
    .A(A),
    .En(En),
    .I(I)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, decoder_tb);
    $monitor("Time = %0t | A = %b, En = %b => I = %b", $time, A, En, I);
  end

  initial begin
    En = 0; A = 2'bx; #10;  // Test with enable = 0
    En = 1; A = 2'b00; #10;
    En = 1; A = 2'b01; #10;
    En = 1; A = 2'b10; #10;
    En = 1; A = 2'b11; #10;
    $finish;
  end
endmodule
