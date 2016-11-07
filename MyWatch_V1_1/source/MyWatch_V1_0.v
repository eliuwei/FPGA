//DIG[7:0] LED Dispaly
//SEL[5:0] LEDs' EN, if EN=1->Light,else EN=0->Dark


module MyWatch_V1_0 (CLOCK, RESET, KEY1,KEY2,KEY3, DIG, SEL ,LED);


	input CLOCK,RESET;
	input KEY1,KEY2,KEY3;
	output [7:0] DIG;
	output [5:0] SEL;
	output [3:0] LED;
	
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

	wire afterDetect_KEY1;
	wire afterDetect_KEY2;
	wire afterDetect_KEY3;
	wire afterDetect_RESET;
	
	keyin_detect DETCET_KEY_U1 (RESET, CLOCK, KEY1, afterDetect_KEY1);
	keyin_detect DETCET_KEY_U2 (RESET, CLOCK, KEY2, afterDetect_KEY2);
	keyin_detect DETCET_KEY_U3 (RESET, CLOCK, KEY3, afterDetect_KEY3);
	keyin_detect DETCET_KEY_RESET (RESET, CLOCK, RESET, afterDetect_RESET);

	counter60 SECOND1( _1Hz_clk,      afterDetect_RESET, afterDetect_KEY1, Second,  SecondToMinute);
	counter60 MINUTE1( SecondToMinute, afterDetect_RESET,afterDetect_KEY2,  Minute,  MinuteToHour );
	counter24 HOUR1(   MinuteToHour, afterDetect_RESET, afterDetect_KEY3, Hour,  HourToBuzzer);
	LED_Display LED_SHOW1(clk, Hour,Minute,Second,SEL,DIG);
	
	
//	counter60 SECOND1( _1Hz_clk,      RESET, KEY1, Second,  SecondToMinute);
//	counter60 MINUTE1( SecondToMinute, RESET,KEY2,  Minute,  MinuteToHour );
//	counter24 HOUR1(   MinuteToHour, RESET, KEY3, Hour,  HourToBuzzer);
//	LED_Display LED_SHOW1(clk, Hour,Minute,Second,SEL,DIG);
	
	
	wire [3:0] LED;
	assign LED[0] = ~KEY1;
	assign LED[1] = ~KEY2;
	assign LED[2] = ~KEY3;
	assign LED[3] = ~RESET;	
	
	
	//LED_Display(_1Hz_clk,Hour,Minute,Second,SEL,DIG);
	
//	assign SEL[0] = _1Hz_clk;
//	assign SEL[1] = SecondToMinute;
//	assign DIG = Hour;

endmodule



