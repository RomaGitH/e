`default_nettype none
`timescale 1 ns / 100 ps

module tpi_tb();

parameter DURATION = 3000000;
reg clk = 0;
always #41.667 clk = ~clk;

reg Re;
wire speaker;

tpi UUT (.clk(clk), .Re(Re), .speaker(speaker));

initial begin
  $dumpfile("tpi_tb.vcd");
  $dumpvars(0, tpi_tb);
  Re = 1;
  
  
  #(DURATION) $display("End of simulation");
  $finish;
end

endmodule


