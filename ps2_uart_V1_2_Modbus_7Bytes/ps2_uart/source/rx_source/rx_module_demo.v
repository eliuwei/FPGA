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
	 wire [55:0]RX_Data;
	 
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
	 wire [55:0]Output_Data;
	 
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
	 wire [3:0]threeData;
	 wire [3:0]fourData;
	 wire [3:0]fiveData;
	 wire [3:0]sixData;

	//Adress and fnction 
//	assign oneData = Output_Data[3:0];
//	assign twoData = Output_Data[7:4];
//	assign threeData = Output_Data[11:8];
//	assign fourData = Output_Data[15:12];

	
//	assign fiveData = Output_Data[19:16];
//	assign sixData = Output_Data[23:20];

	// DATA	
	assign threeData = Output_Data[11+16:8+16];
	assign fourData = Output_Data[15+16:12+16];
	assign oneData = Output_Data[19+16:16+16];
	assign twoData = Output_Data[23+16:20+16];
	assign fiveData = Output_Data[3+16:0+16];
	assign sixData = Output_Data[7+16:4+16];
	
	//CRC
//	assign oneData = Output_Data[3+40:0+40];
//	assign twoData = Output_Data[7+40:4+40];
//	assign threeData = Output_Data[11+40:8+40];
//	assign fourData = Output_Data[15+40:12+40];

	
	
	LED_Display LED_U
	(
		.clk( CLK ),
		.rst( RSTn ),
		.oneNum(oneData),   
		.twoNum(twoData), 
		.threeNum(threeData), 
		.fourNum(fourData),
		.fiveNum(fiveData),  
		.sixNum(sixData) ,
		.SEL( SEL ),
		.DIG( DIG )
	);
	
	
	 
endmodule
