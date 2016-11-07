module LED_One( clk, BCD, DIG);
	input clk;
	input [3:0] BCD;
	output [7:0] DIG;
	reg [7:0] DIG;
	
	
	 //0xc0,0xf9,0xa4,0xb0,0x99,   0x92,0x82,0xf8,0x80,0x90,   0x88,0x83,0xc6,0xa1,0x86,0x8e
	always @(negedge clk)
	begin
		case(BCD)
			4'b0000: DIG = 8'hC0;
			4'b0001: DIG = 8'hF9;
			4'b0010: DIG = 8'hA4;
			4'b0011: DIG = 8'hB0;
			4'b0100: DIG = 8'h99;
			
			4'b0101: DIG = 8'h92;
			4'b0110: DIG = 8'h82;
			4'b0111: DIG = 8'hF8;
			4'b1000: DIG = 8'h80;
			4'b1001: DIG = 8'h90;
		endcase
	end

endmodule