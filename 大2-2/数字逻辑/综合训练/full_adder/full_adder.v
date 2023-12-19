module full_adder_1 (
	input A, B,
	input cin,
	output reg sum,
	output reg cout);
	always@(*)
		begin
		sum=cin^A^B;
        cout=A&B|cin&(A^B);
        end
endmodule
module full_adder(
    input [3:0] A, B,
    input cin,
    output wire [3:0] sum ,
    output wire co);
    wire [3:0] cout;
	full_adder_1 add1(
		.cin(cin),
		.A(A[0]),
		.B(B[0]),
		.sum(sum[0]),
		.cout(cout[1])
	);
	full_adder_1 add2(
		.cin(cout[1]),
		.A(A[1]),
		.B(B[1]),
		.sum(sum[1]),
		.cout(cout[2])
	);
	full_adder_1 add3(
		.cin(cout[2]),
		.A(A[2]),
		.B(B[2]),
		.sum(sum[2]),
		.cout(cout[3])
	);
	full_adder_1 add4(
		.cin(cout[3]),
		.A(A[3]),
		.B(B[3]),
		.sum(sum[3]),
		.cout(co)
	);
endmodule


