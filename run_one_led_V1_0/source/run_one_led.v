module run_one_led( CLOCK,  LED0);
	input CLOCK;
	output LED0;
	//reg clk_1Hz;
	reg LED0;
	integer counter;
	initial 
	begin
		counter = 0;
	end
			
	always @(negedge CLOCK)
		begin
			if( counter >= 50000000/2)
				begin
					LED0 <= !LED0;
					counter <= 0;
				end
			else 
				counter <= (counter+1);			
		end
		
endmodule
