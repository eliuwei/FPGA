module ps2_detect_module
(
    CLK, RSTn,
	 PS2_CLK_Pin_In,
	 H2L_Sig
);

    input CLK;
	 input RSTn;
	 input PS2_CLK_Pin_In;
	 output H2L_Sig;
	 
	 /**************************/
	 
	 reg H2L_F1;
	 reg H2L_F2;
	 
	 always @ ( posedge CLK or negedge RSTn )
	     if( !RSTn )
		      begin
			       H2L_F1 <= 1'b1;
					 H2L_F2 <= 1'b1;
		      end	
		  else
		      begin
				    H2L_F1 <= PS2_CLK_Pin_In;
					 H2L_F2 <= H2L_F1;
				end
	/*******************************/
	reg [31:0] counter;
	reg div_clk;
	parameter CONSTANT	= 32'd25;	
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


	
	 /****************************/
	 
	 assign H2L_Sig = H2L_F2 & !H2L_F1;
	
	 /****************************/
	 

endmodule
