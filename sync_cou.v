`timescale 1ns / 1ps

module sync_cou(input clk,
output wire [2:0]Q
    );
    wire [2:0]T;
    reg rst = 1'b1;

   
    assign T[0] = 1'b1;
    // generating 3 t flip flop block
    genvar i;
    generate
    for( i = 0; i<= 2; i = i+1) begin
    t_ff ffa(
    .clk(clk), .T(T[i]), .rst(rst), .Q(Q[i])
    );
    end
    endgenerate
    // assigning next values
    assign T[1] = Q[0];
    assign T[2] = Q[0] & Q[1];
    // continous assignment using procedural block
    
    
       always @(*) begin
        if (Q == 3'b111)
            rst = 1'b1;
        else
            rst = 1'b0;
    end
    
    
    
endmodule

// making t flip flop module
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