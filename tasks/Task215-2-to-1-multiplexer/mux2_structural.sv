module mux2_structural (output logic y, input logic a, b, s);

// Write HDL here
wire Sw, Aw, U1, U2;

not Sinv(Sw, s);
and SA(U1, a, Sw);
and SB(U2, b, s);
or mux(y, U1, U2);

endmodule