`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:47:11 06/09/2025 
// Design Name: 
// Module Name:    counterDbl 
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
module counterDbl
	#(parameter WIDTH = 8)
  ( input clk,
    input reset,
	 input enable,
    output [WIDTH-1:0] count
    );
	 
	reg [WIDTH-1:0] pCount;
	reg [WIDTH-1:0] nCount;
	 
	initial begin
		pCount = 0;
		nCount = 0;
	end

	assign count = pCount + nCount;

	always @(posedge clk, posedge reset) begin
		pCount <= reset ? 0 : enable ? pCount + 1 : pCount;
	end

	always @(negedge clk, posedge reset) begin
		nCount <= reset ? 0 : enable ? nCount + 1 : nCount;
//		if (reset)
//			nCount <= 0;
//		else if (enable)
//			nCount <= nCount + 1;
	end
endmodule