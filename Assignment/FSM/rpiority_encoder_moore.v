`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya  
// 
// Create Date: 25.06.2025 12:10:50
//////////////////////////////////////////////////////////////////////////////////
// designing the mealy state machine 
// 1 bit parity generator
// using moore FSM
module parity_generator_design( input i_x, input i_rst, input i_clk, 
output o_p
    );
    // the state o determine that the number of 1's is even so we need 1 parity bit 
    // and the state 1 determine that the number of 1's is odd and hence we need 0 parity bit
    wire q, d;
    not n1( o_p, q);
    xor n2(d, q, i_x);
    d_ff ff1(.D(d), .rst(i_rst), .clk(i_clk), .Q(q));
     
    
endmodule
`timescale 1ns / 1ps
module d_ff(
input clk, D, rst,
output reg Q
    );
    
    always@(negedge clk) begin
    if(rst)
    Q <= 1'b0;
    else
    Q <= D;
    end
endmodule

// now tb
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 25.06.2025 19:53:02
// Description: Testbench for Moore FSM Odd Parity Generator
//////////////////////////////////////////////////////////////////////////////////

module parity_tb();

reg i_x, i_rst, i_clk;
wire o_p;

// Instantiate the DUT (Device Under Test)
parity_generator_design uut (
    .i_x(i_x),
    .i_rst(i_rst),
    .i_clk(i_clk),
    .o_p(o_p)
);

// Clock generation: 10ns period (5ns high, 5ns low)
always #5 i_clk = ~i_clk;

// Stimulus block
initial begin
   
    // Initial values
    i_clk = 0;
    i_rst = 1;
    i_x = 0;

    // Apply reset
    #10 i_rst = 0;

    // Apply test inputs
    #10 i_x = 0;  
    #10 i_x = 1;  //
    #10 i_x = 1;  
    #10 i_x = 0;  
    #10 i_x = 1;  

    #20 $finish;
end

endmodule
