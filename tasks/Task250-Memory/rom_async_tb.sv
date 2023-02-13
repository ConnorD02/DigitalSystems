module rom_async_tb;

parameter DATA_WIDTH = 8, ADDR_WIDTH = 3;
logic [(ADDR_WIDTH-1):0] addr;
logic[(DATA_WIDTH-1):0] q1;
logic[(DATA_WIDTH-1):0] q2;


single_port_rom_async #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH))  u1(addr, q1);
single_port_rom_async2 #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) u2(addr, q2);

initial begin
	for(int n = 0; n < 3'b111; n++)begin
	addr = n;
	#(10ps);
	assert (q1 == q2) $display("PASS"); else $error("FAIL: q1 = %b, q2 = %b", q1,q2);

	end
end

endmodule