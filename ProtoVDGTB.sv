`timescale 1ns/1ps
module ProtoVDGTB();

reg GClk;
reg AnG;
reg AnS;
reg Clk; 
reg Css; 
reg [7:0] Data; 
reg Format;
reg [2:0] GM;
reg InE; 
reg Inv; 
reg PALClk;
wire ColourClock;
wire DA0;
wire FSn; 
wire HSn; 
wire OutputFormat;
wire RPn;
wire [8:0] RGB;
wire tclk;

ProtoVDG u_protovdg (.*);

initial GClk = 1'b0;
initial AnG = 1'b1;
initial AnS = 1'b0;
initial Css = 1'b0;
initial Format = 1'b1;
initial InE = 1'b0;
initial Inv = 1'b0;
initial GM = 3'b110;
initial Clk = 1'b0;
initial Data = 8'b01010101;
initial PALClk = 1'b0;

initial begin
	#100000 $stop;
end

initial #139 Clk = ~Clk;
initial #20 GClk = ~GClk;
initial #115 PALClk = ~PALClk;

endmodule