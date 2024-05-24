module mux_8_1(
	input wire d0,
	input wire d1,
	input wire d2,
	input wire d3,
	input wire d4,
	input wire d5,
	input wire d6,
	input wire d7,
	input wire [0:2] opt,
	output reg o0 //reg ya que se declara dentro de de un bloque procedural
);

	always @(d0 or d1 or d2 or d3 or d4 or d5 or d6 or d7 or opt)
	begin
		case(opt)
			3'b000 : o0=d0;
			3'b001 : o0=d1;
			3'b010 : o0=d2;
			3'b011 : o0=d3;
			3'b100 : o0=d4;
			3'b101 : o0=d5;
			3'b110 : o0=d6;
			3'b111 : o0=d7;
			default: o0=d0;
		endcase	
	end
endmodule




