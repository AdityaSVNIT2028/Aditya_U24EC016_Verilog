`timescale 1ns / 1ps

module destgn_tb();

    // Declare testbench signals
    reg J, K, clk, rst;
    wire Q;

    
    mas_sl uut (
        .J(J),
        .K(K),
        .clk(clk),
        .rst(rst),
        .Q(Q)
    );
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        rst = 1;
        J = 0;
        K = 0;
        #10;
        rst = 0;
        #10; J = 0; K = 0;
        #10; J = 0; K = 1;
        #10; J = 1; K = 0;
        #10; J = 1; K = 1;
        #10; J = 1; K = 1;
        #10; rst = 1;
        #10; rst = 0;
        #20;
        $finish;
    end

endmodule
