module DECODE_24(data_in,data_out);
	input[1:0] data_in;
	output[3:0] data_out;
	reg [3:0] data_out;
	
always@(data_in)begin
	case(data_in)
	2'b11:data_out = 4'b0001;
	2'b10:data_out = 4'b0010;
	2'b01:data_out = 4'b0100;
	2'b00:data_out = 4'b1000;
	
	endcase
end

endmodule