module fsm_mealy_tb;
logic clk, reset, X, Q1, Q2;

fsm_moore u1(clk, reset, X, Q1);
initial begin

end

fsm_mealy u2(clk, reset, X, Q2);
initial begin

end

initial begin
   reset = '0;
   #10ps reset = '1;
end

initial begin

   //Initial value of clock
   clk = '1;

   //Wait to come out of reset
   @(posedge reset);

   //Generate clock
   repeat(20)
      #50ps clk = ~clk;

end
initial begin
	X = 0;
	@(negedge clk);
	@(posedge clk);
	#1ps assert(Q1 == Q2) $display("PASS"); else $error("FAIL Q1 = %d  Q2 = %d",Q1, Q2);

	X = 0;
	@(negedge clk);
	@(posedge clk);
	#1ps assert(Q1 == Q2) $display("PASS"); else $error("FAIL Q1 = %d  Q2 = %d",Q1, Q2);

	X = 0;
	@(negedge clk);
	@(posedge clk);
	#1ps assert(Q1 == Q2) $display("PASS"); else $error("FAIL Q1 = %d  Q2 = %d",Q1, Q2);

	X = 1;
	@(negedge clk);
	@(posedge clk);
	#1ps assert(Q1 == Q2) $display("PASS"); else $error("FAIL Q1 = %d  Q2 = %d",Q1, Q2);

	X = 1;
	@(negedge clk);
	@(posedge clk);
	#1ps assert(Q1 == Q2) $display("PASS"); else $error("FAIL Q1 = %d  Q2 = %d",Q1, Q2);

	X = 0;
	@(negedge clk);
	@(posedge clk);
	#1ps assert(Q1 == Q2) $display("PASS"); else $error("FAIL Q1 = %d  Q2 = %d",Q1, Q2);

	X = 1;
	@(negedge clk);
	@(posedge clk);
	#1ps assert(Q1 == Q2) $display("PASS"); else $error("FAIL Q1 = %d  Q2 = %d",Q1, Q2);

	X = 1;
	@(negedge clk);
	@(posedge clk);
	#1ps assert(Q1 == Q2) $display("PASS"); else $error("FAIL Q1 = %d  Q2 = %d",Q1, Q2);

	
end
endmodule