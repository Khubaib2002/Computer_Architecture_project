`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2023 03:32:08 PM
// Design Name: 
// Module Name: Mux
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


module Mux
(
	input [63:0] a,
	input [63:0] b,
	input  sel,
	
	output reg [63:0]data_out
);

//assign data_out = sel? b:a ;

always @ (a, b, sel)
begin
	if (!sel)
		data_out = a;
	else
		data_out = b;
end

endmodule
