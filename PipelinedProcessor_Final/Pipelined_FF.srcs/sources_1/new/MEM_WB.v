`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2023 03:32:53 PM
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(
    input clk,
    input reset,
    input reg_write,
    input memtoreg,
    input [4:0] rd,
    input [63:0] ALU_result,
    input [63:0] read_data,
    output reg reg_write_out,
    output reg mem_to_reg_out,
    output reg [4:0] rd_out,
    output reg [63:0] ALU_result_out,
    output reg [63:0] read_data_out 
    );
    
    initial

    begin
      rd_out = 0;
      ALU_result_out = 0;
      read_data_out = 0;
      reg_write_out= 0;
      mem_to_reg_out= 0;
    end
    
    always @(posedge clk or reset)
		begin
			if (reset==1'b1)
				begin
                  rd_out = 0;
                  ALU_result_out = 0;
                  read_data_out = 0;
                  reg_write_out= 0;
                  mem_to_reg_out= 0;            	
                end
			else if (clk)
				begin
				  rd_out = rd;
                  ALU_result_out = ALU_result;
                  read_data_out = read_data;
                  reg_write_out= reg_write;
                  mem_to_reg_out= memtoreg;            	
				end
		end
    
endmodule
