`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 24.06.2025 08:59:57
// Module Name: button_design
// Description: design a secondary circuit that will transmit a HIGH pulse with duration of only one cycle when the manual button is pressed, and won't transmit another pulse until the button is depressed and pressed again
//////////////////////////////////////////////////////////////////////////////////


module button_design( input button, clk,
output reg pulse
    );
    reg  off = 1'b0 ;
    always@(posedge clk) begin
    
//    if(button == 1'b1 && in == 1'b0) begin
//    pulse = 1'b1;
//    in = 1'b1;
//    #5 pulse = 1'b0;
//    end
     if(button == 1'b0) begin
    off = 1'b1;
    pulse = 1'b0;
    end 
     if (button == 1'b1 && off == 1'b1) begin
    pulse = 1'b1;
    #5 pulse = 1'b0;
    off = 1'b0;
    end
    end
endmodule
