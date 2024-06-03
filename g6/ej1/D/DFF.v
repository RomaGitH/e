module DFF (
    input wire clk,
    input wire Re,
    input wire D,
    output reg Q
);

always @(posedge clk or posedge Re) begin
    if (Re) begin
        Q <= 1'b0; // Synchronous reset
    end else begin
        Q <= D;
    end
end
endmodule



