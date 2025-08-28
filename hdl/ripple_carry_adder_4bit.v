`timescale 1ns/1ps
`default_nettype none

module full_adder(
  input  wire a,
  input  wire b,
  input  wire cin,
  output wire sum,
  output wire cout
);
  assign sum  = a ^ b ^ cin;
  assign cout = (a & b) | (cin & (a ^ b));
endmodule

module ripple_carry_adder_4bit(
  input  wire [3:0] A,
  input  wire [3:0] B,
  input  wire       Cin,
  output wire [3:0] Sum,
  output wire       Cout
);
  wire c1, c2, c3;

  full_adder fa0(.a(A[0]), .b(B[0]), .cin(Cin), .sum(Sum[0]), .cout(c1));
  full_adder fa1(.a(A[1]), .b(B[1]), .cin(c1 ), .sum(Sum[1]), .cout(c2));
  full_adder fa2(.a(A[2]), .b(B[2]), .cin(c2 ), .sum(Sum[2]), .cout(c3));
  full_adder fa3(.a(A[3]), .b(B[3]), .cin(c3 ), .sum(Sum[3]), .cout(Cout));
endmodule

`default_nettype wire
