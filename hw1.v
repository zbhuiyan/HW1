module demorgan
(
	input A, //single bit inputs
	input B,

	output nA,
	output nB,
	output AandB, //single bit intermediate output
	output AorB,
	output nAandnB,
	output nAandB, //single bit output ~(A*B)
	output nAorB,
	output nAornB
);


	wire nA;
	wire nB;
	not Ainv(nA, A);
	not Binv(nB, B);

	and andgate(nAandnB, nA, nB);

	wire AandB;
	and andgate(AandB, A, B);
	not AandBinv(nAandB, AandB);

	wire AorB;
	or orgate(AorB, A, B);
	not AorBinv(nAorB, AorB);
	
	or orgate(nAornB, nA, nB);
	


endmodule
