module RAM_testbench();

	reg [31:0] dataIn;
	wire [31:0] dataOut;
	reg [7:0] address;
	reg writeEnable, clk;

	RAM DUT(dataIn, dataOut, address, writeEnable, clk);
	
	initial
		clk = 0;
	
	always
		#5 clk <= ~clk;
	
	initial begin
		#3
		dataIn <= 5;
		address <= 8'b00000000;
		writeEnable <= 0;
		
		#10 writeEnable <= 1;
		
		#10 dataIn <= 6;
		address <= 8'b00000001;
		
		#10 dataIn <= 7;
		address <= 8'b00000010;
		
		#10 writeEnable <= 0;
		address <= 8'b00000000;
		
		#10 address <= 8'b00000010;
		
		#10 writeEnable <= 1;
		dataIn <= 12;
		address <= 8'b10000000;
		
		#10 address <= 8'b00000000;
		dataIn <= 10;
		
		#10 writeEnable <= 0;
		
		#10 $stop;
	end

endmodule
