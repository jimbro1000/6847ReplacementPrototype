module colourMux(
	input logic [3:0] colourIndex,
	output logic [8:0] rgbdata
);

	reg [8:0] rgb;
	
	always @(colourIndex) begin
		case(colourIndex)
			4'b0001:
				rgb = 9'b001111000;
			4'b0010:
				rgb = 9'b111111000;
			4'b0011:
				rgb = 9'b010001111;
			4'b0100:
				rgb = 9'b110000010;
			4'b0101: 
				rgb = 9'b111111111;
			4'b0110:
				rgb = 9'b001111100;
			4'b0111:
				rgb = 9'b111001111;
			4'b1000:
				rgb = 9'b111100000;
			4'b1001:
				rgb = 9'b111110010;
			4'b1010:
				rgb = 9'b000011000;
			4'b1011:
				rgb = 9'b011000000;
			default:
				rgb = 9'b000000000;
		endcase
	end
	
	assign rgbdata = rgb;
endmodule