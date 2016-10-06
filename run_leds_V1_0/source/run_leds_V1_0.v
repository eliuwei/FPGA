module run_leds_V1_0(CLOCK,LED);
	input CLOCK;
	output [3:0] LED;
	reg [3:0] LED;
	
	reg [31:0] counter1;
	reg [9:0] counter2;
	reg _1kHz_clk;
	
	initial
		begin
			counter1 = 0;
			counter2 = 0;
			_1kHz_clk = 1;
		end
	
	always @( negedge CLOCK)
		begin
			if (counter1 >= 32'd50_000/2)
				begin
					_1kHz_clk <= !_1kHz_clk;
					counter1 <= 0;
				end
			else
				counter1 <= counter1 + 1;			
		end
	
	always @(negedge _1kHz_clk)
		begin
			if(counter2 >= 1000)
				begin
					counter2 <= 0;
				end
			else
				begin
				if( counter2>=0 && counter2<250)
					LED <= 4'b0001;
				else if( counter2>=250 && counter2<500)
					LED <= 4'b0010;
				else if( counter2>=500 && counter2<750)
					LED <= 4'b0100;
				else
					LED <= 4'b1000;
				counter2 <= counter2 + 1;	
				end		
		end		
endmodule
	
	
	

