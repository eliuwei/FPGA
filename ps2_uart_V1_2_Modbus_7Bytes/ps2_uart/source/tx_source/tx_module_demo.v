module tx_module_demo
(
    CLK, RSTn,
	 PS2_CLK_Pin_In, PS2_Data_Pin_In,
	 TX_Pin_Out,
	 LED
);

    input CLK;
	 input RSTn;
	 input PS2_CLK_Pin_In, PS2_Data_Pin_In;
	 output TX_Pin_Out;
	 output [3:0]LED;
	 
	 /**************************/
	 wire [7:0]PS2_Data;
	 wire PS2_Done_Sig;
	 ps2_module UUtop
	 (
	     .CLK( CLK ),
		  .RSTn( RSTn ),
		  .PS2_CLK_Pin_In( PS2_CLK_Pin_In ),   // input - from top
		  .PS2_Data_Pin_In( PS2_Data_Pin_In ), // input - from top
		  .PS2_Data( PS2_Data ),               // output -
		  .PS2_Done_Sig( PS2_Done_Sig )        // ouput - 
	 );  	 
	 
	 /************************/
	 wire [7:0]KeyBoardData;
	 ps2_keyboard_to_hex UU0
	(
		.CLK(CLK), 
		.RSTn(RSTn),
		.PS2_Data( PS2_Data ),               
		.PS2_Done_Sig( PS2_Done_Sig ),     
		.KeyBoardData(KeyBoardData),
		.LED(LED)
	);
	 
	 /***************************/	 
	 wire [7:0]TX_Data;
	 wire TX_En_Sig;	 
	 ps2_tx_control_module U1
	 (
	     .CLK( CLK ),
		  .RSTn( RSTn ),
		  .PS2_Done_Sig(PS2_Done_Sig),
		  .KeyBoardData(KeyBoardData),
		  .TX_Done_Sig( TX_Done_Sig ), // input - from U2
		  .TX_En_Sig( TX_En_Sig ),     // output - to U2
		  .TX_Data( TX_Data )         // output - to U2
	 );

	 /****************************/
	
	 wire TX_Done_Sig;
	
	 tx_module U2
	 (
	     .CLK( CLK ),
		  .RSTn( RSTn ),
		  .TX_Data( TX_Data ),         // input - from U1
		  .TX_En_Sig( TX_En_Sig ),     // input - from U1
		  .TX_Done_Sig( TX_Done_Sig ), // output - to U1
		  .TX_Pin_Out( TX_Pin_Out )    // output - to top
	 );
	
	 /*******************************/
	 

endmodule
