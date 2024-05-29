`include "D/DFF.v"

module SPSR_4_bits (
    input wire clk,
    input wire D,
    input wire en,
    output reg Q0,
    output reg Q1,
    output reg Q2,
    output reg Q3
);

wire tmp_q0;
wire tmp_q1;
wire tmp_q2;
wire tmp_q3;

DFF DFF_0 (.clk(clk), .D(D), .Q(tmp_q0));
DFF DFF_1 (.clk(clk), .D(tmp_q0), .Q(tmp_q1));
DFF DFF_2 (.clk(clk), .D(tmp_q1), .Q(tmp_q2));
DFF DFF_3 (.clk(clk), .D(tmp_q2), .Q(tmp_q3));


always @(negedge clk ) begin
    if (en) begin 
        Q0 <= tmp_q0;
        Q1 <= tmp_q1;
        Q2 <= tmp_q2;
        Q3 <= tmp_q3; 
    end
end
endmodule