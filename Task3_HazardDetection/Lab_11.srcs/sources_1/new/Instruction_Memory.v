`timescale 1ns/1ps
module Instruction_Memory
(
	input [63:0] Inst_Address,
	output reg [31:0] Instruction
);
	reg [7:0] inst_mem [124:0];
	integer i;
	
	initial
	begin
//0x00600593
inst_mem[0] = 8'b10010011;
inst_mem[1] = 8'b00000101;
inst_mem[2] = 8'b01100000;
inst_mem[3] = 8'b00000000;
 
//0x00600e93
inst_mem[4] = 8'b10010011;
inst_mem[5] = 8'b00001110;
inst_mem[6] = 8'b01100000;
inst_mem[7] = 8'b00000000;
 
//0x00000f13
inst_mem[8] = 8'b00010011;
inst_mem[9] = 8'b00001111;
inst_mem[10] = 8'b00000000;
inst_mem[11] = 8'b00000000;
 
//0x00000f93
inst_mem[12] = 8'b10010011;
inst_mem[13] = 8'b00001111;
inst_mem[14] = 8'b00000000;
inst_mem[15] = 8'b00000000;
 
//0x00600e13
inst_mem[16] = 8'b00010011;
inst_mem[17] = 8'b00001110;
inst_mem[18] = 8'b01100000;
inst_mem[19] = 8'b00000000;
 
//0x10bf2023
inst_mem[20] = 8'b00100011;
inst_mem[21] = 8'b00100000;
inst_mem[22] = 8'b10111111;
inst_mem[23] = 8'b00010000;
 
//0x001f8f93
inst_mem[24] = 8'b10010011;
inst_mem[25] = 8'b10001111;
inst_mem[26] = 8'b00011111;
inst_mem[27] = 8'b00000000;
 
//0x008f0f13
inst_mem[28] = 8'b00010011;
inst_mem[29] = 8'b00001111;
inst_mem[30] = 8'b10001111;
inst_mem[31] = 8'b00000000;
 
//0xfff58593
inst_mem[32] = 8'b10010011;
inst_mem[33] = 8'b10000101;
inst_mem[34] = 8'b11110101;
inst_mem[35] = 8'b11111111;
 
//0x01fe0463
inst_mem[36] = 8'b01100011;
inst_mem[37] = 8'b00000100;
inst_mem[38] = 8'b11111110;
inst_mem[39] = 8'b00000001;
 
//0xfe0006e3
inst_mem[40] = 8'b11100011;
inst_mem[41] = 8'b00000110;
inst_mem[42] = 8'b00000000;
inst_mem[43] = 8'b11111110;
 
//0x00600593
inst_mem[44] = 8'b10010011;
inst_mem[45] = 8'b00000101;
inst_mem[46] = 8'b01100000;
inst_mem[47] = 8'b00000000;
 
//0x00000f13
inst_mem[48] = 8'b00010011;
inst_mem[49] = 8'b00001111;
inst_mem[50] = 8'b00000000;
inst_mem[51] = 8'b00000000;
 
//0x05e58263
inst_mem[52] = 8'b01100011;
inst_mem[53] = 8'b10000010;
inst_mem[54] = 8'b11100101;
inst_mem[55] = 8'b00000101;
 
//0x00000b93
inst_mem[56] = 8'b10010011;
inst_mem[57] = 8'b00001011;
inst_mem[58] = 8'b00000000;
inst_mem[59] = 8'b00000000;

//0x00000f93
inst_mem[60] = 8'b10010011;
inst_mem[61] = 8'b00001111;
inst_mem[62] = 8'b00000000;
inst_mem[63] = 8'b00000000;
 
//0xfffa0a13
inst_mem[64] = 8'b00010011;
inst_mem[65] = 8'b00001010;
inst_mem[66] = 8'b11111010;
inst_mem[67] = 8'b11111111;

//0x41e58a33
inst_mem[68] = 8'b00110011;
inst_mem[69] = 8'b10001010;
inst_mem[70] = 8'b11100101;
inst_mem[71] = 8'b01000001;
 
//0x001f0f13
inst_mem[72] = 8'b00010011;
inst_mem[73] = 8'b00001111;
inst_mem[74] = 8'b00011111;
inst_mem[75] = 8'b00000000;
 
//0xff4f84e3
inst_mem[76] = 8'b11100011;
inst_mem[77] = 8'b10000100;
inst_mem[78] = 8'b01001111;
inst_mem[79] = 8'b11111111;
 
//0x001f8f93
inst_mem[80] = 8'b10010011;
inst_mem[81] = 8'b10001111;
inst_mem[82] = 8'b00011111;
inst_mem[83] = 8'b00000000;
 
//0x008b8c13
inst_mem[84] = 8'b00010011;
inst_mem[85] = 8'b10001100;
inst_mem[86] = 8'b10001011;
inst_mem[87] = 8'b00000000;
 
//0x100ba783
inst_mem[88] = 8'b10000011;
inst_mem[89] = 8'b10100111;
inst_mem[90] = 8'b00001011;
inst_mem[91] = 8'b00010000;
 
//0x100c2803
inst_mem[92] = 8'b00000011;
inst_mem[93] = 8'b00101000;
inst_mem[94] = 8'b00001100;
inst_mem[95] = 8'b00010000;
 
//0x00f84463
inst_mem[96] = 8'b01100011;
inst_mem[97] = 8'b01000100;
inst_mem[98] = 8'b11111000;
inst_mem[99] = 8'b00000000;
 
//0xfe0004e3
inst_mem[100] = 8'b11100011;
inst_mem[101] = 8'b00000100;
inst_mem[102] = 8'b00000000;
inst_mem[103] = 8'b11111110;
 
//0x110ba023
inst_mem[104] = 8'b00100011;
inst_mem[105] = 8'b10100000;
inst_mem[106] = 8'b00001011;
inst_mem[107] = 8'b00010001;
 
//0x10fc2023
inst_mem[108] = 8'b00100011;
inst_mem[109] = 8'b00100000;
inst_mem[110] = 8'b11111100;
inst_mem[111] = 8'b00010000;
 
//0x008b8b93
inst_mem[112] = 8'b10010011;
inst_mem[113] = 8'b10001011;
inst_mem[114] = 8'b10001011;
inst_mem[115] = 8'b00000000;
 
//0xfc000ce3
inst_mem[116] = 8'b11100011;
inst_mem[117] = 8'b00001100;
inst_mem[118] = 8'b00000000;
inst_mem[119] = 8'b11111100;

//06400413
inst_mem[120] = 8'b00010011;
inst_mem[121] = 8'b00000100;
inst_mem[122] = 8'b01000000;
inst_mem[123] = 8'b00000110;
	end
	
	
	always @(Inst_Address)
	begin
		Instruction={inst_mem[Inst_Address+3],inst_mem[Inst_Address+2],inst_mem[Inst_Address+1],inst_mem[Inst_Address]};
	end
endmodule
