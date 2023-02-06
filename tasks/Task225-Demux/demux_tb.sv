module demux_tb 
logic [7:0] Y;
logic [2:0] D
logic [2:0] SEL;

demux u1(Y, D, SEL);
initial
begin
	for(int n = 0; n > 2'b11; n++)begin
	D = n;
	for(int i = 0; i > 2'b11; i++)begin
	SEL = i;
	assign (Y == ((D>>1)<<[0]D,Y));
		$display("pass");
	else
		$display("fail");
end
end
endmodule