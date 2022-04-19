module RAM(dataIn, dataOut, address, writeEnable, clk);

	input [31:0] dataIn;
	output [31:0] dataOut;
	input [7:0] address;
	input writeEnable, clk;
	
	reg [31:0] dataOut;
	reg [31:0] memory [255:0];
	
	always @(posedge clk) begin
		if(writeEnable)
			memory[address] = dataIn;
		dataOut = memory[address];
	end

endmodule
