`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:13:04 06/08/2025 
// Design Name: 
// Module Name:    Semi6Rom 
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
module Semi6Rom(
    input [7:0] Data,
    input [3:0] Row,
	 input Css,
    output reg [7:0] SData,
    output [3:0] SColour
    );

//	reg [7:0] semiData[0:3];
	reg [1:0] index;
	
//	initial begin
//		semiData[0] = 8'b11111111;
//		semiData[1] = 8'b11110000;
//		semiData[2] = 8'b00001111;
//		semiData[3] = 8'b00000000;
//	end
	
	assign SColour = Css ? ({2'b00,Data[7:6]}) + 5 : ({2'b00,Data[7:6]}) + 1;

	always @(Row, Data) begin
		if (Row == 4'd0)
			index <= Data[5:4];
		if (Row == 4'd4)
			index <= Data[3:2];
		if (Row == 4'd8)
			index <= Data[1:0];
		case (index)
			2'd0: SData <= 8'b11111111;
			2'd1: SData <= 8'b11110000;
			2'd2: SData <= 8'b00001111;
			default: SData <= 8'b00000000;
		endcase

//		case (Row)
//			4'b0000,4'b0001,4'b0010,4'b0011:
//				SData <= semiData[Data[5:4]];
//			4'b0100,4'b0101,4'b0110,4'b0111:
//				SData <= semiData[Data[3:2]];
//			default:
//				SData <= semiData[Data[1:0]];
//		endcase
	end

endmodule