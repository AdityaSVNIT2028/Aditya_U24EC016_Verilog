`timescale 1ns / 1ps


module d_latch(
    input D, en,
    output reg Q
    );
    always @(*) begin
    if(en) begin
    Q = D;
    end
    end 
endmodule
