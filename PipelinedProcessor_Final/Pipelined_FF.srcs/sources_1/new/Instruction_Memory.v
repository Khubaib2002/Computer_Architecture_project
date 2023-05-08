`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2023 03:28:02 PM
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory
(
	input [63:0] Inst_Address,
	output reg [31:0] Instruction
);
	reg [7:0] inst_mem [63:0];
	integer i;
	
	initial
	begin
	    
	    inst_mem[0]=8'b0;
		inst_mem[1]=8'b0;
		inst_mem[2]=8'b0;
		inst_mem[3]=8'b0;

        //sub x1, x3, x2
		inst_mem[4]=8'b10110011;
		inst_mem[5]=8'b10000000;
		inst_mem[6]=8'b00100001;
		inst_mem[7]=8'b01000000;
		
		//add x4, x1, x2
		inst_mem[8]=8'b00110011;
		inst_mem[9]=8'b10000010;
		inst_mem[10]=8'b00100000;
		inst_mem[11]=8'b0;
		
        //add x5, x4, x1
		inst_mem[12]=8'b10110011;
		inst_mem[13]=8'b00000010;
		inst_mem[14]=8'b0010010;
		inst_mem[15]=8'b0;
		
	   for (i = 16; i < 63; i = i + 1)
      begin 
        inst_mem[i] = 8'd0;
       end
	end
	
	always @(Inst_Address)
	begin
		Instruction={inst_mem[Inst_Address+3],inst_mem[Inst_Address+2],inst_mem[Inst_Address+1],inst_mem[Inst_Address]};
	end
endmodule
