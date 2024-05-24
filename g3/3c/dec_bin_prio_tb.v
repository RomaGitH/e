`default_nettype none
`define DUMPSTR(x) `"dec_bin_prio_tb.vcd`"
`timescale 100 ns / 10 ns

module dec_bin_prio_tb();

parameter DURATION = 10;
reg clk = 0;
always #0.5 clk = ~clk;

reg [0:7] i0;
wire [0:2] o0;

dec_bin_prio UUT (
           .i(i0),
           .o(o0)
         );


initial begin

  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, dec_bin_prio_tb);
    i0 = 0;
  #1 i0[0] = 1;
  #1 i0[1] = 1;
  #1 i0[2] = 1;
  #1 i0[3] = 1;
  #1 i0[4] = 1;
  #1 i0[5] = 1;
  #1 i0[6] = 1;
  #1 i0[7] = 1;
    #5

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule