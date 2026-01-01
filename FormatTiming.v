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
	input FClk,
	output PixelClk,
	output HSn,
	output FSn,
	output BackPorch,
	output active,
	output Load,
	output [3:0] alphaRow,
	output DA0
    );

	wire activeRow;
	wire [9:0] frameTopRow;
	wire [9:0] frameBottomRow;
	wire [9:0] frameAllRows;
	wire slowMode;
	wire pixcolReset;
	reg u_da0;

// horizontal beam counter using gclk for frame timing accuracy
	wire colReset;
	reg [8:0] colCounter;
	always @(negedge FClk) begin
		if (colReset) begin
			colCounter <= 9'd0;
		end else begin
			colCounter <= colCounter + 9'd1;
		end
	end
	
	// count pizel columns using pixel clock
	reg [7:0] pixelCounter;
	always @(negedge Clk) begin
		if (pixcolReset) begin
			pixelCounter <= 8'd0;
		end else begin
			pixelCounter <= pixelCounter + 8'd1;
		end
	end

	// vertical beam counter
	wire lineReset;
	reg [8:0] lineCounter;
	always @(negedge FClk) begin
		if (lineReset) begin
			lineCounter <= 9'd0;
		end else if (colReset) begin
			lineCounter <= lineCounter + 9'd1;
		end
	end
	
	// preload data pixel counter
	reg [1:0] daCount;
	wire daCountEnable;
	always @(negedge Clk) begin
		if (daCountEnable) begin
			daCount <= daCount + 2'd1;
			if (daCount == 2'b01)
				u_da0 = ~u_da0;
		end else begin
			daCount <= 2'd0;
			u_da0 = 1'b0;
		end
	end
	
	reg Clk3;
	always @(negedge Clk) begin
		Clk3 = ~Clk3;
	end

	wire alphaRowReset;
	reg [3:0] alphaRowCounter;
	always @(negedge HSn) begin
		if (alphaRowReset)
			alphaRowCounter <= 0;
		else if (activeRow)
			alphaRowCounter <= alphaRowCounter + 4'd1;
	end
	assign alphaRow = alphaRowCounter;
		
	// horizontal
	parameter leftSync = 24; // now using gclk instead of pclk - 4us duration , 25 glck/16
	parameter allcols = 399; // now using gclk instead of pclk - 64us duration, 400 gclk/16
	parameter leftmargin = 74; // back porch, now using gclk instead of pclk - 12us duration, 75 gclk/16
	parameter rightmargin = 400; // suggested 8 cycles of front porch
	// vertical
	parameter activerows = 192;
	// pal
	parameter allrows = 312;// pal
	parameter topmargin = 64; //pal
	parameter toprow = 64;
	parameter bottomrow = 256; //pal
	// ntsc
	parameter allrows2 = 261;// ntsc
	parameter topmargin2 = 39; //ntsc
	parameter toprow2 = 48;
	parameter bottomrow2 = 240; //ntsc

	// use pixelcounter (pclk) for horizontal viewport alignment. Must align to byte boundary for load
	//parameter activecols = 128;// * 2 = 256
	parameter leftcols = 71; //71;// 71.5 * 2 = 143
	parameter rightcols = 200; //leftcols + activecols + 1;
	parameter leftpreload = 67; //leftcols - 4;
	parameter rightpreload = 196; //rightcols - 4;

	initial begin
	   u_da0 = 1;
		colCounter = 0;
		pixelCounter = 0;
		lineCounter = 0;
		Clk3 = 0;
		alphaRowCounter = 0;
	end

	
	// GCLK driven timing
	// vertical sync active low
	assign FSn = ~(lineCounter[8:3] == 0); // 8 lines of vsync according to spec - 6847 produces nearer 40 lines...use 32 need to fix this for NTSC if I start at 16 instead of 0
	// horizontal sync active low
	assign HSn = (colCounter > leftSync);
	// frame rows counter reset active high
	assign lineReset = lineCounter == frameAllRows;
	// column counter reset active high
	assign colReset = colCounter == allcols;
	// PAL:
	// NTSC: start lineCounter at 16?
	assign activeRow = (lineCounter > frameTopRow) && (lineCounter < frameBottomRow);
	//assign activeRow = (lineCounter[8] == 1'b0) && ~(lineCounter[7:6] == 2'b00);
	// backporch active high
	assign BackPorch = (colCounter < leftmargin) || (colCounter > rightmargin) || ~FSn;
	
	// PCLK driven timing
	assign Load = pixelCounter[1:0] == 0;
	assign active = activeRow && (pixelCounter > leftcols) && (pixelCounter < rightcols);
	assign daCountEnable = (activeRow && (pixelCounter > leftpreload));
	
	// general signals
	assign slowMode = AnG && (GMode == 3'b000);
	assign PixelClk = slowMode ? Clk3 : Clk;
	assign frameTopRow = FrameFormat ? toprow : toprow2; // FrameFormat 1=PAL/0=NTSC
	assign frameBottomRow = FrameFormat ? bottomrow : bottomrow2;
	assign frameAllRows = FrameFormat ? allrows : allrows2;
	assign alphaRowReset = alphaRowCounter == 4'b1100;
	assign DA0 = u_da0;
	assign pixcolReset = colReset || (colCounter == 0);
//	assign pCountEnable = active && HSn;

endmodule