module jkff (output logic Q, input logic J, K, CLK)

always @(negedge CLK)
begin
	case({J,K})
	//latching behaviour means that 00 isnt needed
	2'b01 : Q <= 0;
	2'b10 : Q <= 1;
	2'b11 : Q <= ~Q;
endcase
end
endmodule
	