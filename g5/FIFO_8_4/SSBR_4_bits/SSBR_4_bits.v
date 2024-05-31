`include "D/DFF.v"

module SSBR_4_bits (
    input wire clk,
    input wire D,
    input wire dir,
    output wire QL,
    output wire QR
);

wire tmp_q0;
wire tmp_q1;
wire tmp_q2;
wire tmp_q3;


wire mux_out0;
wire mux_out1;
wire mux_out2;
wire mux_out3;

// D flip-flops
DFF DFF_0 (.clk(clk), .D(mux_out0), .Q(tmp_q0));
DFF DFF_1 (.clk(clk), .D(mux_out1), .Q(tmp_q1));
DFF DFF_2 (.clk(clk), .D(mux_out2), .Q(tmp_q2));
DFF DFF_3 (.clk(clk), .D(mux_out3), .Q(tmp_q3));

// Multiplexers to select data based on shift direction
assign mux_out0 = (dir == 1'b0) ? tmp_q1 : D;
assign mux_out1 = (dir == 1'b0) ? tmp_q2 : tmp_q0;
assign mux_out2 = (dir == 1'b0) ? tmp_q3 : tmp_q1;
assign mux_out3 = (dir == 1'b0) ? D: tmp_q2;

assign QL = (dir == 1'b0) ? tmp_q1 : 1'b1;
assign QR = (dir == 1'b0) ?  1'b1 : tmp_q3;

endmodule