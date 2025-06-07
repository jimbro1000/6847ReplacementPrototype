module semiSwitch(
	input logic [7:0] inData,
//	input logic InE,
	input logic [3:0] row,
//	input logic css,
	input logic clk,
	input logic divider,
	input logic load,
	output logic [8:0] rgb
);

	logic [7:0] out4;
	logic [3:0] colour4;
//	logic [7:0] out6;
//	logic [3:0] colour6;
	
//	reg [7:0] outData;
//	reg [3:0] colour;

	semi4Rom rom4(
		.row (row),
		.inData (inData),
		.outData (out4),
		.colour (colour4)
	);

//	semi6Rom rom6(
//		.css (css),
//		.row (row),
//		.inData (inData),
//		.outData (out6),
//		.colour (colour6)
//	);
	
//	always @(InE, row, css, inData) begin
//		if (InE) begin
//			outData = 7'b000000;
//			colour = 4'b0000;
//		end else begin
//			outData = out4;
//			colour = colour4;
//		end
//	end
	
	semiShift shift(
	   .inData (out4),
      .colour (colour4),
      .clk (clk),
      .load (load),
      .rgb (rgb)
	);
	
endmodule