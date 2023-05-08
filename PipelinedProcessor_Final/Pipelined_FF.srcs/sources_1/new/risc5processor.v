`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2023 03:29:00 PM
// Design Name: 
// Module Name: risc5processor
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


module risc5processor(
    input clk,
    input reset,
    output wire [63:0] PC_In,
    output wire [63:0] PC_Out, // Instruction address
    output wire [31:0] instruction,
    output wire [4:0] rs1, 
    output wire [4:0] rs2, 
    output wire [4:0] rd,
    output wire [63:0] WriteData,
    output wire [63:0] readData1,
    output wire [63:0] readData2,
    output wire [63:0] imm_data,
    output wire [63:0] Result,
    output wire ZERO,
    output wire [63:0] Read_Data,
    output wire [6:0] opcode,
    output wire [2:0] funct3,
    output wire [6:0] funct7,
    output wire Branch,
    output wire MemRead,
    output wire MemtoReg,
    output wire MemWrite,
    output wire ALUSrc,
    output wire Regwrite,
    output wire [1:0] forwardA, 
    output wire [1:0] forwardB,
    output wire Regwrite_EX,
    output wire Regwrite_ID,
    output wire Regwrite_MEM, 
    output wire [4:0] rd_EX,
    output wire [4:0] rs1_ID,
    output wire [63:0] ele1,
    output wire [63:0] ele2,
    output wire [63:0] ele3,
    output wire [63:0] ele4,
    output wire [63:0] ele5,
    output wire [63:0] ele6
    );
 
    wire [63:0] out1;
    wire [63:0] out2;
    wire [63:0] out2_EX;
    wire [1:0] ALUOp;
    wire [3:0] Operation;
    wire [63:0] data_out1;
    wire [63:0] data_out2;
    wire [63:0] data_out;
    wire [63:0] PC_IF;
    wire [63:0] PC_EX;
    wire [63:0] PC_ID;
    wire [63:0] instruction_IF;
    wire [4:0] rd_MEM;
    wire [4:0] rd_ID;
    wire [4:0] rs2_ID;
    wire [1:0] ALUOp_ID;
    wire [63:0] readdata1_ID;
    wire [63:0] readdata2_ID;
    wire [63:0] imm_ID;
    wire [3:0] func_ID;
    wire ZERO_EX;
    wire [63:0] Result_EX;
    wire [63:0] Result_MEM;
    wire [63:0] data_out_MEM;
    wire Branch_ID;
    wire Branch_EX;
    wire ZERO_EX;
    wire MemRead_ID;
    wire MemRead_EX;
    wire MemtoReg_ID;
    wire MemtoReg_EX;
    wire MemtoReg_Mem;
    wire MemWrite_ID;
    wire MemWrite_EX;
    wire ALUSrc_ID;
    wire [63:0] WriteData_EX;
    wire [63:0] branch_MUX_out;
    
    //The code below is for program counter to go to next address
    Program_Counter pc (clk,reset, PC_In, PC_Out);
    
    
    //Add +4 to previous instruction for next instruction
    Adder add1 (PC_Out, 64'd4, out1);
    
    //Code below is for instruction memory instantiation
    Instruction_Memory insmem (PC_Out, instruction);
    
    IF_ID ifreg (clk, reset, instruction, PC_Out, instruction_IF, PC_IF);
    
    //Code below is for instruction parser instantiation
    InsParser inspar (instruction_IF, opcode, rd, funct3, rs1, rs2, funct7);
    
    //Code below is for control unit instantiation
    Control_Unit conunit (opcode, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, Regwrite, ALUOp);
    
    //Code below is for register file instantiation
    registerFile regf (WriteData, rs1, rs2, rd_MEM, Regwrite_MEM, clk, reset, readData1, readData2); 
    
    //Code below is for immediate generator instantiation
    ImmGen immgen (instruction_IF, imm_data);
    
    ID_EX idexreg (clk, reset, branch, MemRead, MemtoReg, MemWrite, ALUSrc, Regwrite, ALU_OP, readData1, readData2, imm_data, PC_IF, rs1, rs2, rd, {instruction[30], instruction[14:12]}, Branch_ID, MemRead_ID, MemtoReg_ID, MemWrite_ID, ALUsrc_ID, Regwrite_ID, AlU_Op_ID, readdata1_ID, readdata2_ID, imm_ID, PC_ID, rs1_ID, rs2_ID, rd_ID, func_ID);
    
    //Code below is for alu control instantiation
    ALU_Control ALUcont (ALU_Op_ID, {instruction[30], instruction[14:12]}, Operation);    //ins waali line dekho ismein
    
    Adder add2 (PC_ID, (imm_ID << 1), out2);
    
    Four_MUX fourmux1 (readdata1_ID, WriteData, Result_EX, 64'd0, forwardA, data_out1); 
    
    Four_MUX fourmux2 (readdata2_ID, WriteData, Result_EX, 64'd0, forwardB, data_out2);
    
    //Code below is for ALU mux instantiation to choose imm data/readdata2
    Mux ALUs (data_out2, imm_ID, ALUSrc_ID, data_out); 
    
        
    //Code below is for ALU instantiation    
    ALU_64_bit ALU (data_out1, data_out, Operation, Result, ZERO);
    
    EX_MEM exmemreg (clk, reset, rd_ID, data_out2, Result, out2, ZERO, Branch_ID, MemRead_ID, MemWrite_ID, Regwrite_ID, MemtoReg_ID, rd_EX, WriteData_EX, Result_EX, ZERO_EX, Branch_EX, MemRead_EX, MemWrite_EX, Regwrite_EX, MemtoReg_EX, PC_EX, branch_MUX_out);
    
    //Code below is for data memory instantiation
    Data_Memory datamem (Result_EX, WriteData_EX, clk, MemWrite_EX, MemRead_EX, Read_Data, ele1, ele2, ele3, ele4, ele5, ele6);
    
    MEM_WB memwbreg (clk, reset, Regwrite_EX, MemtoReg_ID, rd_EX, Result_EX, Read_Data, Regwrite_MEM, MemtoReg_Mem, rd_MEM, Result_MEM, Read_Data);
    
    Forwarding_Unit F1 (rs1_ID, rs2_ID, rd_EX, Regwrite_EX, rd_MEM, Regwrite_MEM, forwardA, forwardB); 
    
    //Code below is for data memory mux instantiation to select between alu result or read data for R-type/S-type/I-type ins   
    Mux memreg (Result_MEM, Read_Data, MemtoReg_MEM, WriteData); 
    
    //Code below is for branch adder instantiation to add branch and prev instruction address.
    //Adder add2 (PC_Out,(imm_data << 1),out2);
    
    //code below is for program counter mux instantiation to select between adder +4 instruction or branch ins
    Mux PCs (out1, PC_EX, (Branch_EX & ZERO_EX) , PC_In); 
    
endmodule
