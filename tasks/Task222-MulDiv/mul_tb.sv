module mul_tb;

parameter N = 4;

//These are unsigned by default
logic [2*N - 1 : 0] Y;
logic [N-1:0] A, B;

//Connect the multiplier
mul m1(Y,A,B);

initial
begin
	//Write test code here
	A = 4'b0011;
	B = 4'b1000;
	#10ps;
	assert(Y == A*B)
		$display("pass");
	else
		$display("fail");
	
end

endmodule