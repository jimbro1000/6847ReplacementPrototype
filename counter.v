`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:33:29 06/09/2025 
// Design Name: 
// Module Name:    counter 
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
module counter
	#(parameter WIDTH = 8)
  ( input clk,
    input reset,
	 input enable,
    output reg [WIDTH-1:0] count
    );
	 
	initial begin
		count = 0;
	end
	
	always @(negedge clk) begin
		if (reset)
			count <= 0;
		else if (enable)
			count <= count + 1;
	end
endmodule