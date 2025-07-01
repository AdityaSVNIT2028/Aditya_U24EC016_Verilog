`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 25.06.2025 22:48:53
//////////////////////////////////////////////////////////////////////////////////
// priority 2x4 decoder
module traffic_light_design( input i_clk, i_rst,

output //  o_ns_g, o_ns_y, o_ns_r, o_ew_g, o_ew_ry, o_es_r
// all this can be implent by usign one hot encoding style
[5:0] o_light
    );
    
    wire q1, q0, d0, d1;
    
    xor g1(d1, q0, q1);
    not g2(d0, q0);
    d_ff ff1(.D(d1), .clk(i_clk), .rst(i_rst), .Q(q1));
    d_ff ff0(.D(d0), .clk(i_clk), .rst(i_rst), .Q(q0));
     
     wire q0_bar, q1_bar;
    not g3(q0_bar, q0);
    not g4(q1_bar, q1);
    
    and g5(o_light[5], q0_bar, q1_bar);
    and g6(o_light[4], q1_bar, q0);
    buf g7(o_light[3], q1);
    buf g8(o_light[0], q1_bar);
    and g9(o_light[2], q1, q0_bar);
    and g10(o_light[1], q1, q0); 
    
endmodule
