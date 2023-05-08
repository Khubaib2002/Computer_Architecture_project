`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2023 10:30:58 AM
// Design Name: 
// Module Name: parser
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


module InsParser(
  
input  [0:31]I,                     // 32 bits input
output [0:6]opcode,           // 7 bits output
output [0:4]rd,                  // 5 bits output
output [0:2]funct3,          // 3 bits output
output [0:4]rs1,              // 5 bits output
output [0:4]rs2,             // 5 bits output
output [0:6]funct7        // 7 bits output
    );
    
assign funct7 = I[0:6];                       //assigning value
assign rs2 = I[7:11];                         //assigning value
assign rs1 = I[12:16];                     //assigning value
assign funct3 = I[17:19];               //assigning value
assign rd = I[20:24];                    //assigning value
assign opcode = I[25:31];          //assigning value
endmodule
