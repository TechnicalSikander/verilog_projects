`timescale 1ns / 1ps

module counter (
    input wire clk,      // Clock signal
    input wire reset,    // Reset signal
    input wire inc,      // Increment signal
    input wire dec,      // Decrement signal
    output reg [3:0] count // 4-bit counter output
);
reg enable;
reg [3:0]mux_out;

    // Synchronous process triggered by the positive edge of the clock
    always @(*)
    enable =inc|dec;
    always @(*)
    begin
    case(inc)
    1'b0:mux_out=count-1;
    1'b1:mux_out=count+1;
    endcase
    end
    always@(posedge clk)
        if (reset) 
            count <=#1 0;
        else if (enable) 
            count <= #1 mux_out; 

endmodule

