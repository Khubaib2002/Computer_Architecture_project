`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 12:00:45 PM
// Design Name: 
// Module Name: tbPuraProcessor
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


module tbSingleCycle(

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
    wire [7:0] Arr1;
    wire [7:0] Arr2;
    wire [7:0] Arr3;
    wire [7:0] Arr4;
    wire [7:0] Arr5;
    wire [7:0] Arr6;
    
    SingleCycle SC(clk,reset, PcOut_InstAddr,
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
    Branch,MemRead,MemReg,MemWrite,AluSrc,RegWrite,
    ALUOp,
    Operation,OpCode, Arr1, Arr2, Arr3, Arr4, Arr5, Arr6);
    
    initial begin
    reset=0;
    clk=0;
    end
    always 
    #5 clk =~clk;
    
endmodule
