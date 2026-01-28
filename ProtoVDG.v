`timescale 1ns / 1ps

module ProtoVDG(
					 GClk,
					 AnG, 
                AnS, 
                Clk, 
                Css, 
                Data, 
                Format, 
                GM, 
                Inv, 
                PALClk, 
                ColourClock, 
                DA0, 
                FSn, 
                HSn, 
                OutputFormat, 
                RGB
					);

    input GClk;
	 input AnG;
    input AnS;
    input Clk;
    input Css;
    input [7:0] Data;
    input Format;
    input [2:0] GM;
    input Inv;
    input PALClk;
   output ColourClock;
   output DA0;
   output FSn;
   output HSn;
   output OutputFormat;
   output [8:0] RGB;
   
   wire Divider;
   wire Load;
   wire PClk;
   wire Sel1;
   wire Sel2;
   wire [7:0] AlphaRowData;
   wire [7:0] AlphaData;
   wire [1:0] AlphaPixel;
   wire [1:0] GraphPixel;
   wire [7:0] SData;
   wire [3:0] SColour;
   wire [3:0] GraphColour;
   wire [3:0] AlphaColour;
   wire [3:0] SemiColour;
   wire [3:0] AlphaRow;
	wire [3:0] BorderColour;
	wire viewportActive;
	wire blank;
	
	parameter forceMode = 1'b0;
	parameter forceAlpha = 1'b0;
	parameter forceGM = 3'd6;
	parameter forceCSS = 1'b1;
	parameter forceSG = 1'b0;
	parameter forceFormat = 1'b0;
	parameter forceInv = 1'b0;
	parameter forceData = 8'd33;
	
	wire useAlpha;
	wire [2:0] useGM;
	wire useCSS;
	wire useAnS;
	wire useFormat;
	wire useInv;
	wire [7:0] useData;
	
	assign useAlpha = forceMode ? forceAlpha : AnG;
	assign useGM = GM; //forceMode ? forceGM : GM;
	assign useCSS = Css; //forceMode ? forceCSS : Css;
	assign useAnS = useData[7]; // forceMode ? forceSG : useData[7];
	assign useInv = useData[6]; // forceMode ? forceInv : Inv;
	assign useFormat = forceMode ? forceFormat : Format;
	assign useData = forceMode ? forceData : Data;
   
	// Multiplexer - pick colour clock timing based on Format signal
   FormatSelect  	FrmtSel (
							.Clk(Clk), 
							.Format(useFormat), 
							.FSn(FSn), 
							.PALClk(PALClk), 
							.ColourClock(ColourClock), 
							.FrameFormat(OutputFormat)
						);
	// Frame timing generator - orchestrate sync, data pre-load
   FormatTiming  	FmtTiming (
							.AnG(useAlpha), 
							.Clk(Clk), 
							.FrameFormat(OutputFormat), 
							.GMode(useGM), 
							.alphaRow(AlphaRow), 
							.DA0(DA0), 
							.FSn(FSn), 
							.HSn(HSn), 
							.BackPorch(blank),
							.active(viewportActive),
							.Load(Load), 
							.PixelClk(PClk)
						);
	// Multiplexer - pick pixel generator format, define timing divider, select lines for colour mux
   DataSelectPath	DataSel (
							.AnG(useAlpha), 
							.AnS(useAnS), 
							.GM(useGM), 
							.Divider(Divider), 
							.selAlpha(Sel2), 
							.selSemi(Sel1)
						);
	// Lookup Semi4 data to pixel
	Semi4Rom  		S4Rom (
							.Clk(Clk),
							.Data(useData), 
                     .Row(AlphaRow), 
                     .SColour(SColour), 
                     .SData(SData)
						);
	// Lookup character rom data
   AlphaIntRom  	AIRom (
							.Clk(Clk),
							.Data(useData[5:0]), 
							.Row(AlphaRow), 
							.AData(AlphaRowData)
						);
	// Multiplexer - select alpha pixel data or graphic pixel data
   AlphaSwitch  	AlphaSw (
							.Data(AlphaRowData), 
							.Inv(useInv), 
							.AData(AlphaData)
							);
	// alpha data shift register
   RawShift  		AlphaSf (
							.Clk(PClk), 
                     .Data(AlphaData), 
                     .Divider(Divider), 
                     .Load(Load), 
                     .Pixel(AlphaPixel[1:0])
						);
	// graphic data shift register
   RawShift  		GraphSf (
							.Clk(PClk), 
                     .Data(useData), 
                     .Divider(Divider), 
                     .Load(Load), 
                     .Pixel(GraphPixel[1:0])
						);
	// semigraphic data register
   SemiShift  		SemiSf (
							.Clk(PClk), 
                     .Data(SData), 
                     .Load(Load), 
                     .SColour(SColour), 
                     .Colour(SemiColour[3:0])
						);
	// alpha pixel data to colour 
   ColourMap  		AlphaMap (
							.AnG(useAlpha), 
                     .Css(useCSS), 
                     .Mode(GM), 
                     .Pixel(AlphaPixel[1:0]), 
                     .Colour(AlphaColour[3:0])
						);
	// graphic pixel data to colour
   ColourMap  		GraphMap (
							.AnG(useAlpha), 
                     .Css(useCSS), 
                     .Mode(useGM), 
                     .Pixel(GraphPixel[1:0]), 
                     .Colour(GraphColour[3:0])
						);
	// border colour selector
	BorderSelect	Border (
							.AnG(useAlpha),
							.CSS(useCSS),
							.GM(useGM),
							.Colour(BorderColour)
						);
	// multiplexer - pick pixel colour channel from display mode
   ColourMux  		Palette (
							.clk(Clk),
							.Colour1(SemiColour), 
                     .Colour2(AlphaColour[3:0]), 
                     .Colour3(GraphColour[3:0]), 
							.Colour4(BorderColour),
                     .Sel1(Sel1), 
                     .Sel2(Sel2), 
							.backporch(blank),
							.viewportActive(viewportActive),
                     .RGB(RGB)
						);
endmodule
