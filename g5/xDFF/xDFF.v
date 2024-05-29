`include "D/DFF.v"
module xDFF (
    input wire clk0,
    input wire D0,
    input wire Ra,
    input wire S,
    input wire Rs,
    input wire en,
    output reg Q0
);

wire tmp_q0;

DFF DFF0 (
    .clk(clk0),
    .D(D0),
    .Q(tmp_q0)
);

always @(posedge clk0 or posedge Ra or posedge S) begin
    if (Ra) begin
        Q0 <= 0; // Asynchronous reset
    end else if (S) begin
        Q0 <= 1; // Asynchronous set
    end else begin
        if (Rs) begin
            Q0 <= 0; // Synchronous reset
        end else begin
            if (en) begin //enable 
                 Q0 <= tmp_q0; // Normal operation     
            end
           end
    end
end

/* 
always @(posedge clk0){
    if(Rs) begin
        Q0 <= 1;
    end else begin
        Q0 <= tmp_q0;
    end
}


always @(posedge Ra) begin
    if (Ra) begin
        Q0 <= 0;
    end
end

always  @(posedge S) begin
    if (S) begin
        Q0 <= 1;
    end
end

 */
 endmodule
