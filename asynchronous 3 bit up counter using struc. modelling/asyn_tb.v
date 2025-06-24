`timescale 1ns / 1ps

module asyn_tb();
    reg clk, rst;
    wire [2:0] Q, Qbar;

    asyn_cunt uut (
        .clk(clk),
        .rst(rst),
        .Q(Q),
        .Qbar(Qbar)
    );

    // Generate clock
    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        rst = 1'b1;       // Apply reset initially
        #5 rst = 1'b0;    // Release reset
        #200 $finish;     // Run for sufficient time to observe counting
    end
endmodule
