module ProtoVDG(
	input logic [2:0] GMode,
	input logic Css,
	input logic AnS,
	input logic AnG,
	input logic Inv,
	input logic InE,
	input logic Clk,
	input logic [7:0] DataIn,
	input logic Format,
	input logic PALClk,
	output wire OutFormat,
	output wire DA0,
	output wire [2:0] R,
	output wire [2:0] G,
	output wire [2:0] B,
	output wire HSn,
	output wire FSn,
	output wire Clk2
);

	const shortint topSync = 7;
	const shortint leftSync = 28;
	const shortint activecols = 256;
   const shortint activerows = 192;
   const shortint allcols = 458; //458.18176
   const shortint allrows = 311;
	const shortint leftmargin = 101;
	const shortint topmargin = 56;
	const shortint topmargin2 = 31;
	const shortint allrows2 = 261;
   
	const shortint toprow = 63;
	const shortint toprow2 = 40;
	const shortint bottomrow = 255;
	const shortint bottomrow2 = 232;
   const shortint leftcols = 129;
	const shortint rightcols = 385;
   const shortint leftpreload = 120;
   const shortint rightpreload = 376;

   reg FrameFormat;
	reg [8:0] lineCounter;
	reg [8:0] colCounter;
	reg outState = 0;
	reg active;
	reg activeRow;
	reg da0;
	reg [2:0] daCount;
	reg [9:0] frameTopRow;
	reg [9:0] frameBottomRow;
	reg [9:0] frameAllRows;
	reg Clk3;
//	logic pixelClk;
	logic slowMode;
	reg [8:0] pixelRGB;
	reg [3:0] mode;
	reg [3:0] alphaRow;
	reg [2:0] pixelCount;
	reg [2:0] r;
	reg [2:0] g;
	reg [2:0] b;
	reg load;
	
	initial begin
	   lineCounter = 0;
	   colCounter = 0;
	   FrameFormat = 1;
      frameTopRow = toprow2;
      frameBottomRow = bottomrow2;
	   frameAllRows = allrows2;
	   da0 = 0;
		alphaRow = 0;
	end
	
	assign activeRow = (lineCounter > frameTopRow) && (lineCounter < frameBottomRow);
	assign active = (colCounter > leftcols) && (colCounter < rightcols) && activeRow;
	assign FSn = (lineCounter > topSync);
	assign HSn = (colCounter > leftSync);
	assign Clk2 = (FrameFormat && Clk) || (!FrameFormat && PALClk);
	assign DA0 = da0;
	assign slowMode = AnG && (GMode == 3'b000);
//	assign pixelClk = (slowMode && Clk) || (!slowMode && Clk3);
	assign OutFormat = FrameFormat;
	assign R = r;
	assign G = g;
	assign B = b;
	assign load = pixelCount == 0;
	
	always @(GMode, AnS, AnG) begin
		if (AnG)
			mode = {1'b0, GMode};
		else if (AnS)
			mode = 4'b1001;
		else
			mode = 4'b1000;
	end

	always @(posedge Clk) begin
		Clk3 = !Clk3;
	end
	
	always @(Clk) begin
		if (colCounter < allcols)
			colCounter = colCounter + 1;
		else
			colCounter = 0;
		if (activeRow && colCounter > leftpreload && colCounter < rightpreload) begin
			daCount = daCount + 1;
		end else
			daCount = 0;
	end

//	always @(active, pixelClk) begin
	always @(active, Clk) begin
		if (active) begin
			pixelCount = pixelCount + 1;
			r = pixelRGB[8:6];
			g = pixelRGB[5:3];
			b = pixelRGB[2:0];
		end else begin
			pixelCount = 0;
			r = 0;
			g = 0;
			b = 0;
		end
	end
	
	always @(negedge HSn) begin
		if (lineCounter < frameAllRows)
			lineCounter = lineCounter + 1;
		else
			lineCounter = 0;
	end

	always @(lineCounter) begin
		if (activeRow)
			alphaRow = (alphaRow + 1) % 12;
	end
	
	always @(posedge FSn) begin
	   if (Format) begin
		   frameTopRow = toprow2;
		   frameBottomRow = bottomrow2;
		   frameAllRows = allrows2;
	   end else begin
         frameTopRow = toprow;
         frameBottomRow = bottomrow;
         frameAllRows = allrows;
      end
	   FrameFormat = Format;
	end

	dataSwitch dataToPixel(
		.inData (DataIn),
		.mode (mode),
		.css (Css),
		.AnG (AnG),
		.AnS (AnS),
		.Inv (Inv),
		.InE (InE),
		.row (alphaRow),
		.clk (Clk),
		.load (load),
		.rgb (pixelRGB)
	);
endmodule