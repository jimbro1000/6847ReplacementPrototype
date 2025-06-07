module rawShift(
	input logic [7:0] inData,
	input logic [3:0] mode,
	input logic css,
	input logic clk,
	input logic divider,
	input logic load,
	output logic [8:0] rgb
);
    
	reg [7:0] pixelData;
	logic [1:0] pixel;
    
	initial begin
		pixel = 0;
	end
    
	always @(load, clk) begin
		if (load)
			pixelData = inData;
		if (divider == 0) begin
			pixel = {1'b0,pixelData[7]};
			pixelData = pixelData << 1;
		end else begin
			if (!clk) begin
				pixel = pixelData[7:6];
				pixelData = pixelData << 2;
			end
		end
	end
    
	colourMap map(
		.mode (mode),
	   .screen (css),
	   .colour (pixel),
	   .rgb (rgb)
    );
endmodule