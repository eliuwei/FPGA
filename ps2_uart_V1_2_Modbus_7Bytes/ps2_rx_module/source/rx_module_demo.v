module rx_module_demo
(
    CLK, RSTn,
	 RX_Pin_In,
	 DIG,SEL
);

    input CLK;
	 input RSTn;
	 input RX_Pin_In;
	 
	 output [7:0]DIG;
	 output [5:0]SEL;
	 
	 /**********************************/
	 
	 wire RX_Done_Sig;
	 wire [7:0]RX_Data;
	 
	 rx_module U1
	 (
	     .CLK( CLK ),
		  .RSTn( RSTn ),
		  .RX_Pin_In( RX_Pin_In ),   // input - from top
		  .RX_En_Sig( RX_En_Sig ),   // input - from U2
		  .RX_Done_Sig( RX_Done_Sig ),  // output - to U2
		  .RX_Data( RX_Data )           // output - to U2
	 );
	 
	 /***********************************/
	 
	 wire RX_En_Sig;
	 wire [7:0]Output_Data;
	 
	 rx_output_data U2
	 (
	     .CLK( CLK ),
	     .RSTn( RSTn ),
		  .RX_Done_Sig( RX_Done_Sig ),  // input - from U1
		  .RX_Data( RX_Data ),          // input - from U1
		  .RX_En_Sig( RX_En_Sig ),      // output - to U1
		  .Number_Data( Output_Data )   // output - to top
	 );
	 
	 /***********************************/
	 wire [3:0]oneData;
	 wire [3:0]twoData;
	 wire [3:0]NULL;
	assign oneData = Output_Data[3:0];
	assign twoData = Output_Data[7:4];
	LED_Display LED_U
	(
		.clk( CLK ),
		.rst( RSTn ),
		.oneNum(oneData),   
		.twoNum(twoData), 
		.threeNum(NULL), 
		.fourNum(NULL),
		.fiveNum(NULL),  
		.sixNum(NULL) ,
		.SEL( SEL ),
		.DIG( DIG )
	);
	
	
	 
endmodule
