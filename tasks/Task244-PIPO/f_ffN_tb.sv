module d_ffN_tb #(parameter N=8);
logic [N-1:0] Q;
logic [N-1:0] D; 
logic CLK, N_RESET, EN;
logic [N-1:0] LED;

//Power on reset
initial begin
	N_RESET = 0;
	#1ps
	N_RESET = 1;
end

//Clock
initial begin
	CLK = 1;
	repeat(17) 
		#50ps CLK = ~CLK;
end

d_ffN u1(Q, D, CLK, N_RESET, EN);
initial begin

logic word[N-1:0] = {1,1,0,0,1,0,1,0};
@(posedge N_RESET);
@(posedge CLK)

for(int i = 0; i < 8; i++)begin
	@(posedge CLK);
	D = word[i];
end

//Wait for rising edge of clock to observe the last bit
	@(posedge CLK);
	//Wait for the Tpd + 1ps
	#11ps;

	assert (LED == 8'b11001010) $display("PASSED"); else $error("FAILED");
end
endmodule