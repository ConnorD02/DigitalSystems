module srgate_tb

logic Q, notQ, S, R;

srgate(Q, notQ, S, R);

initial

begin

	assert (Q, notQ == 2'b00);
		$display("S = 0, R = 0 pass")