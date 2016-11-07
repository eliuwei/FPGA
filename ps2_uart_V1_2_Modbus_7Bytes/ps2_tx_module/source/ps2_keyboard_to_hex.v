module ps2_keyboard_to_hex
(
    CLK, RSTn,	 
	 PS2_Done_Sig, PS2_Data,	 
	 KeyBoardData,
	 LED	 
);

	 input CLK;
	 input RSTn;
	 input PS2_Done_Sig;
	 input [7:0]PS2_Data;
	 output [7:0]KeyBoardData;
	 output [3:0]LED;
	 
	 
	 reg [7:0]KeyBoardData;
	 always @ ( posedge CLK or negedge RSTn )
	 begin
	     if( !RSTn )
		      begin
				    KeyBoardData <= 8'b0000_0000;
				end
         else if( PS2_Done_Sig )
				begin	
						case( PS2_Data )			
							8'h45:  begin KeyBoardData <= 8'h30;      end  //0
							8'h16:  begin KeyBoardData <= 8'h31;      end  //1
							8'h1E:  begin KeyBoardData <= 8'h32;      end  //2
							8'h26:  begin KeyBoardData <= 8'h33;      end  //3
							8'h25:  begin KeyBoardData <= 8'h34;      end  //4
							8'h2E:  begin KeyBoardData <= 8'h35;      end  //5
							8'h36:  begin KeyBoardData <= 8'h36;      end  //6
							8'h3D:  begin KeyBoardData <= 8'h37;      end  //7
							8'h3E:  begin KeyBoardData <= 8'h38;      end  //8
							8'h46:  begin KeyBoardData <= 8'h39;      end  //9
							
							8'h1C:  begin KeyBoardData <= 8'h41;      end  //a
							8'h32:  begin KeyBoardData <= 8'h42;      end  //b
							8'h21:  begin KeyBoardData <= 8'h43;      end  //c
							8'h23:  begin KeyBoardData <= 8'h44;      end  //d
							8'h24:  begin KeyBoardData <= 8'h45;      end  //e
							8'h2B:  begin KeyBoardData <= 8'h46;      end  //f
							8'h34:  begin KeyBoardData <= 8'h47;      end  //g
							
							8'h33:  begin KeyBoardData <= 8'h48;      end  //h
							8'h43:  begin KeyBoardData <= 8'h49;      end  //i
							8'h3B:  begin KeyBoardData <= 8'h4A;      end  //j
							8'h42:  begin KeyBoardData <= 8'h4B;      end  //k
							8'h4B:  begin KeyBoardData <= 8'h4C;      end  //l
							8'h3A:  begin KeyBoardData <= 8'h4D;      end  //m
							8'h31:  begin KeyBoardData <= 8'h4E;      end  //n
							
							8'h44:  begin KeyBoardData <= 8'h4F;      end  //o
							8'h4D:  begin KeyBoardData <= 8'h50;      end  //p
							8'h15:  begin KeyBoardData <= 8'h51;      end  //q
							8'h2D:  begin KeyBoardData <= 8'h52;      end  //r
							8'h1B:  begin KeyBoardData <= 8'h53;      end  //s
							8'h2C:  begin KeyBoardData <= 8'h54;      end  //t
							
							8'h3C:  begin KeyBoardData <= 8'h55;      end  //u
							8'h2A:  begin KeyBoardData <= 8'h56;      end  //v
							8'h1d:  begin KeyBoardData <= 8'h57;      end //w							 
							8'h22:  begin KeyBoardData <= 8'h58;      end //x							 
							8'h35:  begin KeyBoardData <= 8'h59;		end  //y
							8'h1A:  begin KeyBoardData <= 8'h5A;      end  //z
							//default : KeyBoardData <= 8'h00;
			

						endcase	
				end
	 end
	 
	 reg [3:0]LED;
	 always @ (posedge CLK)
		LED = PS2_Data[3:0];
		
		
		

	 
endmodule 








