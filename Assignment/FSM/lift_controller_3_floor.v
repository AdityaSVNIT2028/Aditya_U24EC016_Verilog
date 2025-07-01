`timescale 1ns / 1ps
///////////////////////// as 1 min is very high so we are considering that the 1ms = 1min  ///////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya  
// Create Date: 26.06.2025 12:38:56
//////////////////////////////////////////////////////////////////////////////////

///////////////////////////////   HERE WE ARE ASSUMING THAT THE LIFT WILL BE WAITING FOR 3 MINUTE IF GREATER THEN IT WILL GENERATE A ALERT////////////////////////
module lift_controller_design( 
input [2:0] request_floor, in_current_floor,
input clk_i, rst_i, over_time, over_weight,//////////// if over_weight = 0 weight is correct and if over_weight = 1 weight alert and door is open 
output reg [2:0] out_current_floor, 
output reg  direction, time_alert, weight_alert, complete, door_condition, moving 
    );
    ////////////////////////////////////////    direction 0 determine that the the lifr is mocing downward (also stop if moving is 0) and 1 determine to be moving up //////////////////////////
    ///////////////////////////////////////     door_condition is 0 means the door is close and 1 if door is open   ////////////////////////////////////////////
    ////////////////////////////////////    Assuming that the clk is weighting only for 3 min   ///////////////////////////////////////
   

///////////////////////// ADDING THE CONDITION FOR THE OUTPUT CONDITIOIN ////////////////////////////////////////
always@(request_floor) begin

out_current_floor <= in_current_floor;

end
    
    //////////////////////////////  reseting condition  ////////////////////////
  always @(posedge clk_i) begin
  if(rst_i) begin
  weight_alert <= 1'b0;
  complete <= 1'b0;
  door_condition <= 1'b0;
  moving <= 1'b0;
  time_alert <= 1'b0;
  end
  /////////////////////////////////// IF RESETING IS NOT DONE /////////////////////////////////
  else begin
  if(over_weight) begin
  weight_alert <= 1'b1;
  time_alert <= 1'b0;
  moving <= 1'b0;
  door_condition <= 1'b1;
  if(over_time) begin
  time_alert <= 1'b1;
  weight_alert = 1'b0;
  moving <= 1'b0;
  door_condition <= 1'b0;
  end
  end
  ///////////////////////////////// ALSO AASSUMING THAT IF OVERTIME THAN THE LIFT DOOR IS AUTOMATICALLY CLODES //////////////////////////////////////////
  else begin
  if(over_time == 1'b1 && over_weight == 1'b0) begin
  time_alert <= 1'b1;
  weight_alert = 1'b0;
  moving <= 1'b0;
  door_condition <= 1'b0;
  end
  
  else begin
  if(request_floor > out_current_floor) begin
  moving <= 1'b1;
  door_condition <= 1'b0;
  time_alert <= 1'b0;
  weight_alert <= 1'b0;
  out_current_floor <= out_current_floor << 1;
  direction <= 1'b1;
  complete <= 1'b0;
  end
  
  else if (request_floor < out_current_floor) begin
  moving <= 1'b1;
  door_condition <= 1'b0;
  time_alert <= 1'b0;
  weight_alert <= 1'b0;
  out_current_floor <= out_current_floor >> 1;
  direction <= 1'b0;
  complete <= 1'b0;
  end
  
  else begin
  moving <= 1'b0;
  door_condition <= 1'b1;
  time_alert <= 1'b0;
  weight_alert <= 1'b0;
  direction <= 1'b0;///// also assuming that at 0 it is not moving ////////
  complete <= 1'b1;
  end
  
  end
  end
  end
  end
  
endmodule

/// now the tb
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
