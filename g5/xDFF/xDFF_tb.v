
`default_nettype none
`timescale 100 ns / 10 ns

module xDFF_tb();

parameter DURATION = 10;
reg clk0 = 0;
always #0.5 clk0 = ~clk0;

reg  d0,ra0,s0,rs0;
wire q0;

xDFF UUT (.clk0(clk0), .D0(d0), .Ra(ra0), 
    .S(s0), .Rs(rs0), .Q0(q0));
integer i;

initial begin
  // Directly specify the VCD file name without using macros
  $dumpfile("xDFF_tb.vcd");
  // Dump variables for the jk_tb module
  $dumpvars(0, xDFF_tb);

   for (i = 0; i < 2 ; i = i + 1) begin
    d0 = i;
    #1;
    end
    #2
    ra0 = 1;
    
  #(DURATION) $display("End of simulation");
  $finish;
end

endmodule


