module dataSwitch(
	input [7:0] inData,
	input [3:0] mode,
	input css,
	input AnG,
	input AnS,
	input Inv,
	input InE,
	input [3:0] row,
	input clk,
	input load,
	output logic [8:0] rgb
);

	logic [8:0] alphargb;
	logic [8:0] semirgb;
	logic [8:0] rawrgb;
	reg divider;
	
	rawSwitch raw (
		.inData (inData),
		.mode (mode),
		.screen (css),
	   .clk (clk),
	   .divider (divider),
	   .load (load),
	   .rgb (rawrgb)
	);

	alphaSwitch alpha (
		.inData (inData[5:0]),
		.row (row),
		.inv (Inv),
		.screen (css),
	   .clk (clk),
	   .divider (divider),
	   .load (load),
	   .rgb (alphargb)
	);
	
	semiSwitch semi(
		.inData (inData),
		.row (row),
	   .clk (clk),
	   .divider (divider),
	   .load (load),
	   .rgb (semirgb)
	);

	always @(AnG, AnS, clk) begin
		if (AnG) begin
			rgb = rawrgb;
			divider = mode[0];
		end else if (AnS) begin
			rgb = semirgb;
			divider = 0;
		end else begin
			rgb = alphargb;
			divider = 0;
		end
	end
endmodule