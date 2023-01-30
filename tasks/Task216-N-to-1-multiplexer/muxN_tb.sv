module muxN_tb;

logic y;
logic [7:0] x;
logic[2:0] ss;

muxN #(.N(8)) u1(y, x, ss);
//reference the component and state how large N is. Include all the variables

initial
begin
	automatic logic expected[8] = {0,0,1,0,0,1,1,0};
//expected values to test against
	x = 8'b01100100;
	for(int n = 0; n < 8; n++)begin
		ss = n;
		//delay
		#10ps;
		//assert is the if statement
		assert(y == expected[n])
		//Note how $display and $error can be used much like printf in C
                	$display("Passed test %d, output=%d, expected=%d", n, y, expected[n]);
		else
                	$error("Error for test %d: expected %d and got %d", n, expected[n], y);		
	end
end
endmodule