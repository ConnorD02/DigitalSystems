module srgate_tb;

logic Q, notQ, S,R; 

srgate u1 (Q, notQ, S, R);

initial

begin

	assert ({Q,notQ} === 2'bxx)		//to test for non binary values, so if theres an output rather than if theres a 1 or a 0
		$display("initial pass");
	else 
		$error("initial fail");
	{S,R} = 2'b00;
	#10ps	
	assert ({Q, notQ} === 2'bxx)
		$display("S = 0, R = 0   PASS");
	else
		$error("S = 0, R = 0   FAIL");
{S,R} = 2'b10;
	#10ps	
	assert ({Q, notQ} == 2'b10)
		$display("S = 1, R = 0   PASS");
	else
		$error("S = 1, R = 0   FAIL");
{S,R} = 2'b01;
	#10ps	
	assert ({Q, notQ} == 2'b01)
		$display("S = 0, R = 1   PASS");
	else
		$error("S = 0, R = 1   FAIL");
{S,R} = 2'b11;
	#10ps	
	assert ({Q, notQ} === 2'bzz)
		$display("S = 1, R = 1   PASS");
	else
		$error("S = 1, R = 1   FAIL");
end
endmodule
