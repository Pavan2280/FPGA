`timescale 1ns / 1ps
module seven_scroll (
    input wire clk,
    inout wire [2:0] sel,
    output reg [7:0] data
);

parameter N = 100000;
parameter SCROLL_SPEED = 100; // Adjust this value to control scrolling speed
reg [2:0] h;
reg divclk;
reg [31:0] a;
reg [7:0] scroll_counter;

always @(posedge clk) begin
    if (a == N - 1) begin
        a <= 0;
        divclk <= ~divclk;
    end else begin
        a <= a + 1;
    end
end

always @(posedge divclk) begin
    if (scroll_counter == SCROLL_SPEED) begin
        case (h)
            3'b100: h <= 3'b001;
            3'b001: h <= 3'b010;
            3'b010: h <= 3'b100;
            default: h <= 3'b001;
        endcase
        scroll_counter <= 0;
    end else begin
        scroll_counter <= scroll_counter + 1;
    end
end

always @(h) begin
    case (h)
        3'b001: data <= 8'b01101101;// S
        3'b010: data <= 8'b01111001;// E
        3'b100: data <= 8'b01110011;// P
        default: data <= 8'b00000000;
    endcase
end

assign sel = h;

endmodule
