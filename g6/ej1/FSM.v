`include "D/DFF.v"
module FSM (
    input wire clk,
    input wire Re,
    input wire w,
    output wire z2,
    output wire z1,
    output wire z0,
    output wire z
);

wire Q2, Q1, Q0;
wire D2, D1, D0;

assign D0 = !Q0 + Q2*Q1;
assign D1 = Q1 ^ Q0;
assign D2 = Q2 + Q1*Q0;

DFF DFF0(.clk(clk), .Re(Re),.D(D0), .Q(Q0));
DFF DFF1(.clk(clk), .Re(Re), .D(D1), .Q(Q1));
DFF DFF2(.clk(clk), .Re(Re), .D(D2), .Q(Q2));

assign z2 = Q2;
assign z1 = Q1;
assign z0 = Q0;
    
endmodule