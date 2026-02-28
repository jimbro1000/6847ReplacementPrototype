`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:49:48 06/08/2025 
// Design Name: 
// Module Name:    AlphaIntRom 
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
module AlphaIntRom(
	input Clk,
   input [5:0] Data,
   input [3:0] Row,
   output [7:0] AData
);

wire [4:0] result;

FontDef font (
	.Clk(Clk),
	.data(Data),
	.row(Row),
	.bitmap(result)
);

assign AData = {2'b00, result, 1'b0};

endmodule
