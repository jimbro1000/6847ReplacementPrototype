`timescale 1ns / 1ps

module ProtoVDG(AnG, 
                AnS, 
                Clk, 
                Css, 
                Data, 
                Format, 
                GM, 
                InE, 
                Inv, 
                PALClk, 
                ColourClock, 
                DA0, 
                FSn, 
                HSn, 
                OutputFormat, 
					 RPn,
                RGB);

    input AnG;
    input AnS;
    input Clk;
    input Css;
    input [7:0] Data;
    input Format;
    input [2:0] GM;
    input InE;
    input Inv;
    input PALClk;
   output ColourClock;
   output DA0;
   output FSn;
   output HSn;
   output OutputFormat;
	output RPn;
   output [8:0] RGB;
   
   wire Divider;
   wire Load;
   wire PClk;
   wire Sel1;
   wire Sel2;
   wire [7:0] S4Data;
   wire [3:0] S4Colour;
   wire [7:0] S6Data;
   wire [3:0] S6Colour;
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
   wire FSn_DUMMY;
   wire OutputFormat_DUMMY;
   
   assign FSn = FSn_DUMMY;
   assign OutputFormat = OutputFormat_DUMMY;
	assign RPn = !AnG && (AlphaRow == 4'b0000);
   FormatSelect  FrmtSel (.Clk(Clk), 
							 .Format(Format), 
							 .FSn(FSn_DUMMY), 
							 .PALClk(PALClk), 
							 .ColourClock(ColourClock), 
							 .FrameFormat(OutputFormat_DUMMY));
   FormatTiming  FmtTiming (.AnG(AnG), 
                        .Clk(Clk), 
                        .FrameFormat(OutputFormat_DUMMY), 
                        .GMode(GM), 
                        .alphaRow(AlphaRow), 
                        .DA0(DA0), 
                        .FSn(FSn_DUMMY), 
                        .HSn(HSn), 
                        .Load(Load), 
                        .PixelClk(PClk));
   DataSelectPath  DataSel (.AnG(AnG), 
                          .AnS(AnS), 
                          .GM(GM), 
                          .Divider(Divider), 
                          .selAlpha(Sel2), 
                          .selSemi(Sel1));
   SemiSwitch  SemiSw (.InE(InE), 
                       .S4Colour(S4Colour[3:0]), 
                       .S4Data(S4Data), 
                       .S6Colour(S6Colour[3:0]), 
                       .S6Data(S6Data), 
                       .SColour(SColour[3:0]), 
                       .SData(SData));
   Semi4Rom  S4Rom (.Data(Data), 
                     .Row(AlphaRow), 
                     .SColour(S4Colour[3:0]), 
                     .SData(S4Data));
   Semi6Rom  S6Rom (.Css(Css), 
                     .Data(Data), 
                     .Row(AlphaRow), 
                     .SColour(S6Colour[3:0]), 
                     .SData(S6Data));
   AlphaIntRom  AIRom (.Data(Data[5:0]), 
                        .Row(AlphaRow), 
                        .AData(AlphaRowData));
   AlphaSwitch  AlphaSw (.Data(AlphaRowData), 
                        .Inv(Inv), 
                        .AData(AlphaData));
   RawShift  AlphaSf (.Clk(PClk), 
                     .Data(AlphaData), 
                     .Divider(Divider), 
                     .Load(Load), 
                     .Pixel(AlphaPixel[1:0]));
   RawShift  GraphSf (.Clk(PClk), 
                     .Data(Data), 
                     .Divider(Divider), 
                     .Load(Load), 
                     .Pixel(GraphPixel[1:0]));
   SemiShift  SemiSf (.Clk(PClk), 
                      .Data(SData), 
                      .Load(Load), 
                      .SColour(SColour[3:0]), 
                      .Colour(SemiColour[3:0]));
   ColourMap  AlphaMap (.AnG(AnG), 
                      .Css(Css), 
                      .Mode(GM), 
                      .Pixel(AlphaPixel[1:0]), 
                      .Colour(AlphaColour[3:0]));
   ColourMap  GraphMap (.AnG(AnG), 
                      .Css(Css), 
                      .Mode(GM), 
                      .Pixel(GraphPixel[1:0]), 
                      .Colour(GraphColour[3:0]));
   ColourMux  Palette (.Colour1(SemiColour[3:0]), 
                      .Colour2(AlphaColour[3:0]), 
                      .Colour3(GraphColour[3:0]), 
                      .Sel1(Sel1), 
                      .Sel2(Sel2), 
                      .RGB(RGB));
endmodule