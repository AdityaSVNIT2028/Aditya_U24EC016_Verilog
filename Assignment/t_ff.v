`timescale 1ns/1ps
module t_ff(input T, input clk, input rst,
output reg Q);
always@( negedge clk) begin
 Q = 1'b0;

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