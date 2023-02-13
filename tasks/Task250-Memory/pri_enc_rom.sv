module pri_enc_rom (output logic [2:0] Y, input logic A, B, C);

logic rom [8:0], addr [2:0];
initial
begin

	$readmemb("rom.txt",rom);

assign addr = {A,B,C};
end
assign Y = rom[addr];
endmodule

//module pri_enc_rom_tb;
//output logic [2:0] Y;
//input logic A, B, C;
//
//ex[0 : 3'b111] = {000, 100, 100, 100, 101, 101, 110, 111};