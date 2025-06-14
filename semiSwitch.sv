module semiSwitch(
	input logic [7:0] inData,
	input logic [3:0] row,
	input logic clk,
	input logic divider,
	input logic load,
	output logic [8:0] rgb
);

	logic [7:0] out4;
	logic [3:0] colour4;

	semi4Rom rom4(
		.row (row),
		.inData (inData),
		.outData (out4),
		.colour (colour4)
	);

	semiShift shift(
	   .inData (out4),
      .colour (colour4),
      .clk (clk),
      .load (load),
      .rgb (rgb)
	);
	
endmodule