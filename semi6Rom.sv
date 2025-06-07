module semi6Rom(
	input logic css,
	input logic	row,
	input logic [7:0]	inData,
	output logic [7:0] outData,
	output logic [3:0] colour
);

logic [7:0] semiData [0:3];

initial begin
	semiData[0] = 8'b11111111;
	semiData[1] = 8'b11110000;
	semiData[2] = 8'b00001111;
	semiData[3] = 8'b00000000;
end

logic [3:0] index;

always @(row, css, inData) begin
	case (row)
		0,1,2,3:
			index = inData[1:0];
		4,5,6,7:
			index = inData[3:2];
		default:
			index = inData[5:4];
	endcase
	outData = semiData[index];
	if (css)
		colour = inData[7:6] + 5;
	else
		colour = inData[7:6] + 1;
end

endmodule