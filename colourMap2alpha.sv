module colourMap2alpha(
	input logic screen,
	input logic colour,
	output logic [3:0] index
);

	always @(screen,colour) begin
		if (screen) begin
			if (colour)
				index = 4'b1001;
			else
				index = 4'b1011;
		end else begin
			if (colour)
				index = 4'b0001;
			else
				index = 4'b1010;
		end
	end
	
endmodule