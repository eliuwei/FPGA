module ps2_uart 
(
	CLK,RSTn,
	
	RX_Pin_In,
	PS2_CLK_Pin_In, 
	PS2_Data_Pin_In,
	
	TX_Pin_Out,
	LED,
	DIG,SEL

);
	 input CLK;
	 input RSTn;
	 input PS2_CLK_Pin_In, PS2_Data_Pin_In;
	 input RX_Pin_In;
	 
	 output TX_Pin_Out;
	 output [3:0]LED; 
	 output [7:0]DIG;
	 output [5:0]SEL;
	 
	 rx_module_demo RX_U1
	 (
		.CLK( CLK ),
		.RSTn( RSTn ),
		.RX_Pin_In(RX_Pin_In),
		.SEL( SEL ),
		.DIG( DIG )	
	 );
//module rx_module_demo
//(
//    CLK, RSTn,
//	 RX_Pin_In,
//	 DIG,SEL
//);
	
	tx_module_demo TX_U2
	(
		.CLK( CLK ),
		.RSTn( RSTn ),
		.PS2_CLK_Pin_In( PS2_CLK_Pin_In ), 
		.PS2_Data_Pin_In( PS2_Data_Pin_In ),
		.TX_Pin_Out(TX_Pin_Out),
		.LED(LED)
	);
//module tx_module_demo
//(
//    CLK, RSTn,
//	 PS2_CLK_Pin_In, PS2_Data_Pin_In,
//	 TX_Pin_Out,
//	 LED
//);


endmodule

