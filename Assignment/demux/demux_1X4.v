// for design
// Code your design here
// 1X4 demux 
module demux_4X1(input A, input [1:0]S, output reg [3:0]Y);
  always @(*) begin
    Y = 0;
    case (S)
    2'b0:begin Y[S] = A;end 
    2'b01:begin Y[S] = A;end
    2'b10:begin Y[S] = A;end
    2'b11:begin Y[S] = A;end
    endcase
  end 
endmodule 

// tb
// Code your testbench here
// or browse Examples
module demux_tb();
  reg A;
  reg [1:0]S;
  wire [3:0]Y;
  
  demux_4X1 uut(
    .A(A),
    .S(S),
    .Y(Y)
  );
  
  initial begin 
    $monitor("Time = %0t | A = %b, S = %b =>Y = %b", $time, A, S, Y);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,demux_tb);
  end
  
  initial begin
     A = 1'b1; S =2'b0; #10;
     A = 1'b1; S =2'b01; #10;
     A = 1'b1; S =2'b10; #10;
     A = 1'b1; S =2'b11; #10;
  end 
endmodule
