`timescale 1ns / 1ps
module syn_3_cou( 
input clk, 
output  [2:0]Q 
    );
    reg [2:0]T;
    reg rst;
    wire [2:0]Q1;
        
   
    
    // uing the always block as assignment operator is used
    always @(negedge clk) begin
    rst <= 1'b0;
    T[0] <= 1'b1; 
   
    T[1] <= Q1[0];
    T[2] <= Q1[0] & Q1[1];
    
    if(Q1 == 3'b111) begin
    rst <= 1'b1;
    end
    end

// generating 3 ff
    genvar i;
    generate 
    for(i = 0; i<=2; i = i+1) begin
    T_ff ff(.T(T[i]), .clk(clk), .rst(rst), .Q(Q1[i]));
    end
    endgenerate    
    
    assign Q = Q1;
endmodule

module T_ff(input T, clk, rst,
output reg Q);
always @(negedge clk) begin
if(rst)
Q <= 0;
else 
Q <= T;
end
endmodule
