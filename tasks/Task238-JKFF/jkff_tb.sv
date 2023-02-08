module jkff_tb;

logic Q;
logic J, K;
logic CLK = 0;

jkff u1(Q, J, K, CLK);

initial begin

CLK=0;
     	repeat(20) 
		#50ps CLK = ~CLK;  
end 

initial begin
	
	{J,K} = 2'b01;
	@(negedge CLK);	//Wait for negative edge of clock
	#1 assert(Q == 1) $display("01 PASS"); else $error("01 FAIL");

	{J,K} = 2'b10;
	@(negedge CLK);	//Wait for negative edge of clock
	#1 assert(Q == 0) $display("10 PASS"); else $error("10 FAIL");

	{J,K} = 2'b11;
	@(negedge CLK);	//Wait for negative edge of clock
	#1 assert(Q == ~Q) $display("11 PASS"); else $error("11 FAIL");

	{J,K} = 2'b00;
	@(negedge CLK);	//Wait for negative edge of clock
	#1 assert(Q == Q) $display("00 PASS"); else $error("00 FAIL");
end 
endmodule




