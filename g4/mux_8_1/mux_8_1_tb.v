`default_nettype none
`define DUMPSTR(x) `"mux_8_1_tb.vcd`"
`timescale 100 ns / 10 ns

module mux_8_1_tb();

parameter DURATION = 10;
reg clk = 0;
always #0.5 clk = ~clk;

reg  i0, i1, i2, i3, i4, i5, i6, i7;
reg [0:2] opt0;
wire c0;

mux_8_1 UUT (
           .d0(i0),
           .d1(i1),
           .d2(i2),
           .d3(i3),
           .d4(i4),
           .d5(i5),
           .d6(i6),
           .d7(i7),
	   .opt(opt0),
	   .o0(c0)
           
         );

integer i, j;
reg [7:0] i_b;

initial begin

  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, mux_8_1_tb);
  for (i = 0;i<256 ;i=i+1)
  	begin
  		for(j=0;j<8;j=j+1)
			begin
				i_b = i;
				i0 = i_b[0];
      				i1 = i_b[1];
      				i2 = i_b[2];
      				i3 = i_b[3];
     			 	i4 = i_b[4];
      				i5 = i_b[5];
      				i6 = i_b[6];
      				i7 = i_b[7];
      				opt0 = j;
      				#1;
			end	
  end


    #(DURATION) $display("End of simulation");
   $finish;
end

endmodule
