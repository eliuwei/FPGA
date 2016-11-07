module ps2_module
(
    CLK, RSTn,
	 PS2_CLK_Pin_In, PS2_Data_Pin_In,
	 PS2_Data, PS2_Done_Sig
);

    input CLK;
	 input RSTn;
	 input PS2_CLK_Pin_In;
	 input PS2_Data_Pin_In;
	 output [7:0]PS2_Data;
	 output PS2_Done_Sig;
	 
	 /********************************/
	 
	 wire H2L_Sig;
	 
 
	 
	 ps2_detect_module U1
	 (
	     .CLK( CLK ),
		  .RSTn( RSTn ),
		  .PS2_CLK_Pin_In( PS2_CLK_Pin_In ),  // input - from top
		  .H2L_Sig( H2L_Sig )	              // output - to U2
	 );
	 
	 /*********************************/

	 ps2_decode_module U2
	 (
	     .CLK( CLK ),
		  .RSTn( RSTn ),
		  .H2L_Sig( H2L_Sig ),                  // input - from U1
		  .PS2_Data_Pin_In( PS2_Data_Pin_In ),  // input - from top
		  .PS2_Data( PS2_Data ),                // output - to top
		  .PS2_Done_Sig( PS2_Done_Sig )         // output - to top
	 );
	 
	 /**********************************/
	 
endmodule
