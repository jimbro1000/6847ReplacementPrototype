module alphaSwitch(
	input [4:0] inData,
	input [3:0] row,
	input inv,
	input screen,
	input logic clk,
	input logic [1:0] divider,
	input logic load,
	output [8:0] rgb
);

	reg [7:0] rowData;
	reg [7:0] romData;
	reg [2:0] inRow;
	
	alphaRom rom(
		.row (inRow),
		.charIndex (inData),
		.rowData (romData)
	);

	always @(inData, row, inv) begin
		if (row < 3 || row > 9)
			if (inv)
				rowData = 8'b11111111;
			else
				rowData = 8'b00000000;
		else
			inRow = row - 3;
			if (inv)
				rowData = romData ^ 8'b11111111;
			else
				rowData = romData;
	end

    rawShift shift(
	    .inData (rowData),
	    .mode (4'b1000),
       .css (screen),
       .clk (clk),
       .divider (divider),
       .load (load),
       .rgb (rgb)
    );
	
endmodule