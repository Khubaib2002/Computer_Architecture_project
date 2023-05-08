`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2023 12:27:40 PM
// Design Name: 
// Module Name: FinalProcessorTB
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


module FinalProcessorTB(

    );
    reg clk,reset;
    wire [63:0] PcOut_InstAddr;
    wire [31:0] Instr;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [4:0] rd;
    wire [63:0] ReadData1;
    wire [63:0] ReadData2;
    wire [63:0] WriteData;
    wire [63:0] ImmData;
    wire [63:0] AluResult;
    wire [63:0] ReadMemData;
    wire Branch,MemRead,MemReg,MemWrite,AluSrc,RegWrite;
    wire [1:0] ALUOp;
    wire [3:0] Operation;
    wire [6:0] OpCode;
    wire [7:0] element1;
    wire [7:0] element2;
    wire [7:0] element3;
    wire [7:0] element4;
    wire [7:0] element5;
    wire [7:0] element6;
    wire branch_dec;
    wire [4:0] rd_memwb_out;
    wire [63:0] Result_memwb_out;
    wire MemtoReg_memwb_out;
    wire RegWrite_memwb_out;
    wire [63:0] alu1;
    wire [63:0] alu2;
    wire [1:0] fwdb;
    wire Branch_exmem_out;
    wire Zero_exmem_out;
    wire [1:0] fwda;
    
    FinalProcessor PP(clk,reset, PcOut_InstAddr,
    Instr,
    rs1,
    rs2,
    rd,
    ReadData1,
     ReadData2,
    WriteData,
    ImmData,
    AluResult,
    ReadMemData,
//    ReadDataOne,
    Branch,MemRead,MemReg,MemWrite,AluSrc,RegWrite,
    ALUOp,
    Operation,OpCode, element1, element2, element3, element4, element5, element6, branch_dec, rd_memwb_out, Result_memwb_out, MemtoReg_memwb_out,
    RegWrite_memwb_out, alu1, alu2, fwdb, Branch_exmem_out, Zero_exmem_out, fwda);
    
    initial begin
    reset=0;
    clk=0;
    end
    always 
    #1 clk =~clk;
    
    
endmodule
