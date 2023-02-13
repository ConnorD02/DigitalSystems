module parallel_to_serial #(parameter N = 4)(output logic S, input logic shift, CLK, n_Reset, EN, logic [N-1:0] D);

logic [N-1:0] sr;

assign S = sr[0];

always_ff @(posedge CLK, negedge n_Reset) begin
	//Reset takes precedence
	if (n_Reset == 1'b0) begin
		sr = 0;
	end
	else begin
		//Otherwise Q = D (and latches)
		if (EN == 1) 
			if (shift == 1)begin
				sr <= {1'b0, sr[N-1:1]};
			end
		else begin
			sr <= D;
	end
	end
end
	
endmodule