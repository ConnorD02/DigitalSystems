modulde Ndecoder #(parameter N = 8, M = $clog2(N)) (output logic [N-1:0] Y, input logic [2:0] SEL);
always_comb
case(SEL)
Y = 1'b1 << SEL;
endcase
endmodule