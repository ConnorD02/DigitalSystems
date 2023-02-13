module pri_enc_rom_tb;
logic [2:0] Y;
logic A, B, C;


pri_enc_rom u1(Y, A, B, C);
initial begin

logic ex[0 : 7] = {000, 100, 100, 100, 101, 101, 110, 111};

for(int n = 0; n < 7; n++)begin
	{A,B,C} = n;
	assert (Y == ex[n]); $display("PASS"); $error ("FAIL Y = %b, ex = %b", Y, ex[n]);
end
end
endmodule