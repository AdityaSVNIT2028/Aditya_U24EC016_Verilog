// Code your design here
module decoder_3X8(input [2:0]A, input En, output reg [7:0]I);
  always @(A|En) begin 
    if (En == 0)
      I = 8'b00000000;
    else begin
      case(A)
        3'b000 : I = 8'b00000001;
        3'b001 : I = 8'b00000010;
        3'b010 : I = 8'b00000100;
        3'b011 : I = 8'b00001000;
        3'b100 : I = 8'b00010000;
        3'b101 : I = 8'b00100000;
        3'b110 : I = 8'b01000000;
        3'b111 : I = 8'b10000000;
      endcase
    end 
  end
endmodule 

// for test bench
// Code your testbench here
// or browse Examples
module decoder_tb;
  reg [2:0]A;
  reg En;
  wire [7:0]I;
  
  decoder_3X8 uut(
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
    En = 0; A = 3'bx; #10;
    En = 1; A = 3'b000; #10;
    En = 1; A = 3'b001; #10;
    En = 1; A = 3'b010; #10;
    En = 1; A = 3'b011; #10;
    En = 1; A = 3'b100; #10;
    En = 1; A = 3'b101; #10;
    En = 1; A = 3'b110; #10;
    En = 1; A = 3'b111; #10;
    $finish;
  end 
endmodule 
