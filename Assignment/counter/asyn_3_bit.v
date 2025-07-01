`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Aditya
// 
// Create Date: 20.06.2025 23:25:56
// Design Name: asynchronous counter of 3 bit
// Module Name: asyn_cunt
// Project Name: Asynchronous 3 bit counter 
// Target Devices: counter // Tool Versions: 
// Description: 

module asyn_cunt( input clk, rst,
output [2:0]Q
    );
    wire T = 1'b1;
    wire [2:0]clk1;
    // assigning the clk value 
    assign clk1 [0] = clk;
    assign clk1[1] = Q[0];
    assign clk1[2] = Q[1]; 
    // reset logic
    wire rst_i, rst_c;
    and a1(rst_i, Q[0], Q[1], Q[2]);
    or a2(rst_c, rst, rst_i);
    // now the same condition through structural modelling 
    genvar i;
    generate 
    for( i = 0; i<= 2; i = i+1) begin
    t_ff ff1( .clk(clk1[i]), .T(T), .rst(rst_c), .Q(Q[i]));
    end
    endgenerate
    
    /*
    by procedural block
    always @(*) beign
    if(Q == 3'b1) begin
    rst = 1'b1;
    end 
    else 
    rst = 1'b0;
    end
    */
     
    
endmodule
// as we have to  do all this by structual modelling
//// making a t flip flop modele // 
module t_ff(input T, input clk, input rst,
output reg Q);
always@( negedge clk) begin
 

if(rst) begin
Q<= 0;
end
else begin
if (T ==1'b1) begin
Q <= ~Q;
end 

end
end
endmodule 

// tb
`timescale 1ns / 1ps

module asyn_tb();
  reg clk, rst;
  wire [2:0] Q;

  asyn_cunt uut (
    .clk(clk),
    .rst(rst),
    .Q(Q)
  );

  initial clk = 0;
  always #5 clk = ~clk;
  
  initial begin
    $monitor("Time = %0t | clk = %b | rst = %b | Q = %b", $time, clk, rst, Q);
  end

  initial begin
    rst = 1;     
    #12 rst = 0; 
    #200;
    rst = 1;
    #10;
    rst = 0;
    #100;
    $finish;
  end
endmodule
