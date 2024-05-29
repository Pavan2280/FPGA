`timescale 1ns / 1ps

module LCD (
    input wire clk,            
    output reg lcd_rw,         
    output reg lcd_e,          
    output reg lcd_rs,      
    output reg [7:0] data      
);

parameter N = 22;
reg [7:0] datas [1:N]; //N blocks will be created starting from 1 to N each of size 8 bits

initial begin
    datas[1]  = 8'h38;  //2 lines and 5×7 matrix
    datas[2]  = 8'h0c;  //Display ON, cursor OFF
    datas[3]  = 8'h06;	//Increment cursor (shift cursor to right)
    datas[4]  = 8'h01;	//Clear display screen
    datas[5]  = 8'h80;	//Force cursor to beginning of First line
    datas[6]  = 8'h4C;	//L
    datas[7]  = 8'h43;	//C	
    datas[8]  = 8'h44;	//D
    datas[9]  = 8'h20;	//Space
    datas[10] = 8'h44;	//D
    datas[11] = 8'h49;	//I
	 datas[12] = 8'h53;	//S
    datas[13] = 8'h50;	//P
    datas[14] = 8'h4C;	//L
    datas[15] = 8'h41;	//A
    datas[16] = 8'h59;	//Y
	 datas[17] = 8'h20;	//k
	 datas[18] = 8'h20;	//k
	 datas[19] = 8'h20;	//k
	 datas[20] = 8'h20;	//k
	 datas[21] = 8'h20;	//k
    end

reg [31:0] i = 0;
reg [4:0] j = 1;

always @(posedge clk) 
begin
    if (i <= 1000000) 
	 begin
        i <= i + 1;
        lcd_e <= 1'b1;
        data <= datas[j];
    end
    else if (i > 1000000 && i < 2000000) begin
        i <= i + 1;
        lcd_e <= 1'b0;
    end
    else if (i == 2000000) 
	 begin
        j <= j + 1;
        i <= 0;
    end

    if (j <= 5) 
	 begin
        lcd_rs <= 1'b0; // command signal
    end
    else if (j > 5) 
	 begin
        lcd_rs <= 1'b1; // data signal
    end

    if (j == 22) 
	 begin
        j <= 5;
    end

    lcd_rw <= 1'b0; // lcd write
end

endmodule
