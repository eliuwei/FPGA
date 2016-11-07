module rx_control_module
(
    CLK, RSTn,
	 H2L_Sig, RX_Pin_In, BPS_CLK, RX_En_Sig,
    Count_Sig, RX_Data, RX_Done_Sig
	 
);

    input CLK;
	 input RSTn;
	 
	 input H2L_Sig;
	 input RX_En_Sig;
	 input RX_Pin_In;
	 input BPS_CLK;
	 
	 output Count_Sig;
	 output [55:0]RX_Data;
	 output RX_Done_Sig;
	 
	 
	 /********************************************************/

	 reg [8:0]i;
	 reg [55:0]rData;
	 reg isCount;
	 reg isDone;
	
	 always @ ( posedge CLK or negedge RSTn )
	     if( !RSTn )
		      begin 
		          i <= 8'd0;
					 rData <= 56'd0;
					 isCount <= 1'b0;
					 isDone <= 1'b0;	 
				end
		  else if( RX_En_Sig )
		      case ( i )
				
//			       8'd0 :
//					 if( H2L_Sig ) begin i <= i + 1'b1; isCount <= 1'b1; end
//					 
//					 8'd1 : 
//					 if( BPS_CLK ) begin i <= i + 1'b1; end					 
//					 				 
//					 
//					 8'd2, 8'd3, 8'd4, 8'd5, 8'd6, 8'd7, 8'd8, 8'd9 :
//					 if( BPS_CLK ) begin i <= i + 1'b1; rData[ i - 2 ] <= RX_Pin_In; end
//					 
//					 8'd10 :
//					 if( BPS_CLK ) begin i <= i + 1'b1; end
//					 
//					 8'd11:
//					 if( BPS_CLK ) begin i <= i + 1'b1; end
//					 
//					 8'd12 :
//					 begin i <= i + 1'b1; isDone <= 1'b0; isCount <= 1'b1; end
//					 
//					 8'd13 :
//					 begin i <= 8'd14; isDone <= 1'b0; end
//					 
//					 
//					 /************************/
//					 8'd14 :
//					 if( H2L_Sig ) begin i <= i + 1'b1; isCount <= 1'b1; end
//					 
//					 8'd15 : 
//					 if( BPS_CLK ) begin i <= i + 1'b1; end					 
//					 
//					 8'd16, 8'd17, 8'd18, 8'd19, 8'd20, 8'd21, 8'd22, 8'd23 :
//					 if( BPS_CLK ) begin i <= i + 1'b1; rData[ i - 16 + 8 ] <= RX_Pin_In; end
//					 
//					 8'd24 :
//					 if( BPS_CLK ) begin i <= i + 1'b1; end
//					 
//					 8'd25:
//					 if( BPS_CLK ) begin i <= i + 1'b1; end
//					 
//					 8'd26 :
//					 begin i <= i + 1'b1; isDone <= 1'b0; isCount <= 1'b1; end
//					 
//					 8'd27 :
//					 begin i <= 8'd28; isDone <= 1'b0; end
//					 
//					 
//					 /******************************/
//					  8'd28 :
//					 if( H2L_Sig ) begin i <= i + 1'b1; isCount <= 1'b1; end
//					 
//					 8'd29 : 
//					 if( BPS_CLK ) begin i <= i + 1'b1; end					 
//					 
//					 8'd30, 8'd31, 8'd32, 8'd33, 8'd34, 8'd35, 8'd36, 8'd37 :
//					 if( BPS_CLK ) begin i <= i + 1'b1; rData[ i - 30 + 16 ] <= RX_Pin_In; end			 		 
//					 
//					 
//					 8'd38 :
//					 if( BPS_CLK ) begin i <= i + 1'b1; end
//					 
//					 8'd39:
//					 if( BPS_CLK ) begin i <= i + 1'b1; end
//					 
//					 8'd40 :
//					 begin i <= i + 1'b1; isDone <= 1'b1; isCount <= 1'b0; end
//					 
//					 8'd41 :
//					 begin i <= 8'd0; isDone <= 1'b0; end

					/**********************************/
					// Adress Byte
			       8'd0 :
						if( H2L_Sig ) begin i <= i + 1'b1; isCount <= 1'b1; end
					 8'd1 : 
						if( BPS_CLK ) begin i <= i + 1'b1; end					 
					 8'd2, 8'd3, 8'd4, 8'd5, 8'd6, 8'd7, 8'd8, 8'd9 :
						if( BPS_CLK ) begin i <= i + 1'b1; rData[ i - 2 ] <= RX_Pin_In; end			 
					 8'd10 :
						if( BPS_CLK ) begin i <= i + 1'b1; end
					 8'd11:
						begin i <= i + 1'b1; end
					 8'd12 :
						begin i <= i + 1'b1; end
					 8'd13 :
						begin i <= 8'd14;  end
					 
					 
					 /*Function************************/
					 8'd14 :
						if( H2L_Sig ) begin i <= i + 1'b1; end					 
					 8'd15 : 
						if( BPS_CLK ) begin i <= i + 1'b1; end					 					 
					 8'd16, 8'd17, 8'd18, 8'd19, 8'd20, 8'd21, 8'd22, 8'd23 :
						if( BPS_CLK ) begin i <= i + 1'b1; rData[ i - 16 + 8 ] <= RX_Pin_In; end					 
					 8'd24 :
						if( BPS_CLK ) begin i <= i + 1'b1; end					 
					 8'd25:
						begin i <= i + 1'b1; end					 
					 8'd26 :
						begin i <= i + 1'b1; end					 
					 8'd27 :
						begin i <= 8'd28; end					 
					 
					 /*** DATA 0 ***************************/
					  8'd28 :
						if( H2L_Sig ) begin i <= i + 1'b1; end					 
					 8'd29 : 
						if( BPS_CLK ) begin i <= i + 1'b1; end					 					 
					 8'd30, 8'd31, 8'd32, 8'd33, 8'd34, 8'd35, 8'd36, 8'd37 :
						if( BPS_CLK ) begin i <= i + 1'b1; rData[ i - 30 + 16 ] <= RX_Pin_In; end			 		 					 					 
					 8'd38 :
						if( BPS_CLK ) begin i <= i + 1'b1; end					 
					 8'd39:
						begin i <= i + 1'b1; end					 
					 8'd40 :
						begin i <= i + 1'b1; end					 
					 8'd41 :
						begin i <= 8'd42; end
					 
					 /*** DATA 1 ***************************/
					  8'd42 :
						if( H2L_Sig ) begin i <= i + 1'b1; end					 
					 8'd43 : 
						if( BPS_CLK ) begin i <= i + 1'b1; end					 					 
					 8'd44, 8'd45, 8'd46, 8'd47, 8'd48, 8'd49, 8'd50, 8'd51 :
						if( BPS_CLK ) begin i <= i + 1'b1; rData[ i - 44 + 24 ] <= RX_Pin_In; end			 		 					 					 
					 8'd52 :
						if( BPS_CLK ) begin i <= i + 1'b1; end					 
					 8'd53:
						begin i <= i + 1'b1; end					 
					 8'd54 :
						begin i <= i + 1'b1; end					 
					 8'd55 :
						begin i <= 8'd56; end
						
					/*** DATA 2 ***************************/
					  8'd56 :
						if( H2L_Sig ) begin i <= i + 1'b1; end					 
					 8'd57 : 
						if( BPS_CLK ) begin i <= i + 1'b1; end					 					 
					 8'd58, 8'd59, 8'd60, 8'd61, 8'd62, 8'd63, 8'd64, 8'd65 :
						if( BPS_CLK ) begin i <= i + 1'b1; rData[ i - 58 + 32 ] <= RX_Pin_In; end			 		 					 					 
					 8'd66 :
						if( BPS_CLK ) begin i <= i + 1'b1; end					 
					 8'd67:
						begin i <= i + 1'b1; end					 
					 8'd68 :
						begin i <= i + 1'b1; end					 
					 8'd69 :
						begin i <= 8'd70; end
					 
					 /*** CRC 0 ***************************/
					  8'd70 :
						if( H2L_Sig ) begin i <= i + 1'b1; end					 
					 8'd71 : 
						if( BPS_CLK ) begin i <= i + 1'b1; end					 					 
					 8'd72, 8'd73, 8'd74, 8'd75, 8'd76, 8'd77, 8'd78, 8'd79 :
						if( BPS_CLK ) begin i <= i + 1'b1; rData[ i - 72 + 40 ] <= RX_Pin_In; end			 		 					 					 
					 8'd80 :
						if( BPS_CLK ) begin i <= i + 1'b1; end					 
					 8'd81:
						begin i <= i + 1'b1; end					 
					 8'd82 :
						begin i <= i + 1'b1; end					 
					 8'd83 :
						begin i <= 8'd84; end
					 
					 
					 
					 
					 
					 /*** CRC 2  ***************************/
					  8'd84 :
						if( H2L_Sig ) begin i <= i + 1'b1; end					 
					 8'd85 : 
						if( BPS_CLK ) begin i <= i + 1'b1; end					 					 
					 8'd86, 8'd87, 8'd88, 8'd89, 8'd90, 8'd91, 8'd92, 8'd93 :
						if( BPS_CLK ) begin i <= i + 1'b1; rData[ i - 86 + 48 ] <= RX_Pin_In; end			 		 					 					 
					 8'd94 :
						if( BPS_CLK ) begin i <= i + 1'b1; end					 
					 8'd95:
						begin i <= i + 1'b1; end					 
					 8'd96 :
						begin i <= i + 1'b1; isDone <= 1'b1; isCount <= 1'b0; end					 
					 8'd97 :
						begin i <= 8'd0; isDone <= 1'b0; end
					 
					 
					 
					 
					 

					 

					



					
				 
				endcase
				
    /********************************************************/
	 
	 assign Count_Sig = isCount;
	 assign RX_Data = rData;
	 assign RX_Done_Sig = isDone;
	 
	 
	 /*********************************************************/
	 
endmodule

