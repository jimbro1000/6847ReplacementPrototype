`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:34:31 06/08/2025 
// Design Name: 
// Module Name:    FormatTiming 
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
module FormatTiming(
	input [2:0] GMode,
	input FrameFormat,
	input AnG,
	input Clk,
	output PixelClk,
	output HSn,
	output FSn,
	output Load,
	output [3:0] alphaRow,
	output DA0
    );

	wire active;
	wire activeRow;
	wire [9:0] frameTopRow;
	wire [9:0] frameBottomRow;
	wire [9:0] frameAllRows;
	wire slowMode;
	reg u_da0;

	wire lineReset;
	wire [8:0] lineCounter;
	counter #(.WIDTH(9)) lines(
		.clk(HSn),
		.reset(lineReset),
		.enable(1'b1),
		.count(lineCounter)
	);
	
	wire colReset;
	wire [8:0] colCounter;
	counterDbl #(.WIDTH(9)) cols(
		.clk(Clk),
		.reset(colReset),
		.enable(1'b1),
		.count(colCounter)
	);

	wire [2:0] pixelCount;
	wire pCountEnable;
	counterDbl #(.WIDTH(3)) pCount(
		.clk(Clk),
		.reset(!pCountEnable),
		.enable(pCountEnable),
		.count(pixelCount)
	);
	
	wire [2:0] daCount;
	wire daCountEnable;
	counterDbl #(.WIDTH(3)) dCount (
		.clk(Clk),
		.reset(!daCountEnable),
		.enable(daCountEnable),
		.count(daCount)
	);
	
	wire Clk3;
	counter #(.WIDTH(1)) clkDiv2 (
		.clk(Clk),
		.reset(1'b0),
		.enable(1'b1),
		.count(Clk3)
	);

	wire alphaRowReset;
	counter #(.WIDTH(4)) rc (
		.clk(HSn),
		.reset(alphaRowReset),
		.enable(activeRow),
		.count(alphaRow)
	);

	parameter topSync = 7;
	parameter leftSync = 28;
	parameter activecols = 256;
	parameter activerows = 192;
	parameter allcols = 458;
	parameter allrows = 311;
	parameter leftmargin = 101;
	parameter topmargin = 56;
	parameter topmargin2 = 31;
	parameter allrows2 = 261;
	parameter toprow = 63;
	parameter toprow2 = 40;
	parameter bottomrow = 255;
	parameter bottomrow2 = 232;
	parameter leftcols = 129;
	parameter rightcols = 385;
	parameter leftpreload = 120;
	parameter rightpreload = 376;

	initial begin
	   u_da0 = 1;
	end
				
	assign FSn = (lineCounter > topSync);
	assign HSn = (colCounter > leftSync);
	assign DA0 = u_da0;
	assign lineReset = lineCounter == frameAllRows;
	assign colReset = colCounter == allcols;
	assign pCountEnable = active && HSn;
	assign Load = pixelCount == 0;
	assign active = (colCounter > leftcols) && (colCounter < rightcols) && activeRow;
	assign activeRow = (lineCounter > frameTopRow) && (lineCounter < frameBottomRow);
	assign daCountEnable = (activeRow && colCounter > leftpreload && colCounter < rightpreload);
	assign slowMode = AnG && (GMode == 3'b000);
	assign PixelClk = slowMode ? Clk3 : Clk;
	assign frameTopRow = FrameFormat ? toprow2 : toprow;
	assign frameBottomRow = FrameFormat ? bottomrow2 : bottomrow;
	assign frameAllRows = FrameFormat ? allrows2 : allrows;
	assign alphaRowReset = alphaRow == 4'b1100;

	always @(daCount) begin
		if (daCount == 3'b001)
			u_da0 = ~u_da0;
	end
	
endmodule