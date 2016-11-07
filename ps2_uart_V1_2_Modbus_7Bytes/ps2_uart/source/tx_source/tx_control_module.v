module tx_control_module
(
    CLK, RSTn,
	 TX_En_Sig, TX_Data, BPS_CLK, 
    TX_Done_Sig, TX_Pin_Out
	 
);

    input CLK;
	 input RSTn;
	 
	 input TX_En_Sig;
	 input [7:0]TX_Data;
	 input BPS_CLK;
	 
	 output TX_Done_Sig;
	 output TX_Pin_Out;
	 
	 /********************************************************/

	 reg [7:0]i;
	 reg rTX;
	 reg isDone;
	
	 always @ ( posedge CLK or negedge RSTn )
	     if( !RSTn )
		      begin
		          i <= 4'd0;
					 rTX <= 1'b1;
					 isDone 	<= 1'b0;
				end
		  else if( TX_En_Sig )
		      case ( i )
				
					//  Address=02   ****************
			       8'd0 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b0; end	
						
					 8'd1 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b0; end
					 8'd2 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b1; end	
					 8'd3 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b0; end
					 8'd4 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b0; end

					 8'd5, 8'd6, 8'd7, 8'd8 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b0; end
					 8'd9 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b1; end	
						
					//  Function = 02   ****************
			       8'd10 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b0; end	
						
					 8'd11 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b0; end
					 8'd12 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b1; end	
					 8'd13 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b0; end
					 8'd14 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b0; end

					 8'd15, 8'd16, 8'd17, 8'd18 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b0; end
					 8'd19 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b1; end						
						
						
					 //  DATA 2   ****************
			       8'd20 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b0; end			 
					 8'd21, 8'd22, 8'd23, 8'd24, 8'd25, 8'd26, 8'd27, 8'd28 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b0; end				 
					 8'd29 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b1; end		

					 //  DATA 1   ****************
			       8'd30 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b0; end			 
					 8'd31, 8'd32, 8'd33, 8'd34, 8'd35, 8'd36, 8'd37, 8'd38:
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b0; end				 
					 8'd39 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b1; end
						
					 //  DATA 0   ****************
			       8'd40 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b0; end			 
					 8'd41, 8'd42, 8'd43, 8'd44, 8'd45, 8'd46, 8'd47, 8'd48:
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= TX_Data[ i - 41 ]; end				 
					 8'd49 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b1; end
					
					 //  CRC 1   ****************
			       8'd50 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b0; end			 
					 8'd51, 8'd52, 8'd53, 8'd54, 8'd55, 8'd56, 8'd57, 8'd58:
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b1; end				 
					 8'd59 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b1; end
					
					 
					 
					 //  CRC 0   ****************
			       8'd60 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b0; end			 
					 8'd61, 8'd62, 8'd63, 8'd64, 8'd65, 8'd66, 8'd67, 8'd68 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b0; end				 
					 8'd69 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b1; end				 			 
					 8'd70 :
						if( BPS_CLK ) begin i <= i + 1'b1; rTX <= 1'b1; end				 
					 8'd71 :
						if( BPS_CLK ) begin i <= i + 1'b1; isDone <= 1'b1; end
					 8'd72 :
						begin i <= 8'd0; isDone <= 1'b0; end
					 
					 
					 
					 
					 
					 
				 
				endcase
				
    /********************************************************/
	 
	 assign TX_Pin_Out = rTX;
	 assign TX_Done_Sig = isDone;
	 
	 /*********************************************************/
	 
endmodule

