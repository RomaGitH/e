

`default_nettype none
`timescale 100 ns / 10 ns

module DFF_tb();

parameter DURATION = 10;
reg clk0 = 0;
always #0.5 clk0 = ~clk0;

reg  d0;
wire q0;

DFF UUT (.clk(clk0), .D(d0), .Q(q0));

integer i;

initial begin
  // Directly specify the VCD file name without using macros
  $dumpfile("DFF_tb.vcd");
  // Dump variables for the jk_tb module
  $dumpvars(0, DFF_tb);
  
  // Simulate some changes
  for (i = 0; i < 2 ; i = i + 1) begin
    
    d0 = i;
    #1;
 //   #10; // Add some delay for simulation to capture waveform changes
  end

  #(DURATION) $display("End of simulation");
  $finish;
end

endmodule

