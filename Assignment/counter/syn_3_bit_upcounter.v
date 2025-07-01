// making the design for it 
module sync_cout( input clk, 
                 output [2:0]Q
                );
  // using as directly assigment of the ouput in instance creates problem
  
  reg rst;
  wire [2:0]T;

  T[0] = 1'b1;
  T[1] = Q[0];
  T[2] = Q[0] & Q[1];

  always@(*) begin
    if (Q == 3'b111)
            rst = 1'b1;
        else
            rst = 1'b0;
  end
  
  genvar i;
  generate 
    for(i = 0; i<= 2; i = i+1) begin
      t_ff ffa(
        .T(T[i]), .clk(clk), .rst(rst), .Q(Q[i])
      );
    end
  endgenerate 
  
endmodule

// now this is testbench
`timescale 1ns / 1ps
module syn_tb();
reg clk;
wire [2:0] Q;

sync_cou uut(
.clk(clk),
.Q(Q)
);
always #5 clk = ~clk;

initial begin
clk = 1'b0;
#100
$finish;
end

endmodule
