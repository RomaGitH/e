

`default_nettype none
`timescale 100 ns / 10 ns

module FSM_tb();

parameter DURATION = 10;
reg clk = 0;
always #0.5 clk = ~clk;

reg  Re, w;
wire z, z2, z1 ,z0;

FSM UUT (.clk(clk), .Re(Re), .w(w), .z2(z2), .z1(z1), .z0(z0), .z(z));

integer i;

initial begin
  $dumpfile("FSM_tb.vcd");
  $dumpvars(0, FSM_tb);
  
  #5 Re = 1;
  #3;
  Re = 0;
  #5 Re = 1;
  #1;
  Re = 0;
  #(DURATION) $display("End of simulation");
  $finish;
end

endmodule


