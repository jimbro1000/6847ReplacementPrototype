`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:06:08 06/08/2025 
// Design Name: 
// Module Name:    Semi4Rom 
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
module Semi4Rom(
    input [7:0] Data,
    input [3:0] Row,
    output [7:0] SData,
    output [3:0] SColour
    );

	reg [7:0] semiData[0:3];
	
	initial begin
		semiData[0] = 8'b11111111;
		semiData[1] = 8'b11110000;
		semiData[2] = 8'b00001111;
		semiData[3] = 8'b00000000;
	end
	
	assign SColour = ({1'b0,Data[6:4]}) + 4'b0001;
	assign SData = (Row < 4'b0110) ? semiData[Data[3:2]] : semiData[Data[1:0]];
endmodule