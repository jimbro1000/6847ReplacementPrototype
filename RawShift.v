`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:12:50 06/08/2025 
// Design Name: 
// Module Name:    RawShift 
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
module RawShift(
    input [7:0] Data,
    input Clk,
    input Divider,
    input Load,
    output [1:0] Pixel
    );

	reg [7:0] pixelData;
	
	assign Pixel = Divider ? pixelData[7:6] : {1'b0,pixelData[7]};
	
	always @(Clk or Load or Divider or Data or pixelData) begin
		if (Load)
			pixelData <= Data;
		else if (Divider == 0)
			pixelData <= pixelData << 1;
		else
			pixelData <= pixelData << 2;
	end
	
endmodule