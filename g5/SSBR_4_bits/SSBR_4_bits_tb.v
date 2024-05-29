
`default_nettype none
`timescale 100 ns / 10 ns

module SSBR_4_bits_tb();

parameter DURATION = 10;
reg clk0 = 0;
always #0.5 clk0 = ~clk0;

reg  d0, dir;
wire qr, ql;

SSBR_4_bits UUT (.clk(clk0), .D(d0), .dir(dir), .QR(qr), .QL(ql));
integer i;
reg [3:0] i_b;

initial begin
  // Directly specify the VCD file name without using macros
  $dumpfile("SSBR_4_bits_tb.vcd");
  // Dump variables for the jk_tb module
  $dumpvars(0, SSBR_4_bits_tb);
  i_b = 4'b0100;
  dir = 1;
  for (i = 0;i<4 ; i = i+1) begin
    d0 = i_b[i];
    #1;
  end
  dir = 0;
  for (i = 0;i<4 ; i = i+1) begin
    d0 = i_b[i];
    #1;
  end
   dir = 1;
    
  #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
