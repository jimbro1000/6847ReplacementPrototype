module FontDef(
	input Clk,
	input [5:0] data,
	input [3:0] row,
	output reg [4:0] bitmap
);

	always @(negedge Clk)
		case ({data,row})
			//@ 0
			{6'd0,4'd3} : bitmap <= 5'b01110;
			{6'd0,4'd4} : bitmap <= 5'b10001;
			{6'd0,4'd5} : bitmap <= 5'b00001;
			{6'd0,4'd6} : bitmap <= 5'b01101;
			{6'd0,4'd7} : bitmap <= 5'b10101;
			{6'd0,4'd8} : bitmap <= 5'b10101;
			{6'd0,4'd9} : bitmap <= 5'b01110;
			//A 1
			{6'd1,4'd3} : bitmap <= 5'b00100;
			{6'd1,4'd4} : bitmap <= 5'b01010;
			{6'd1,4'd5} : bitmap <= 5'b10001;
			{6'd1,4'd6} : bitmap <= 5'b10001;
			{6'd1,4'd7} : bitmap <= 5'b11111;
			{6'd1,4'd8} : bitmap <= 5'b10001;
			{6'd1,4'd9} : bitmap <= 5'b10001;
			//B 2
			{6'd2,4'd3} : bitmap <= 5'b11110;
			{6'd2,4'd4} : bitmap <= 5'b01001;
			{6'd2,4'd5} : bitmap <= 5'b01001;
			{6'd2,4'd6} : bitmap <= 5'b01110;
			{6'd2,4'd7} : bitmap <= 5'b01001;
			{6'd2,4'd8} : bitmap <= 5'b01001;
			{6'd2,4'd9} : bitmap <= 5'b11110;
			//C 3
			{6'd3,4'd3} : bitmap <= 5'b01110;
			{6'd3,4'd4} : bitmap <= 5'b10001;
			{6'd3,4'd5} : bitmap <= 5'b10000;
			{6'd3,4'd6} : bitmap <= 5'b10000;
			{6'd3,4'd7} : bitmap <= 5'b10000;
			{6'd3,4'd8} : bitmap <= 5'b10001;
			{6'd3,4'd9} : bitmap <= 5'b01110;
			//D 4
			{6'd4,4'd3} : bitmap <= 5'b11110;
			{6'd4,4'd4} : bitmap <= 5'b01001;
			{6'd4,4'd5} : bitmap <= 5'b01001;
			{6'd4,4'd6} : bitmap <= 5'b01001;
			{6'd4,4'd7} : bitmap <= 5'b01001;
			{6'd4,4'd8} : bitmap <= 5'b01001;
			{6'd4,4'd9} : bitmap <= 5'b11110;
			//E 5
			{6'd5,4'd3} : bitmap <= 5'b11111;
			{6'd5,4'd4} : bitmap <= 5'b10000;
			{6'd5,4'd5} : bitmap <= 5'b10000;
			{6'd5,4'd6} : bitmap <= 5'b11110;
			{6'd5,4'd7} : bitmap <= 5'b10000;
			{6'd5,4'd8} : bitmap <= 5'b10000;
			{6'd5,4'd9} : bitmap <= 5'b11111;
			//F 6
			{6'd6,4'd3} : bitmap <= 5'b11111;
			{6'd6,4'd4} : bitmap <= 5'b10000;
			{6'd6,4'd5} : bitmap <= 5'b10000;
			{6'd6,4'd6} : bitmap <= 5'b11110;
			{6'd6,4'd7} : bitmap <= 5'b10000;
			{6'd6,4'd8} : bitmap <= 5'b10000;
			{6'd6,4'd9} : bitmap <= 5'b10000;
			//G 7
			{6'd7,4'd3} : bitmap <= 5'b01111;
			{6'd7,4'd4} : bitmap <= 5'b10000;
			{6'd7,4'd5} : bitmap <= 5'b10000;
			{6'd7,4'd6} : bitmap <= 5'b10011;
			{6'd7,4'd7} : bitmap <= 5'b10001;
			{6'd7,4'd8} : bitmap <= 5'b10001;
			{6'd7,4'd9} : bitmap <= 5'b01110;
			//H 8
			{6'd8,4'd3} : bitmap <= 5'b10001;
			{6'd8,4'd4} : bitmap <= 5'b10001;
			{6'd8,4'd5} : bitmap <= 5'b10001;
			{6'd8,4'd6} : bitmap <= 5'b11111;
			{6'd8,4'd7} : bitmap <= 5'b10001;
			{6'd8,4'd8} : bitmap <= 5'b10001;
			{6'd8,4'd9} : bitmap <= 5'b10001;
			//I 9
			{6'd9,4'd3} : bitmap <= 5'b01110;
			{6'd9,4'd4} : bitmap <= 5'b00100;
			{6'd9,4'd5} : bitmap <= 5'b00100;
			{6'd9,4'd6} : bitmap <= 5'b00100;
			{6'd9,4'd7} : bitmap <= 5'b00100;
			{6'd9,4'd8} : bitmap <= 5'b00100;
			{6'd9,4'd9} : bitmap <= 5'b01110;
			//J 10
			{6'd10,4'd3} : bitmap <= 5'b00001;
			{6'd10,4'd4} : bitmap <= 5'b00001;
			{6'd10,4'd5} : bitmap <= 5'b00001;
			{6'd10,4'd6} : bitmap <= 5'b00001;
			{6'd10,4'd7} : bitmap <= 5'b10001;
			{6'd10,4'd8} : bitmap <= 5'b10001;
			{6'd10,4'd9} : bitmap <= 5'b01110;
			//K 11
			{6'd11,4'd3} : bitmap <= 5'b10001;
			{6'd11,4'd4} : bitmap <= 5'b10010;
			{6'd11,4'd5} : bitmap <= 5'b10100;
			{6'd11,4'd6} : bitmap <= 5'b11000;
			{6'd11,4'd7} : bitmap <= 5'b10100;
			{6'd11,4'd8} : bitmap <= 5'b10010;
			{6'd11,4'd9} : bitmap <= 5'b10001;
			//L 12
			{6'd12,4'd3} : bitmap <= 5'b10000;
			{6'd12,4'd4} : bitmap <= 5'b10000;
			{6'd12,4'd5} : bitmap <= 5'b10000;
			{6'd12,4'd6} : bitmap <= 5'b10000;
			{6'd12,4'd7} : bitmap <= 5'b10000;
			{6'd12,4'd8} : bitmap <= 5'b10000;
			{6'd12,4'd9} : bitmap <= 5'b11111;
			//M 13
			{6'd13,4'd3} : bitmap <= 5'b10001;
			{6'd13,4'd4} : bitmap <= 5'b11011;
			{6'd13,4'd5} : bitmap <= 5'b10101;
			{6'd13,4'd6} : bitmap <= 5'b10101;
			{6'd13,4'd7} : bitmap <= 5'b10001;
			{6'd13,4'd8} : bitmap <= 5'b10001;
			{6'd13,4'd9} : bitmap <= 5'b10001;
			//N 14
			{6'd14,4'd3} : bitmap <= 5'b10001;
			{6'd14,4'd3} : bitmap <= 5'b11001;
			{6'd14,4'd4} : bitmap <= 5'b10101;
			{6'd14,4'd5} : bitmap <= 5'b10011;
			{6'd14,4'd6} : bitmap <= 5'b10001;
			{6'd14,4'd7} : bitmap <= 5'b10001;
			{6'd14,4'd8} : bitmap <= 5'b10001;
			//O 15
			{6'd15,4'd3} : bitmap <= 5'b01110;
			{6'd15,4'd4} : bitmap <= 5'b10001;
			{6'd15,4'd5} : bitmap <= 5'b10001;
			{6'd15,4'd6} : bitmap <= 5'b10001;
			{6'd15,4'd7} : bitmap <= 5'b10001;
			{6'd15,4'd8} : bitmap <= 5'b10001;
			{6'd15,4'd9} : bitmap <= 5'b01110;
			//P 16
			{6'd16,4'd3} : bitmap <= 5'b11110;
			{6'd16,4'd4} : bitmap <= 5'b10001;
			{6'd16,4'd5} : bitmap <= 5'b10001;
			{6'd16,4'd6} : bitmap <= 5'b11110;
			{6'd16,4'd7} : bitmap <= 5'b10000;
			{6'd16,4'd8} : bitmap <= 5'b10000;
			{6'd16,4'd9} : bitmap <= 5'b10000;
			//Q 17
			{6'd17,4'd3} : bitmap <= 5'b01110;
			{6'd17,4'd4} : bitmap <= 5'b10001;
			{6'd17,4'd5} : bitmap <= 5'b10001;
			{6'd17,4'd6} : bitmap <= 5'b10001;
			{6'd17,4'd7} : bitmap <= 5'b10101;
			{6'd17,4'd8} : bitmap <= 5'b10010;
			{6'd17,4'd9} : bitmap <= 5'b01101;
			//R 18
			{6'd18,4'd3} : bitmap <= 5'b11110;
			{6'd18,4'd4} : bitmap <= 5'b10001;
			{6'd18,4'd5} : bitmap <= 5'b10001;
			{6'd18,4'd6} : bitmap <= 5'b11110;
			{6'd18,4'd7} : bitmap <= 5'b10100;
			{6'd18,4'd8} : bitmap <= 5'b10010;
			{6'd18,4'd9} : bitmap <= 5'b10001;
			//S 19
			{6'd19,4'd3} : bitmap <= 5'b01110;
			{6'd19,4'd4} : bitmap <= 5'b10001;
			{6'd19,4'd5} : bitmap <= 5'b01000;
			{6'd19,4'd6} : bitmap <= 5'b00100;
			{6'd19,4'd7} : bitmap <= 5'b00010;
			{6'd19,4'd8} : bitmap <= 5'b10001;
			{6'd19,4'd9} : bitmap <= 5'b01110;
			//T 20
			{6'd20,4'd3} : bitmap <= 5'b11111;
			{6'd20,4'd4} : bitmap <= 5'b00100;
			{6'd20,4'd5} : bitmap <= 5'b00100;
			{6'd20,4'd6} : bitmap <= 5'b00100;
			{6'd20,4'd7} : bitmap <= 5'b00100;
			{6'd20,4'd8} : bitmap <= 5'b00100;
			{6'd20,4'd9} : bitmap <= 5'b00100;
			//U 21
			{6'd21,4'd3} : bitmap <= 5'b10001;
			{6'd21,4'd4} : bitmap <= 5'b10001;
			{6'd21,4'd5} : bitmap <= 5'b10001;
			{6'd21,4'd6} : bitmap <= 5'b10001;
			{6'd21,4'd7} : bitmap <= 5'b10001;
			{6'd21,4'd8} : bitmap <= 5'b10001;
			{6'd21,4'd9} : bitmap <= 5'b01110;
			//V 22
			{6'd22,4'd3} : bitmap <= 5'b10001;
			{6'd22,4'd4} : bitmap <= 5'b10001;
			{6'd22,4'd5} : bitmap <= 5'b10001;
			{6'd22,4'd6} : bitmap <= 5'b01010;
			{6'd22,4'd7} : bitmap <= 5'b01010;
			{6'd22,4'd8} : bitmap <= 5'b00100;
			{6'd22,4'd9} : bitmap <= 5'b00100;
			//W 23
			{6'd23,4'd3} : bitmap <= 5'b10001;
			{6'd23,4'd4} : bitmap <= 5'b10001;
			{6'd23,4'd5} : bitmap <= 5'b10001;
			{6'd23,4'd6} : bitmap <= 5'b10101;
			{6'd23,4'd7} : bitmap <= 5'b10101;
			{6'd23,4'd8} : bitmap <= 5'b11011;
			{6'd23,4'd9} : bitmap <= 5'b10001;
			//X 24
			{6'd24,4'd3} : bitmap <= 5'b10001;
			{6'd24,4'd4} : bitmap <= 5'b10001;
			{6'd24,4'd5} : bitmap <= 5'b01010;
			{6'd24,4'd6} : bitmap <= 5'b00100;
			{6'd24,4'd7} : bitmap <= 5'b01010;
			{6'd24,4'd8} : bitmap <= 5'b10001;
			{6'd24,4'd9} : bitmap <= 5'b10001;
			//Y 25
			{6'd25,4'd3} : bitmap <= 5'b10001;
			{6'd25,4'd4} : bitmap <= 5'b10001;
			{6'd25,4'd5} : bitmap <= 5'b01010;
			{6'd25,4'd6} : bitmap <= 5'b00100;
			{6'd25,4'd7} : bitmap <= 5'b00100;
			{6'd25,4'd8} : bitmap <= 5'b00100;
			{6'd25,4'd9} : bitmap <= 5'b00100;
			//Z 26
			{6'd26,4'd3} : bitmap <= 5'b11111;
			{6'd26,4'd4} : bitmap <= 5'b00001;
			{6'd26,4'd5} : bitmap <= 5'b00010;
			{6'd26,4'd6} : bitmap <= 5'b00100;
			{6'd26,4'd7} : bitmap <= 5'b01000;
			{6'd26,4'd8} : bitmap <= 5'b10000;
			{6'd26,4'd9} : bitmap <= 5'b11111;
			//[ 27
			{6'd27,4'd3} : bitmap <= 5'b11100;
			{6'd27,4'd4} : bitmap <= 5'b10000;
			{6'd27,4'd5} : bitmap <= 5'b10000;
			{6'd27,4'd6} : bitmap <= 5'b10000;
			{6'd27,4'd7} : bitmap <= 5'b10000;
			{6'd27,4'd8} : bitmap <= 5'b10000;
			{6'd27,4'd9} : bitmap <= 5'b11100;
			// \ 28
			{6'd28,4'd3} : bitmap <= 5'b11100;
			{6'd28,4'd4} : bitmap <= 5'b10000;
			{6'd28,4'd5} : bitmap <= 5'b10000;
			{6'd28,4'd6} : bitmap <= 5'b10000;
			{6'd28,4'd7} : bitmap <= 5'b10000;
			{6'd28,4'd8} : bitmap <= 5'b10000;
			{6'd28,4'd9} : bitmap <= 5'b11100;
			// ] 29
			{6'd29,4'd3} : bitmap <= 5'b11100;
			{6'd29,4'd4} : bitmap <= 5'b10000;
			{6'd29,4'd5} : bitmap <= 5'b10000;
			{6'd29,4'd6} : bitmap <= 5'b10000;
			{6'd29,4'd7} : bitmap <= 5'b10000;
			{6'd29,4'd8} : bitmap <= 5'b10000;
			{6'd29,4'd9} : bitmap <= 5'b11100;
			// (up) 30
			{6'd30,4'd3} : bitmap <= 5'b00100;
			{6'd30,4'd4} : bitmap <= 5'b01110;
			{6'd30,4'd5} : bitmap <= 5'b10101;
			{6'd30,4'd6} : bitmap <= 5'b00100;
			{6'd30,4'd7} : bitmap <= 5'b00100;
			{6'd30,4'd8} : bitmap <= 5'b00100;
			{6'd30,4'd9} : bitmap <= 5'b00100;
			// (left) 31
			{6'd31,4'd3} : bitmap <= 5'b00000;
			{6'd31,4'd4} : bitmap <= 5'b00100;
			{6'd31,4'd5} : bitmap <= 5'b01000;
			{6'd31,4'd6} : bitmap <= 5'b11111;
			{6'd31,4'd7} : bitmap <= 5'b01000;
			{6'd31,4'd8} : bitmap <= 5'b00100;
			{6'd31,4'd9} : bitmap <= 5'b00000;
			// (space) 32
			{6'd32,4'd3} : bitmap <= 5'b00000;
			{6'd32,4'd4} : bitmap <= 5'b00000;
			{6'd32,4'd5} : bitmap <= 5'b00000;
			{6'd32,4'd6} : bitmap <= 5'b00000;
			{6'd32,4'd7} : bitmap <= 5'b00000;
			{6'd32,4'd8} : bitmap <= 5'b00000;
			{6'd32,4'd9} : bitmap <= 5'b00000;
			// ! 33
			{6'd33,4'd3} : bitmap <= 5'b00100;
			{6'd33,4'd4} : bitmap <= 5'b00100;
			{6'd33,4'd5} : bitmap <= 5'b00100;
			{6'd33,4'd6} : bitmap <= 5'b00100;
			{6'd33,4'd7} : bitmap <= 5'b00100;
			{6'd33,4'd8} : bitmap <= 5'b00000;
			{6'd33,4'd9} : bitmap <= 5'b00100;
			// " 34
			{6'd34,4'd3} : bitmap <= 5'b01010;
			{6'd34,4'd4} : bitmap <= 5'b01010;
			{6'd34,4'd5} : bitmap <= 5'b00000;
			{6'd34,4'd6} : bitmap <= 5'b00000;
			{6'd34,4'd7} : bitmap <= 5'b00000;
			{6'd34,4'd8} : bitmap <= 5'b00000;
			{6'd34,4'd9} : bitmap <= 5'b00000;
			// # 35
			{6'd35,4'd3} : bitmap <= 5'b01010;
			{6'd35,4'd4} : bitmap <= 5'b01010;
			{6'd35,4'd5} : bitmap <= 5'b11011;
			{6'd35,4'd6} : bitmap <= 5'b00000;
			{6'd35,4'd7} : bitmap <= 5'b11011;
			{6'd35,4'd8} : bitmap <= 5'b01010;
			{6'd35,4'd9} : bitmap <= 5'b01010;
			// $ 36
			{6'd36,4'd3} : bitmap <= 5'b00100;
			{6'd36,4'd4} : bitmap <= 5'b01111;
			{6'd36,4'd5} : bitmap <= 5'b10000;
			{6'd36,4'd6} : bitmap <= 5'b01110;
			{6'd36,4'd7} : bitmap <= 5'b00001;
			{6'd36,4'd8} : bitmap <= 5'b11110;
			{6'd36,4'd9} : bitmap <= 5'b00100;
			// % 37
			{6'd37,4'd3} : bitmap <= 5'b11001;
			{6'd37,4'd4} : bitmap <= 5'b11001;
			{6'd37,4'd5} : bitmap <= 5'b00010;
			{6'd37,4'd6} : bitmap <= 5'b00100;
			{6'd37,4'd7} : bitmap <= 5'b01000;
			{6'd37,4'd8} : bitmap <= 5'b10011;
			{6'd37,4'd9} : bitmap <= 5'b10011;
			// & 38
			{6'd38,4'd3} : bitmap <= 5'b01000;
			{6'd38,4'd4} : bitmap <= 5'b10100;
			{6'd38,4'd5} : bitmap <= 5'b10100;
			{6'd38,4'd6} : bitmap <= 5'b01000;
			{6'd38,4'd7} : bitmap <= 5'b10101;
			{6'd38,4'd8} : bitmap <= 5'b10010;
			{6'd38,4'd9} : bitmap <= 5'b01101;
			// ' 39
			{6'd39,4'd3} : bitmap <= 5'b01100;
			{6'd39,4'd4} : bitmap <= 5'b01100;
			{6'd39,4'd5} : bitmap <= 5'b01100;
			{6'd39,4'd6} : bitmap <= 5'b00000;
			{6'd39,4'd7} : bitmap <= 5'b00000;
			{6'd39,4'd8} : bitmap <= 5'b00000;
			{6'd39,4'd9} : bitmap <= 5'b00000;
			// ( 40
			{6'd40,4'd3} : bitmap <= 5'b00100;
			{6'd40,4'd4} : bitmap <= 5'b01000;
			{6'd40,4'd5} : bitmap <= 5'b10000;
			{6'd40,4'd6} : bitmap <= 5'b10000;
			{6'd40,4'd7} : bitmap <= 5'b10000;
			{6'd40,4'd8} : bitmap <= 5'b01000;
			{6'd40,4'd9} : bitmap <= 5'b00100;
			// ) 41
			{6'd41,4'd3} : bitmap <= 5'b00100;
			{6'd41,4'd4} : bitmap <= 5'b00010;
			{6'd41,4'd5} : bitmap <= 5'b00001;
			{6'd41,4'd6} : bitmap <= 5'b00001;
			{6'd41,4'd7} : bitmap <= 5'b00001;
			{6'd41,4'd8} : bitmap <= 5'b00010;
			{6'd41,4'd9} : bitmap <= 5'b00100;
			// * 42
			{6'd42,4'd3} : bitmap <= 5'b00000;
			{6'd42,4'd4} : bitmap <= 5'b00100;
			{6'd42,4'd5} : bitmap <= 5'b01110;
			{6'd42,4'd6} : bitmap <= 5'b11111;
			{6'd42,4'd7} : bitmap <= 5'b01110;
			{6'd42,4'd8} : bitmap <= 5'b00100;
			{6'd42,4'd9} : bitmap <= 5'b00000;
			// + 43
			{6'd43,4'd3} : bitmap <= 5'b00000;
			{6'd43,4'd4} : bitmap <= 5'b00100;
			{6'd43,4'd5} : bitmap <= 5'b00100;
			{6'd43,4'd6} : bitmap <= 5'b11111;
			{6'd43,4'd7} : bitmap <= 5'b00100;
			{6'd43,4'd8} : bitmap <= 5'b00100;
			{6'd43,4'd9} : bitmap <= 5'b00000;
			// , 44
			{6'd44,4'd3} : bitmap <= 5'b00000;
			{6'd44,4'd4} : bitmap <= 5'b00000;
			{6'd44,4'd5} : bitmap <= 5'b00000;
			{6'd44,4'd6} : bitmap <= 5'b11000;
			{6'd44,4'd7} : bitmap <= 5'b11000;
			{6'd44,4'd8} : bitmap <= 5'b01000;
			{6'd44,4'd9} : bitmap <= 5'b10000;
			// - 45
			{6'd45,4'd3} : bitmap <= 5'b00000;
			{6'd45,4'd4} : bitmap <= 5'b00000;
			{6'd45,4'd5} : bitmap <= 5'b00000;
			{6'd45,4'd6} : bitmap <= 5'b11111;
			{6'd45,4'd7} : bitmap <= 5'b00000;
			{6'd45,4'd8} : bitmap <= 5'b00000;
			{6'd45,4'd9} : bitmap <= 5'b00000;
			// . 46
			{6'd46,4'd3} : bitmap <= 5'b00000;
			{6'd46,4'd4} : bitmap <= 5'b00000;
			{6'd46,4'd5} : bitmap <= 5'b00000;
			{6'd46,4'd6} : bitmap <= 5'b00000;
			{6'd46,4'd7} : bitmap <= 5'b00000;
			{6'd46,4'd8} : bitmap <= 5'b11000;
			{6'd46,4'd9} : bitmap <= 5'b11000;
			// / 47
			{6'd47,4'd3} : bitmap <= 5'b00001;
			{6'd47,4'd4} : bitmap <= 5'b00001;
			{6'd47,4'd5} : bitmap <= 5'b00010;
			{6'd47,4'd6} : bitmap <= 5'b00100;
			{6'd47,4'd7} : bitmap <= 5'b01000;
			{6'd47,4'd8} : bitmap <= 5'b10000;
			{6'd47,4'd9} : bitmap <= 5'b10000;
			// 0 48
			{6'd48,4'd3} : bitmap <= 5'b01100;
			{6'd48,4'd4} : bitmap <= 5'b10010;
			{6'd48,4'd5} : bitmap <= 5'b10010;
			{6'd48,4'd6} : bitmap <= 5'b10010;
			{6'd48,4'd7} : bitmap <= 5'b10010;
			{6'd48,4'd8} : bitmap <= 5'b10010;
			{6'd48,4'd9} : bitmap <= 5'b01100;
			// 1 49
			{6'd49,4'd3} : bitmap <= 5'b00100;
			{6'd49,4'd4} : bitmap <= 5'b01100;
			{6'd49,4'd5} : bitmap <= 5'b00100;
			{6'd49,4'd6} : bitmap <= 5'b00100;
			{6'd49,4'd7} : bitmap <= 5'b00100;
			{6'd49,4'd8} : bitmap <= 5'b00100;
			{6'd49,4'd9} : bitmap <= 5'b01110;
			// 2 50
			{6'd50,4'd3} : bitmap <= 5'b01110;
			{6'd50,4'd4} : bitmap <= 5'b10001;
			{6'd50,4'd5} : bitmap <= 5'b00001;
			{6'd50,4'd6} : bitmap <= 5'b01110;
			{6'd50,4'd7} : bitmap <= 5'b10000;
			{6'd50,4'd8} : bitmap <= 5'b10000;
			{6'd50,4'd9} : bitmap <= 5'b11111;
			// 3 51
			{6'd51,4'd3} : bitmap <= 5'b01110;
			{6'd51,4'd4} : bitmap <= 5'b10001;
			{6'd51,4'd5} : bitmap <= 5'b00001;
			{6'd51,4'd6} : bitmap <= 5'b00110;
			{6'd51,4'd7} : bitmap <= 5'b00001;
			{6'd51,4'd8} : bitmap <= 5'b10001;
			{6'd51,4'd9} : bitmap <= 5'b01110;
			// 4 52
			{6'd52,4'd3} : bitmap <= 5'b00010;
			{6'd52,4'd4} : bitmap <= 5'b00110;
			{6'd52,4'd5} : bitmap <= 5'b01010;
			{6'd52,4'd6} : bitmap <= 5'b11110;
			{6'd52,4'd7} : bitmap <= 5'b00010;
			{6'd52,4'd8} : bitmap <= 5'b00010;
			{6'd52,4'd9} : bitmap <= 5'b00010;
			// 5 53
			{6'd53,4'd3} : bitmap <= 5'b11111;
			{6'd53,4'd4} : bitmap <= 5'b10000;
			{6'd53,4'd5} : bitmap <= 5'b10000;
			{6'd53,4'd6} : bitmap <= 5'b11110;
			{6'd53,4'd7} : bitmap <= 5'b00001;
			{6'd53,4'd8} : bitmap <= 5'b10001;
			{6'd53,4'd9} : bitmap <= 5'b01110;
			// 6 54
			{6'd54,4'd3} : bitmap <= 5'b01110;
			{6'd54,4'd4} : bitmap <= 5'b10000;
			{6'd54,4'd5} : bitmap <= 5'b10000;
			{6'd54,4'd6} : bitmap <= 5'b11110;
			{6'd54,4'd7} : bitmap <= 5'b10001;
			{6'd54,4'd8} : bitmap <= 5'b10001;
			{6'd54,4'd9} : bitmap <= 5'b01110;
			// 7 55
			{6'd55,4'd3} : bitmap <= 5'b11111;
			{6'd55,4'd4} : bitmap <= 5'b00001;
			{6'd55,4'd5} : bitmap <= 5'b00010;
			{6'd55,4'd6} : bitmap <= 5'b00100;
			{6'd55,4'd7} : bitmap <= 5'b01000;
			{6'd55,4'd8} : bitmap <= 5'b10000;
			{6'd55,4'd9} : bitmap <= 5'b10000;
			// 8 56
			{6'd56,4'd3} : bitmap <= 5'b01110;
			{6'd56,4'd4} : bitmap <= 5'b10001;
			{6'd56,4'd5} : bitmap <= 5'b10001;
			{6'd56,4'd6} : bitmap <= 5'b01110;
			{6'd56,4'd7} : bitmap <= 5'b10001;
			{6'd56,4'd8} : bitmap <= 5'b10001;
			{6'd56,4'd9} : bitmap <= 5'b01110;
			// 9 57
			{6'd57,4'd3} : bitmap <= 5'b01110;
			{6'd57,4'd4} : bitmap <= 5'b10001;
			{6'd57,4'd5} : bitmap <= 5'b10001;
			{6'd57,4'd6} : bitmap <= 5'b01111;
			{6'd57,4'd7} : bitmap <= 5'b00001;
			{6'd57,4'd8} : bitmap <= 5'b00001;
			{6'd57,4'd9} : bitmap <= 5'b01110;
			// : 58
			{6'd58,4'd3} : bitmap <= 5'b00000;
			{6'd58,4'd4} : bitmap <= 5'b01100;
			{6'd58,4'd5} : bitmap <= 5'b01100;
			{6'd58,4'd6} : bitmap <= 5'b00000;
			{6'd58,4'd7} : bitmap <= 5'b01100;
			{6'd58,4'd8} : bitmap <= 5'b01100;
			{6'd58,4'd9} : bitmap <= 5'b00000;
			// ; 59
			{6'd59,4'd3} : bitmap <= 5'b01100;
			{6'd59,4'd4} : bitmap <= 5'b01100;
			{6'd59,4'd5} : bitmap <= 5'b00000;
			{6'd59,4'd6} : bitmap <= 5'b01100;
			{6'd59,4'd7} : bitmap <= 5'b01100;
			{6'd59,4'd8} : bitmap <= 5'b00100;
			{6'd59,4'd9} : bitmap <= 5'b01000;
			// < 60
			{6'd60,4'd3} : bitmap <= 5'b00010;
			{6'd60,4'd4} : bitmap <= 5'b00100;
			{6'd60,4'd5} : bitmap <= 5'b01000;
			{6'd60,4'd6} : bitmap <= 5'b10000;
			{6'd60,4'd7} : bitmap <= 5'b01000;
			{6'd60,4'd8} : bitmap <= 5'b00100;
			{6'd60,4'd9} : bitmap <= 5'b00010;
			// = 61
			{6'd61,4'd3} : bitmap <= 5'b00000;
			{6'd61,4'd4} : bitmap <= 5'b00000;
			{6'd61,4'd5} : bitmap <= 5'b11111;
			{6'd61,4'd6} : bitmap <= 5'b10000;
			{6'd61,4'd7} : bitmap <= 5'b11111;
			{6'd61,4'd8} : bitmap <= 5'b00000;
			{6'd61,4'd9} : bitmap <= 5'b00010;
			// > 62
			{6'd62,4'd3} : bitmap <= 5'b01000;
			{6'd62,4'd4} : bitmap <= 5'b00100;
			{6'd62,4'd5} : bitmap <= 5'b00010;
			{6'd62,4'd6} : bitmap <= 5'b00001;
			{6'd62,4'd7} : bitmap <= 5'b00010;
			{6'd62,4'd8} : bitmap <= 5'b00100;
			{6'd62,4'd9} : bitmap <= 5'b01000;
			// ? 63
			{6'd63,4'd3} : bitmap <= 5'b01100;
			{6'd63,4'd4} : bitmap <= 5'b10010;
			{6'd63,4'd5} : bitmap <= 5'b00010;
			{6'd63,4'd6} : bitmap <= 5'b00100;
			{6'd63,4'd7} : bitmap <= 5'b00100;
			{6'd63,4'd8} : bitmap <= 5'b00000;
			{6'd63,4'd9} : bitmap <= 5'b00100;
			
			default: bitmap <= 5'b00000;
		endcase

endmodule
