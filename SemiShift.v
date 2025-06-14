`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:23:51 06/08/2025 
// Design Name: 
// Module Name:    SemiShift 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SemiShift(
    input [7:0] Data,
    input Clk,
    input Load,
    input [3:0] SColour,
    output [3:0] Colour
    );
	 
	 reg [7:0] pixelData;
	 
	 assign Colour = pixelData[7] ? SColour : 4'b0000;

	always @(Clk or Load or Data or pixelData) begin
		if (Load)
			pixelData <= Data;
		else begin
			pixelData <= pixelData << 1;
		end
	end
endmodule