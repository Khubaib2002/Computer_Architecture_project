`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2023 03:28:24 PM
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(
    input clk,
    input reset,
	input [31:0] instruction,
	input [63:0] PC_Out,
	output reg [31:0] IF_ID_instruction,
	output reg [63:0] IF_ID_PCOut
    );
//    initial
//      begin
//        IF_ID_instruction = 0;
//        IF_ID_PCOut = 0;
//      end
	always @(posedge clk or reset)
        begin
			if (reset == 1'b1)
				begin
					IF_ID_instruction = 0;
					IF_ID_PCOut = 0;
				end
          else if (clk==1)
				begin
					IF_ID_instruction = instruction;
					IF_ID_PCOut = PC_Out;
				end
		end

endmodule
