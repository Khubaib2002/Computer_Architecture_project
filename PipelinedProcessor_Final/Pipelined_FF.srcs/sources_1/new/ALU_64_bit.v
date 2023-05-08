`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2023 03:32:19 PM
// Design Name: 
// Module Name: ALU_64_bit
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


module ALU_64_bit
(
	input [63:0]a, b,
	input [3:0] ALUOp,
	
	output reg [63:0] Result,
	output ZERO
);

localparam [3:0]
AND = 4'b0000,
OR	= 4'b0001,
ADD	= 4'b0010,
Sub	= 4'b0110,
NOR = 4'b1100,
Less = 4'b0100;

assign ZERO = (Result == 0);

always @ (ALUOp, a, b)
begin
	case (ALUOp)
		AND: Result = a & b;
		OR:	 Result = a | b;
		ADD: Result = a + b;
		Sub: Result = a - b;
		NOR: Result = ~(a | b);
		Less: Result = (a < b) ? 0 : 1;   //less than operation
		
		default: Result = 0;
	endcase
end

endmodule
