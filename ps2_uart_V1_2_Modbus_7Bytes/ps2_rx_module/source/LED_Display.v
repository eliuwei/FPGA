module LED_Display (clk, rst, oneNum, twoNum, threeNum ,fourNum, fiveNum, sixNum , SEL,DIG);
	input clk;
	input rst;
	input [3:0] oneNum, twoNum, threeNum ,fourNum, fiveNum, sixNum;
	output [7:0] DIG;
	output [5:0] SEL;
	
	reg [7:0] DIG;
	reg [5:0] SEL;
	
	wire [7:0]oneNumLED, twoNumLED, threeNumLED ,fourNumLED, fiveNumLED, sixNumLED;
	
	
	NumToLEDNoPoint NTLED1(oneNum,oneNumLED);
	NumToLEDNoPoint NTLED2(twoNum,twoNumLED);
	NumToLEDNoPoint NTLED3(threeNum,threeNumLED);
	NumToLEDNoPoint NTLED4(fourNum,fourNumLED);
	NumToLEDNoPoint NTLED5(fiveNum,fiveNumLED);
	NumToLEDNoPoint NTLED6(sixNum,sixNumLED);	
	
	reg [3:0] i;
	always @(posedge div_clk)
	begin
		if ( i >= 4'd5 )    
				i <= 0;
			else
				i <= i + 4'd1;	
	end	
	
	always @(posedge clk)
	begin
		case(i)
			4'b00_00: SEL = 6'b11_11_10;
			4'b00_01: SEL = 6'b11_11_01;
//			4'b00_10: SEL = 6'b11_10_11;
//			4'b00_11: SEL = 6'b11_01_11;
//			4'b01_00: SEL = 6'b10_11_11;
//			4'b01_01: SEL = 6'b01_11_11;	
			4'b00_10: SEL = 6'b11_11_11;
			4'b00_11: SEL = 6'b11_11_11;
			4'b01_00: SEL = 6'b11_11_11;
			4'b01_01: SEL = 6'b11_11_11;
			default: SEL = 6'b11_11_11;
		endcase	
	end
	
	
	always @(posedge	clk)
	begin
		case(i)
			4'b00_00: DIG = oneNumLED;
			4'b00_01: DIG = twoNumLED;
			
			4'b00_10: DIG = threeNumLED;
			4'b00_11: DIG = fourNumLED;
			
			4'b01_00: DIG = fiveNumLED;
			4'b01_01: DIG = sixNumLED;

			default: DIG = 8'h8e;
		endcase
	end
	
	
	
	
	
	reg [31:0] counter;
	reg div_clk;
	parameter CONSTANT	= 32'd25_000;	
	always @(negedge rst or posedge clk)
	begin
		if (!rst)
			counter <= 0;
		else
		begin
			if ( counter >= (CONSTANT-1))    
				counter <= 0;
			else
				counter <= counter + 32'd1;	
		end
	end
		
	always @(negedge	rst  or posedge clk)
	begin
		if(!rst)
			div_clk <= 0;
		else
		begin
			if ( counter >= (CONSTANT-1))    
				div_clk <= ~div_clk;
		end
	end

	
endmodule 
	
	






