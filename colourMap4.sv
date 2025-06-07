module colourMap4(
	input logic screen,
	input logic [1:0] colour,
	output logic [3:0] index
);

	always @(screen,colour) begin
		if (screen) begin
			case(colour)
				2'b00:
					index = 4'b0101;
				2'b01:
					index = 4'b0110;
				2'b10:
					index = 4'b0111;
				2'b11:
					index = 4'b1000;
			endcase
		end else begin
			case(colour)
				2'b00:
					index = 4'b0001;
				2'b01:
					index = 4'b0010;
				2'b10:
					index = 4'b0011;
				2'b11:
					index = 4'b0100;
			endcase
		end
	end
	
endmodule