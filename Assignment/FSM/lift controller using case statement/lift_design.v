`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Create Date: 03.07.2025 23:20:28
//////////////////////////////////////////////////////////////////////////////////

module lift_design( input [2:0] current_floor, desired_floor, 
input clk_i, rst_i,
output reg [2:0]out_floor,
output reg com
    );
    
    
    
    always@(posedge clk_i) begin 
    ///////////////////////// 2nd condition ///////////////////////////////
    if (rst_i) begin
    out_floor <= current_floor; 
    end
    
    else begin
    if(desired_floor == out_floor) begin
    out_floor <= desired_floor;
    com <= 1'b1;
    end
    
    else begin
    case(desired_floor) 
    //////////////////////////////// 1st case for desired floor ////////////////////////////////
         3'b001: begin
         case(out_floor)
         3'b001: begin out_floor <= 3'b001;
                       com <= 1'b1; end
         3'b010: begin out_floor <= out_floor>>1;
                       com <= 1'b0; end
         3'b100: begin out_floor <= out_floor >>1;
                       com <= 1'b0; end
              default : begin out_floor <= current_floor ;
               com <= 1'b0;end 
              endcase
         end 
    /////////////////////////////// 2nd case for desired floor //////////////////////////////
    3'b010: begin
    case(out_floor) 
    3'b001: begin  out_floor <= out_floor<<1;
                   com <= 1'b0; end
    3'b010: begin out_floor <= 3'b010;
                   com <= 1'b1; end
    3'b100: begin out_floor <= out_floor>>1;
                   com <= 1'b0; end 
             default : begin out_floor <= current_floor ; com <= 1'b0;end 
            endcase
    end
    ////////////////////////////////  3rd case for desire floor ///////////////////////////
            3'b100: begin
            case(out_floor) 
            3'b001: begin out_floor <= out_floor<<1;
                          com <= 1'b0; end
            3'b010: begin out_floor <= out_floor<<1;
                            com <= 1'b0;end 
             3'b100: begin out_floor <= 3'b100;
                             com <= 1'b1; end 
               default : begin out_floor <= current_floor ; com <= 1'b0;end 
              endcase 
              
            end
      default: ;
      endcase
        
    end
    end
    end
endmodule