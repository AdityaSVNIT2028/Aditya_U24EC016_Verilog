module mux(input [1:0]I, input S, output reg Y);
  always @(I, S)begin
    Y = ((~S)  & I[0]) | (S & I[1]);
  end
endmodule
