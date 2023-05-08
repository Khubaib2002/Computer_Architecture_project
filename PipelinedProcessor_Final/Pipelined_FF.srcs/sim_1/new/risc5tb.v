`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2023 03:41:00 PM
// Design Name: 
// Module Name: risc5tb
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

module risc5tb();
    reg clk;
    reg reset;
    wire [63:0] PC_In;
    wire [63:0] PC_Out;
    wire [31:0] instruction;
    wire [4:0] rs1; 
    wire [4:0] rs2; 
    wire [4:0] rd;
    wire [63:0] WriteData;
    wire [63:0] readData1;
    wire [63:0] readData2;
    wire [63:0] imm_data;
    wire [63:0] Result;
    wire ZERO;
    wire [63:0] Read_Data;
    wire [6:0] opcode;
    wire [2:0] funct3;
    wire [6:0] funct7;
    wire [63:0] element1;
    wire [63:0] element2;
    wire [63:0] element3;
    wire [63:0] element4;
    wire [63:0] element5;
    wire [63:0] element6;
    wire [1:0] forwardA;
    wire [1:0] forwardB;
    wire Regwrite_EX;
    wire Regwrite_ID;
    wire Regwrite_MEM; 
    wire [4:0] rd_EX; 
    wire [4:0] rs1_ID;
    wire Branch;
    wire MemRead;
    wire MemtoReg;
    wire MemWrite;
    wire ALUSrc;
    wire Regwrite;
    
    //Instantiating RISC V processor 
    risc5processor processor (clk, reset, PC_In, PC_Out, instruction, rs1, rs2, rd, WriteData, readData1, readData2, imm_data, Result, ZERO, Read_Data, opcode, funct3, funct7, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, Regwrite, forwardA, forwardB, Regwrite_EX, Regwrite_ID, Regwrite_MEM, rd_EX, rs1_ID, element1, element2, element3, element4, element5, element6);
    
        initial
            begin
           clk = 1'b0;
           reset = 1'b1;
              #10
           reset = 1'b0;
            end
          
          always
            begin
              #5
              clk = ~clk;
            end 
       
endmodule
