module LED_Display (clk,Hour, Minute, Second,SEL,DIG);
	input clk;
	input [7:0] Hour,Minute,Second;
	output [7:0] DIG;
	output [5:0] SEL;
	reg [7:0] DIG;
	reg [5:0] SEL;
	
	reg [3:0] Hour_Ten,Hour_One, Minute_Ten,Minute_One, Second_Ten,Second_One;
	wire [7:0] Hour_Ten_LED,Hour_One_LED, Minute_Ten_LED,Minute_One_LED, Second_Ten_LED,Second_One_LED;
	
	reg [3:0] i;
	
	
	always @(negedge clk )
	begin
		Hour_Ten <= Hour/10;
		Hour_One <= Hour%10;
		
		Minute_Ten <= Minute/10;
		Minute_One <= Minute%10;
		
		Second_Ten <= Second/10;
		Second_One <= Second%10;
	end
	NumToLEDNoPoint NTLED1(Hour_Ten,Hour_Ten_LED);
	NumToLEDPoint NTLED2(Hour_One,Hour_One_LED);
	NumToLEDNoPoint NTLED3(Minute_Ten,Minute_Ten_LED);
	NumToLEDPoint NTLED4(Minute_One,Minute_One_LED);
	NumToLEDNoPoint NTLED5(Second_Ten,Second_Ten_LED);
	NumToLEDNoPoint NTLED6(Second_One,Second_One_LED);
	
	
	
	
	always @(negedge clk)
	begin
		if ( i >= 5 )    
				i <= 0;
			else
				i <= i + 1;	
	end
	
	always @(negedge clk)
	begin
		case(i)
			4'b00_00: SEL = 6'b11_11_10;
			4'b00_01: SEL = 6'b11_11_01;
			4'b00_10: SEL = 6'b11_10_11;
			4'b00_11: SEL = 6'b11_01_11;
			4'b01_00: SEL = 6'b10_11_11;
			4'b01_01: SEL = 6'b01_11_11;			
			default: SEL = 6'b00_00_00;
		endcase	
	end
	
	
	always @(negedge clk)
	begin
		case(i)
			4'b00_00: DIG = Second_One_LED;
			4'b00_01: DIG = Second_Ten_LED;
			
			4'b00_10: DIG = Minute_One_LED;
			4'b00_11: DIG = Minute_Ten_LED;
			
			4'b01_00: DIG = Hour_One_LED;
			4'b01_01: DIG = Hour_Ten_LED;

			default: DIG = 8'h8e;
		endcase
	end

	
endmodule 
	
	






