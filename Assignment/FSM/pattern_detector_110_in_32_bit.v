`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aitya
// Create Date: 26.06.2025 15:37:21
// 
//////////////////////////////////////////////////////////////////////////////////


module pattern_detec_design(input i_clk, i_rst, i_a,
output o_detect
    );
    
    parameter idle = 0,
              s1 = 1,
              s11 = 3,
              s110 = 6;
    
    reg [2:0] current_state,  next_state;
    
     assign o_detect = current_state == s110 ? 1:0;
    /////////////////////////       For determining what was the current state        //////////////////////////////// 
     always @(posedge i_clk) begin
     if( i_rst)
     current_state <= idle;
     else
     current_state <= next_state;
     end
     
     always @( current_state or i_a) begin
     case(current_state)
        idle: begin
        if(i_a) next_state  = s1;
        else next_state = idle; 
        end
        
        s1: begin
        if(i_a) next_state = s11;
        else next_state = idle;
        end
        
        s11: begin
        if(i_a) next_state = s11;
        else next_state = s110; 
        end
        
        s110: begin
        next_state = idle;
        end
        endcase
     end
    
endmodule

// for tb
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
