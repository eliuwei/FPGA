module  keyin_detect ( rst, clk, keyin, keyout);
	input rst, clk;
	input keyin;
	output keyout;

	
	reg [31:0] counter50M;
	reg _100Hz_clk;
	always @(negedge rst or negedge clk)
	begin
		if (rst == 0)
			counter50M <= 0;
		else
		begin
			if ( counter50M >= (31'd25_000_0-1))    //after dividing frequency,the F_div_f_Hz=50MHz/[2*(25_000_000-1 +1)]
				counter50M <= 0;
			else
				counter50M <= counter50M + 32'd1;	
		end
	end
		
	always @(negedge rst  or negedge clk)
	begin
		if(rst == 0)
			_100Hz_clk <= 0;
		else
		begin
			if ( counter50M >= (31'd25_000_0-1))    //after dividing frequency,the F_div_f_Hz=50MHz/[2*(25_000_000-1 +1)]
				_100Hz_clk <= ~_100Hz_clk;
			else
				_100Hz_clk <= _100Hz_clk;
		end
	end
	
	
	
	reg out_F1;
	reg out_F2;
	always @(negedge rst or negedge clk)
	begin
		if (!rst)
			out_F1 <= 0;
		else
			out_F1 <= keyin;
	end
	
	always @(negedge rst or negedge _100Hz_clk)
	begin
		if (!rst)
			out_F2 <= 0;
		else
			out_F2 <= out_F1;
	end
	
	assign keyout = out_F2;
	
//	always @(negedge clk)
//	begin
//		if(keyin==0)
//		begin
//			L2H_F1 <= 0;
//		end
//		else if(keyin==1)
//		begin
//			H2L_F1 <= 1;
//		end	
//	end
//	
//	always @(negedge _100Hz_clk)
//	begin
//		L2H_F2 <= L2H_F1;
//		H2L_F2 <= H2L_F2;
//	end
	


	
	
	
endmodule








