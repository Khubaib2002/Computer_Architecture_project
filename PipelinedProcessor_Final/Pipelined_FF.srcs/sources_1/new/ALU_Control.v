`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2023 03:30:43 PM
// Design Name: 
// Module Name: ALU_Control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_Control
(
	input [1:0] ALUOp, 
	input [3:0] Funct,
	output reg [3:0] Operation
);

	always @(*)
    begin
      case(ALUOp)
    2'b00:
      begin
      Operation = 4'b0010;
      end
     2'b01:                          // branch type instructions
          begin
            case(Funct[2:0])
    	    3'b000:                  // beq
     	      begin
               Operation = 4'b0110;  // subtract
              end
            3'b100:                  // blt
     	      begin
                Operation = 4'b0100; // less than operation 
              end
         	endcase
          end
            
        
     2'b10:
       begin
         case(Funct)
    	    4'b0000: 
     	      begin
              Operation = 4'b0010;
              end
             4'b1000:
     	      begin
              Operation = 4'b0110;
              end
             4'b0111:
     	      begin
              Operation = 4'b0000;
              end
               4'b0110:
     	      begin
              Operation = 4'b0001;
              end
         endcase
      end
      endcase
    end
	
endmodule
