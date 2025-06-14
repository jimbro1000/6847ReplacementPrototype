`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2025 19:17:34
// Design Name: 
// Module Name: semiShift
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module semiShift(
	input logic [7:0] inData,
   input logic [3:0] colour,
   input logic clk,
   input logic load,
   output logic [8:0] rgb
   );
    
   reg [7:0] pixelData;
   logic pixel;
	logic [3:0] pixelColour;
	
	assign pixel = pixelData[7];
    
   always @(load or clk or pixel) begin
		if (load)
			pixelData = inData;
		else
			pixelData = pixelData << 1;
   end
	
	always @(pixel) begin
		if (pixel)
			pixelColour = colour;
		else
			pixelColour = 4'b0000;
	end
    	 
   colourMux mux(
    	.colourIndex (pixelColour),
	   .rgbdata (rgb)
   );
    
endmodule
