`timescale 1ns / 1ps

module pattern_detector_tb();

    reg i_clk, i_rst, i_a;
    wire o_detect;

    reg [31:0] data_stream = 32'b10110110110100110110101101101101;

    pattern_detec_design uut(
        .i_clk(i_clk),
        .i_rst(i_rst),
        .i_a(i_a),
        .o_detect(o_detect)
    );

    always #5 i_clk = ~i_clk;  // 10 ns clock period

    initial begin
    i_clk = 1'b0;
    i_rst = 1'b1;
    i_a = 1'b0;
    
    repeat(2) @(posedge i_clk);
    i_rst = 1'b0;
    
    @(posedge i_clk) i_a = 1;
    @(posedge i_clk) i_a = 1;
    @(posedge i_clk) i_a = 0;
    @(posedge i_clk) i_a = 0;
    @(posedge i_clk) i_a = 1;
    @(posedge i_clk) i_a = 0;
    @(posedge i_clk) i_a = 1;
    @(posedge i_clk) i_a = 1;
    @(posedge i_clk) i_a = 1 ;
    @(posedge i_clk) i_a =  1;
    @(posedge i_clk) i_a = 1 ;
    @(posedge i_clk) i_a =0  ;
    @(posedge i_clk) i_a =0  ;
    @(posedge i_clk) i_a =0  ;
    @(posedge i_clk) i_a =0  ;
    @(posedge i_clk) i_a =1  ;
     @(posedge i_clk) i_a = 1;
    @(posedge i_clk) i_a = 1;
    @(posedge i_clk) i_a = 0;
    @(posedge i_clk) i_a = 0;
    @(posedge i_clk) i_a = 1;
    @(posedge i_clk) i_a = 0;
    @(posedge i_clk) i_a = 1;
    @(posedge i_clk) i_a = 1;
    @(posedge i_clk) i_a = 1 ;
    @(posedge i_clk) i_a =  1;
    @(posedge i_clk) i_a = 1 ;
    @(posedge i_clk) i_a =0  ;
    @(posedge i_clk) i_a =0  ;
    @(posedge i_clk) i_a =0  ;
    @(posedge i_clk) i_a =0  ;
    @(posedge i_clk) i_a =1  ;
    
    
    #20;
    $finish;
    end

endmodule
