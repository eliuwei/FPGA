//DIG[7:0] LED Dispaly
//SEL[5:0] LEDs' EN, if EN=1->Light,else EN=0->Dark


module MyWatch_V1_0 (CLOCK, RESET, KEY1,KEY2,KEY3, DIG, SEL );


	input CLOCK,RESET;
	input KEY1,KEY2,KEY3;
	output [7:0] DIG;
	output [5:0] SEL;
	
	wire [7:0] DIG;
	wire [5:0] SEL;
	
	wire [7:0] Hour,Minute,Second;	
	wire _1Hz_clk, _100Hz_clk,_1000Hz_clk, clk;	
	wire SecondToMinute, MinuteToHour, HourToBuzzer;
	
	div_f DIV_f_1(CLOCK,clk);
	div_f_1000Hz DIV_1000Hz_1(CLOCK,_1000Hz_clk);
	div_f_100Hz DIV_100Hz_1(CLOCK,_100Hz_clk);	
	div_f_1Hz DIV_1Hz_1(CLOCK,_1Hz_clk);
	
	
//	counter60 SECOND1(  _1Hz_clk,      RESET, KEY1, Second,  SecondToMinute);
//	counter60 MINUTE1( SecondToMinute, RESET, KEY2, Minute,  MinuteToHour );
//	counter24 HOUR1(   MinuteToHour, RESET, KEY3, Hour,  HourToBuzzer);
//	counter60 SECOND1(  CLOCK,      RESET,  Second,  SecondToMinute);
//	LED_Display(CLOCK,Hour,Minute,Second,SEL,DIG);
	
	counter60 SECOND1( _1Hz_clk,      RESET, KEY1, Second,  SecondToMinute);
	counter60 MINUTE1( SecondToMinute, RESET,KEY2,  Minute,  MinuteToHour );
	counter24 HOUR1(   MinuteToHour, RESET, KEY3, Hour,  HourToBuzzer);
	LED_Display LED_SHOW1(clk, Hour,Minute,Second,SEL,DIG);
	
	

	
	
	
	//LED_Display(_1Hz_clk,Hour,Minute,Second,SEL,DIG);
	
//	assign SEL[0] = _1Hz_clk;
//	assign SEL[1] = SecondToMinute;
//	assign DIG = Hour;

endmodule



