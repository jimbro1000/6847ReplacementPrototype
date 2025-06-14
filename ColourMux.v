`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:00:45 06/08/2025 
// Design Name: 
// Module Name:    ColourMux 
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
module ColourMux(
    input [3:0] Colour1,
    input Sel1,
    input [3:0] Colour2,
    input Sel2,
    input [3:0] Colour3,
    output reg [8:0] RGB
    );

	wire [3:0] Colour;
	
	assign Colour = Sel1 ? Colour1 : Sel2 ? Colour2 : Colour3;
	
	always @(Colour) begin
		case (Colour)
			4'b0001:
				RGB = 9'b001111000;
			4'b0010:
				RGB = 9'b111111000;
			4'b0011:
				RGB = 9'b010001111;
			4'b0100:
				RGB = 9'b110000010;
			4'b0101: 
				RGB = 9'b111111111;
			4'b0110:
				RGB = 9'b001111100;
			4'b0111:
				RGB = 9'b111001111;
			4'b1000:
				RGB = 9'b111100000;
			4'b1001:
				RGB = 9'b111110010;
			4'b1010:
				RGB = 9'b000010000;
			4'b1011:
				RGB = 9'b010000000;
			default:
				RGB = 9'b000000000;
		endcase
	end
endmodule