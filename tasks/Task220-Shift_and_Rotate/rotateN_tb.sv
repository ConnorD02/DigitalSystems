module rotateN_tb;
logic [7:0] X,Y; 
logic DIR;


rotateN #(.N(8)) u1(Y,X,DIR);

initial 
begin

//assign input x to be something and then assign a check of what the output should be or output the result
//set DIR to be 1 for right rotation and 0 for left rotation and then create a small delay 10ps to allow circuit to catch up
//see if output is correct for each type of rotation

	X = 8'b11101000;
	$display("X = %b",X);
	

	DIR = 1;
	#10ps
	$display("Y = %b",Y);

	DIR = 0;
	#10ps
	$display("Y = %b",Y);
end
endmodule

