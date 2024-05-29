`default_nettype none
`timescale 100 ns / 10 ns

module JKFF_tb();

parameter DURATION = 10;
reg clk0 = 0;
always #0.5 clk0 = ~clk0;

reg  j0, k0;
wire q0;

JKFF UUT (.clk(clk0), .K(k0), .J(j0), .Q(q0));

integer i;
reg [1:0] i_b;

initial begin
  // Directly specify the VCD file name without using macros
  $dumpfile("JKFF_tb.vcd");
  // Dump variables for the jk_tb module
  $dumpvars(0, JKFF_tb);
  
  // Simulate some changes
  for (i = 0; i < 4 ; i = i + 1) begin
    i_b = i;
    j0 = i_b[1];
    k0 = i_b[0];
    #1;
 //   #10; // Add some delay for simulation to capture waveform changes
  end

  #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
