module DFF (
    input wire clk,
    input wire D,
    output reg Q
);


always @(negedge clk)  begin
    /* case (D)
        1'b0 : Q <=1'b0; 
        1'b1 : Q <=1'b1; 
    endcase; */
    Q <= D;


end
endmodule



