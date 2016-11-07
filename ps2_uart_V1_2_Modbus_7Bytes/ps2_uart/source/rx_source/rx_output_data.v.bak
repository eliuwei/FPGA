module control_module
(
    CLK, RSTn,
	 RX_Done_Sig,
	 RX_Data,
	 RX_En_Sig,
	 Number_Data
);

    input CLK;
	 input RSTn;
	 input RX_Done_Sig;
	 input [7:0]RX_Data;
	 output RX_En_Sig;
	 output [7:0]Number_Data;
	 
	 /******************************/
	 
	 reg [7:0]rData;
	 reg isEn;
	 
    always @ ( posedge CLK or negedge RSTn )
	     if( !RSTn )
		      rData <= 8'd0;
		  else if( RX_Done_Sig )     
		      begin rData <= RX_Data; isEn <= 1'b0; end
		  else isEn <= 1'b1;

	/*********************************/
	
	assign Number_Data = rData;
	assign RX_En_Sig = isEn;
	
	/*********************************/
	 
endmodule
