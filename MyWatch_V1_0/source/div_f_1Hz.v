module div_f_1Hz (CLOCK , _1Hz_clk);
	input CLOCK;
	output _1Hz_clk;
	reg _1Hz_clk;
	reg [31:0] counter50M;

	
	always @(negedge CLOCK)
		begin
			if ( counter50M >= (31'd25_000_000-1))    //after dividing frequency,the F_div_f_Hz=50MHz/[2*(25_000_000-1 +1)]
				counter50M <= 0;
			else
				counter50M <= counter50M + 32'd1;	
		end
		
	always @(negedge CLOCK)
			if ( counter50M >= (31'd25_000_000-1))    //after dividing frequency,the F_div_f_Hz=50MHz/[2*(25_000_000-1 +1)]
				_1Hz_clk <= ~_1Hz_clk;
			else
				_1Hz_clk <= _1Hz_clk;
	
	
//	always @(negedge CLOCK)
//		begin
//			if ( counter50M >= (31'd1))    //after dividing frequency,the F_div_f_Hz=50MHz/[2*(25_000_000-1 +1)]
//				counter50M <= 0;
//			else
//				counter50M <= counter50M + 32'd1;	
//		end
//		
//	always @(negedge CLOCK)
//			if ( counter50M >= (31'd1))    //after dividing frequency,the F_div_f_Hz=50MHz/[2*(25_000_000-1 +1)]
//				_1Hz_clk <= ~_1Hz_clk;
//			else
//				_1Hz_clk <= _1Hz_clk;
		
endmodule