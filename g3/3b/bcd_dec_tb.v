`default_nettype none
`define DUMPSTR(x) `"bcd_dec_tb.vcd`"
`timescale 100 ns / 10 ns

module bcd_dec_tb();

parameter DURATION = 10;
reg clk = 0;
always #0.5 clk = ~clk;

reg [0:3] i0;
wire [0:9] o0;

bcd_dec UUT (
           .i(i0),
           .o(o0)
         );


initial begin

  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, bcd_dec_tb);

  #1 i0 = 0;
  #1 i0 = 1;
  #1 i0 = 2;
  #1 i0 = 3;
  #1 i0 = 4;
  #1 i0 = 5;
  #1 i0 = 6;
  #1 i0 = 7;
  #1 i0 = 8;
  #1 i0 = 9;
    #5

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule