`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2023 03:26:49 PM
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter
(
	input clk,reset,
	input [63:0] PC_In,
	//input pc_write,
	output reg [63:0] PC_Out
);

//	initial 
//	PC_Out=64'd0;

	always @ (posedge clk or posedge reset)
	begin
		if (reset)
			PC_Out=64'd0;
		else if (reset==0)
			PC_Out=PC_In;
	    else   
	       PC_Out=PC_In;
	       
	end

endmodule
