`include "sum_1_bit/sum_1_bit.v"    
`include "sub_1_bit/sub_1_bit.v"    
`include "mux_8_1/mux_8_1.v"    

module alu_1_bit (
    input wire A,
    input wire B,
    input wire Cin,
    input wire [0:2]Op,
    output wire O,
    output wire Z,
    output wire P,
    output wire Cout
);
    
wire suma_s, suma_c_out, resta_d, resta_b_out;
wire and_ab, or_ab, not_a;
wire tmp_o, tmp_c_out;

assign and_ab = A & B;
assign or_ab = A | B;
assign not_a = ~A;

sum_1_bit sum_1_bit_0(
    .A(A),
    .B(B),
    .Cin(Cin),
    .S(suma_s),
    .Cout(suma_c_out)
);

sub_1_bit sub_1_bit_0(
    .A(A),
    .B(B),
    .Bin(Cin),
    .D(resta_d),
    .Bout(resta_b_out)
);

mux_8_1 mux_8_1_o(
    .d0(1'b0),
    .d1(suma_s),
    .d2(resta_d),
    .d3(1'b0),
    .d4(or_ab),
    .d5(and_ab),
    .d6(not_a),
    .d7(1'b0),
    .opt(Op),
    .o0(tmp_o)

);
mux_8_1 mux_8_1_c(
    .d0(1'b0),
    .d1(suma_c_out),
    .d2(resta_b_out),
    .d3(1'b0),
    .d4(1'b0),
    .d5(1'b0),
    .d6(1'b0),
    .d7(1'b0),
    .opt(Op),
    .o0(tmp_c_out)
);

assign O = tmp_o;
assign Cout = tmp_c_out;
assign P = tmp_o ^ 1'b0;
assign Z =  ~tmp_o;


endmodule
