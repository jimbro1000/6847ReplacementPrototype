`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:23:29 06/08/2025 
// Design Name: 
// Module Name:    SemiSwitch 
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
module SemiSwitch(
    input InE,
    input [7:0] S4Data,
    input [3:0] S4Colour,
    input [7:0] S6Data,
    input [3:0] S6Colour,
    output reg [7:0] SData,
    output reg [3:0] SColour
    );

	always @(*) begin
		if (InE) begin
			SData <= S6Data;
			SColour <= S6Colour;
		end else begin
			SData <= S4Data;
			SColour <= S4Colour;
		end
	end

endmodule