module d_ffN_tb #(parameter N=8);
logic [N-1:0] Q;
logic [N-1:0] D; 
logic CLK, N_RESET, EN;
logic [N-1:0] LED;

//Clock
initial begin
	CLK = 1;
	repeat(20) 
		#50ps CLK = ~CLK;
end

d_ffN u1(Q, D, CLK, N_RESET, EN);
initial begin

D = 0;
	N_RESET = 0;
	#10ps;
	N_RESET = 1;

	//Test for when D = 1
	@(negedge CLK);	//Wait for negative edge of clock
	D[0] = 1;		//Set D = 1
	@(posedge CLK);	//Wait for positive edge of clock
	#10 assert(Q[0] == D[0]) $display("PASS"); else $error("FAIL");	//Check Q

	//Test for when D = 0
	@(negedge CLK);	//Wait for negative edge of clock
	D[0] = 0;		//Set D = 0
	@(posedge CLK);	//Wait for negative edge of clock
	#10 assert(Q == D[0]) $display("PASS"); else $error("FAIL");	//Check Q

	//Test reset when D = 1
	@(negedge CLK);	//Wait for negative edge of clock
	D[0] = 1;		//Set D = 1
	@(posedge CLK);	//Wait for positive edge of clock
	#10 assert(Q[0] == D[0]) $display("PASS"); else $error("FAIL");	//Check Q
	#10ps;	
	N_RESET = 0;
	#15ps;
	N_RESET = 1;
	#10 assert(Q[0] == 0) $display("RESET PASS"); else $error("RESET FAIL");	//Check Q

	//Test D is ignored when reset
	@(negedge CLK);	//Wait for negative edge of clock
	D[0] = 0;
	@(posedge CLK);	//Wait for positive edge of clock
	@(negedge CLK);	//Wait for negative edge of clock
	N_RESET = 0;
	D[0] = 1;
	@(posedge CLK);	//Wait for positive edge of clock
	#10 assert(Q[0] == 0) $display("RESET PASS"); else $error("RESET FAIL");	//Check Q
	@(negedge CLK);	//Wait for negative edge of clock
	N_RESET = 1;
	@(posedge CLK);	//Wait for positive edge of clock
	@(negedge CLK);	//Wait for negative edge of clock

end

//always @(negedge N_RESET) begin
//	#1 assert(Q == 0) $display("RESET PASS"); else $error("RESET FAIL");	//Check Q
//	
//end

endmodule
