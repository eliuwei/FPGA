module ps2_tx_control_module
(
    CLK, RSTn,	
	 PS2_Done_Sig,
	 KeyBoardData,
	 TX_Done_Sig,
	 TX_En_Sig, TX_Data
);
    
	 input CLK;
	 input RSTn;
	 input PS2_Done_Sig;
	 input  [7:0]KeyBoardData;
	 input TX_Done_Sig;		 
	 output TX_En_Sig;
	 output [7:0]TX_Data;
	  
	 /***************************/
	 //parameter T1S = 26'd49_999_999;	
//	 parameter T1S = 26'd49_999_999;	
//	 reg [25:0]Count_Sec;
//	 
//	 always @ ( posedge CLK or negedge RSTn )
//	     if( !RSTn )
//		      Count_Sec <= 26'd0;
//		  else if( Count_Sec == T1S )
//		      Count_Sec <= 26'd0;
//		  else
//		      Count_Sec <= Count_Sec + 1'b1;
				
	/********************************/
	
	
	/*********************************/
	
	 reg isEn; 
	 reg [7:0]rData;
	 
	reg [1:0]CurrentState;
	reg [1:0]NextState;	
	
	
	always @ (negedge RSTn or posedge CLK )
		begin		
			if(!RSTn)
				CurrentState <= 2'b00;
//			else	if( PS2_Done_Sig ==1  & TX_Done_Sig==0 )  //S1
//				CurrentState <= 2'b01;
//			else	if( PS2_Done_Sig ==0  & TX_Done_Sig==1 )  //S1
//				CurrentState <= 2'b11;
			else 
				CurrentState <= NextState;
		end
	
	always @ (posedge CLK )
		begin
			rData <= KeyBoardData;
			case(CurrentState)
				2'b00 :   begin
								isEn <= 1'b0;
								if (PS2_Done_Sig ==1  & TX_Done_Sig==0 )
									NextState <= 2'b01;								
							end
				2'b01 :  begin								
								isEn <= 1'b0;
								if( PS2_Done_Sig ==0  & TX_Done_Sig==0 )
									begin
										//isEn <= 1'b1;
										NextState <= 2'b10;
									end
							end
				2'b10 :   begin								
								if(counter == CONSTANT-1 )
									begin
										isEn <= 1'b1;
									end
								else if( PS2_Done_Sig ==0  & TX_Done_Sig==1 )
									begin
										NextState <= 2'b11;
									end
							end
				2'b11 :   begin
								isEn <= 1'b0;
								if( PS2_Done_Sig ==0  & TX_Done_Sig==0 )
									begin
										//isEn <= 1'b0;
										NextState <= 2'b00;
									end
							end
			endcase
		end
	 

		
		/****************************************/

	reg [31:0] counter;
	reg div_clk;
	parameter CONSTANT	= 32'd50_000_000;	
	always @(negedge RSTn or posedge CLK)
	begin
		if (!RSTn)
			counter <= 0;
		else
		begin
			if ( counter >= (CONSTANT-1))    
				counter <= 0;
			else
				counter <= counter + 32'd1;	
		end
	end
		
	always @(negedge	RSTn  or posedge CLK)
	begin
		if(!RSTn)
			div_clk <= 0;
		else
		begin
			if ( counter >= (CONSTANT-1))    
				div_clk <= ~div_clk;
		end
	end
	

		
	
	 /******************************/
	
	 assign TX_Data = rData;
	 assign TX_En_Sig =  isEn;
	
	 /******************************/

endmodule
