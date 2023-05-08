`timescale 1ns/1ps
module Data_Memory
(
	input [63:0] Mem_Addr,
	input [63:0] Write_Data,
	input clk, MemWrite, MemRead,
	output reg [63:0] Read_Data,
	output reg [7:0] element1,
	output reg [7:0] element2,
	output reg [7:0] element3,
	output reg [7:0] element4,
	output reg [7:0] element5,
	output reg [7:0] element6
);
	reg [7:0] DataMemory [304:0];
    integer i;
	initial
    begin 
      for (i = 0; i < 300; i = i + 1)
      begin 
        DataMemory[i] = 0;
      end
      DataMemory[256]  = 8'd33;
      DataMemory[264]  = 8'd14;
      DataMemory[272] = 8'd20;
      DataMemory[280] = 8'd15;
      DataMemory[288] = 8'd36;
    end 
	
	always @ (*)
	begin
		if (MemRead)
		begin
			assign Read_Data = {DataMemory[Mem_Addr+7],DataMemory[Mem_Addr+6],DataMemory[Mem_Addr+5],DataMemory[Mem_Addr+4],DataMemory[Mem_Addr+3],DataMemory[Mem_Addr+2],DataMemory[Mem_Addr+1],DataMemory[Mem_Addr]};
	   end
	   
	   assign element1 = DataMemory[256];
	   assign element2 = DataMemory[264];
	   assign element3 = DataMemory[272];
	   assign element4 = DataMemory[280];
	   assign element5 = DataMemory[288];
	   assign element6 = DataMemory[296];
	   
	end
	
	always @ (posedge clk)
	begin
		if (MemWrite)
		begin
			DataMemory[Mem_Addr] = Write_Data[7:0];
			DataMemory[Mem_Addr+1] = Write_Data[15:8];
			DataMemory[Mem_Addr+2] = Write_Data[23:16];
			DataMemory[Mem_Addr+3] = Write_Data[31:24];
			DataMemory[Mem_Addr+4] = Write_Data[39:32];
			DataMemory[Mem_Addr+5] = Write_Data[47:40];
			DataMemory[Mem_Addr+6] = Write_Data[55:48];
			DataMemory[Mem_Addr+7] = Write_Data[63:56];
		end
	end
endmodule
