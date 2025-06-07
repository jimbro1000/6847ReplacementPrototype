`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2025 18:59:55
// Design Name: 
// Module Name: rawSwitch
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rawSwitch(
	input logic [7:0] inData,
	input logic [3:0] mode,
	input logic screen,
	input logic clk,
	input logic [1:0] divider,
	input logic load,
	output logic [8:0] rgb
    );
    
    rawShift shift(
	    .inData (inData),
	    .mode (mode),
        .css (screen),
        .clk (clk),
        .divider (divider),
        .load (load),
        .rgb (rgb)
    );
    
endmodule
