module colourMap(
	input logic [3:0] mode,
	input logic screen,
	input logic [1:0] colour,
	output logic [8:0] rgb
);

	reg [3:0] index;
	reg [3:0] index2;
	reg [3:0] index3;
	reg [3:0] index4;

	colourMux mux(
		.colourIndex (index),
		.rgbdata (rgb)
	);
	
	colourMap2 map2(
		.screen (screen),
		.colour (colour[0]),
		.index (index2)
	);
	
	colourMap2alpha map3(
		.screen (screen),
		.colour (colour[0]),
		.index (index3)
	);
	
	colourMap4 map4(
		.screen (screen),
		.colour (colour[1:0]),
		.index (index4)
	);
	
	always @(mode) begin
		case(mode)
			4'b0010:
				index = index2;
			4'b0100:
				index = index2;
			4'b0001 : 
				index = index4;
			4'b0011 : 
				index = index4;
			4'b1000 :
				index = index3;
			default:
				index = index2;
		endcase
	end
	
endmodule