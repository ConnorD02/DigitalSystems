module pri_enc_rom (output logic [2:0] Y, input logic A, B, C);

logic rom [0:8];
logic addr;
initial
begin

	$readmemb("rom.txt",rom);

assign addr = {A,B,C};
end
assign Y = rom[addr];
endmodule

