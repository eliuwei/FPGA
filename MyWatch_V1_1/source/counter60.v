module counter60 ( clk, RESET, KEY, count_num, ToCarry);
	input KEY;
	input clk,RESET;
	output [7:0] count_num;
	output ToCarry;
	reg [7:0] count_num;
	reg ToCarry;
	reg counter60_clk;


	
	
	always @(KEY)
	begin
		if(KEY == 0)		
			counter60_clk <= clk ;
		else
			counter60_clk <= ~clk ;	
	end
	
	
	
	
	
	always @(negedge counter60_clk  or negedge RESET)
	begin
		if(!RESET)
			count_num <= 0;
		else if( count_num >= 59)
			count_num <= 0;
		else
			count_num <=count_num + 1;
	end
		
		
		
	always@(negedge counter60_clk  or negedge RESET)
	begin
		if(!RESET)
			ToCarry <= 0;
		else if( count_num == 58)
			ToCarry <= 1;
		else if( count_num == 59)
			ToCarry <= 0;		
		else
			ToCarry <= 0;	
	end
	

	
	
	
	
endmodule




