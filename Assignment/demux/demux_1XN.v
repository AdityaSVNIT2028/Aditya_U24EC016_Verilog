// design
// Code your design here
// demux 1XN
module demux_1XN #(parameter N = 8, width = 3)(input [width-1:0]A, input [$clog2(N) -1:0]S, output reg [N*width -1:0]Y);
  integer i,j,k;
  always @(*) begin
    Y = {N*width{1'b0}};
    
    Y[S*width +: width] = A;
  end 
endmodule

// for tb
// Code your testbench here
// or browse Examples

module demux_tb #(parameter N = 8, width = 3)();
  reg [2:0]A;
  reg [2:0]S;
  wire [23:0]Y;

  demux_1XN uut (
    .A(A),
    .S(S),
    .Y(Y)
  );
  
  initial begin
    $monitor("Time = %0t | A = %b, S = %b => Y = %b",$time, A, S, Y);
  end 
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0, demux_tb);
  end
  
  initial begin
    A =3'b100; S = 3'b0; #10;
    A = 3'b100; S = 3'b001; #10;
    $finish;
  end
  
endmodule 
