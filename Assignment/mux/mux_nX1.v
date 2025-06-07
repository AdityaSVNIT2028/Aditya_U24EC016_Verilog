// Code your design here
`timescale 1ns/1ns
module mux_nX1 #(parameter N = 8, parameter width = 3)(input [(N*width)-1:0] I, input [$clog2(N)-1:0] S, output reg [width -1 : 0]Y);
  integer i, j, k;
  always @(*) begin 
    for(i = 0; i<N; i++) begin 
      
      if( S == i)begin
        k= (width*i);
        for(j=0; j<width;j++) begin
          Y[j] = I[k];
          k++;
        end
      end
    end 
  end 
endmodule 

// for test bench
// Code your testbench here
// or browse Examples
`timescale 1ns/1ns
module mux_tb#(parameter N = 8, parameter width = 3)();
  reg [23:0] I;
  reg [2:0] S;
  wire [2 : 0]Y;
  
  mux_nX1 uut (
    .I(I),
    .S(S),
    .Y(Y)
  );
  
  initial begin
    $monitor("Time = %0t | I = %b, S = %b => Y = %b",$time, I, S, Y);
  end 
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0, mux_tb);
  end
  
  
  initial begin
    I =24'b 1010001110110101011011; S = 3'b000; #10;
    I =24'b 1010001110110101011011; S = 3'b001; #10;
    I =24'b 1010001110110101011011; S = 3'b010; #10;
    
    $finish;
  end
endmodule
