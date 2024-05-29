module TFF (
    /* input wire clk, */
    input wire T,
    output reg Q
);


always @(T)  begin
    /* case (D)
        1'b0 : Q <=1'b0; 
        1'b1 : Q <=1'b1; 
    endcase; */
    Q <= ~T;


end
endmodule




