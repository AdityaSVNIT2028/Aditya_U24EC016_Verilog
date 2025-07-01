`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 29.06.2025 14:24:27
//////////////////////////////////////////////////////////////////////////////////

module lift_tb();
reg [2:0] request_floor, in_current_floor;
reg clk_i, rst_i, over_time, over_weight;
wire [2:0] out_current_floor;
wire direction, time_alert, weight_alert, complete, door_condition, moving;

lift_controller_design uut(
.request_floor(request_floor),
.in_current_floor(in_current_floor),
.clk_i(clk_i), 
.rst_i(rst_i),
.over_time(over_time),
.over_weight(over_weight),
.out_current_floor(out_current_floor),
.direction(direction),
.time_alert(time_alert),
.weight_alert(weight_alert),
.complete(complete),
.door_condition(door_condition),
.moving(moving)
);

always #5 clk_i = ~clk_i;

initial begin
in_current_floor <= 3'b001;
clk_i <= 1'b0;
rst_i <= 1'b1;
over_time <= 1'b0; 
over_weight <= 1'b0;

#20 rst_i <= 1'b0;
request_floor <= 3'b100;
in_current_floor <= 3'b001;
over_weight <= 1'b0;
over_time <= 1'b0;

#20 request_floor <= 3'b010;
in_current_floor <= 3'b001;

#50 over_weight <= 1'b1;

#20 rst_i <= 1'b1;
in_current_floor <= 3'b100;
#10 rst_i <= 1'b0;
over_time = 1'b1;
#80
$finish ;


end

endmodule
