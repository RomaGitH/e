module tpi (
    input wire clk,
    input wire Re,
    output reg speaker
);

reg [14:0] counter;
always @(posedge Re ) begin
    counter = 0;
    speaker = 0;
end

always @(posedge clk ) begin
    if (counter == 27272)
        counter <= 0;
    else
       counter <=counter+1;
end

always @(posedge clk ) begin
    if(counter == 27272)
        speaker <= ~speaker;
end
    
endmodule