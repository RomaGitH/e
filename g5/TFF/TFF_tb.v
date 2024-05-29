
`default_nettype none
`timescale 100 ns / 10 ns

module TFF_tb();

parameter DURATION = 10;
reg clk0 = 0;
always #0.5 clk0 = ~clk0;

reg  t0;
wire q0;

TFF UUT (.clk0(clk0), .D0()

Ra,

S,
 
Rs
 
Q0;
);

integer i;

initial begin
  // Directly specify the VCD file name without using macros
  $dumpfile("TFF_tb.vcd");
  // Dump variables for the jk_tb module
  $dumpvars(0, TFF_tb);
  
  // Simulate some changes
  for (i = 0; i < 2 ; i = i + 1) begin
    
    t0 = i;
    #1;
 //   #10; // Add some delay for simulation to capture waveform changes
  end 
  for (i = 0; i < 2 ; i = i + 1) begin
    
    t0 = i;
    #1;
 //   #10; // Add some delay for simulation to capture waveform changes
  end

  #(DURATION) $display("End of simulation");
  $finish;
end

endmodule


