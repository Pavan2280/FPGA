`timescale 1ns / 1ps

module tb;

	// Inputs
	reg sys_clk;
	reg sys_rst_n;
	reg infrared_in;

	wire led;

	// Instantiate the Unit Under Test (UUT)
	infrared_rcv infrared_rcv_inst (
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .infrared_in(infrared_in),
        .repeat_en(repeat_en),
        .data(data)
    );


	initial begin
		// Initialize Inputs
		sys_clk = 1'b1;
		sys_rst_n <= 1'b0;
		infrared_in <= 1'b1;

		// Wait 100 ns for global reset to finish
		#100;
        sys_rst_n <= 1'b1;

		// Add stimulus here
		#1000
		infrared_in <= 1'b0; #9000000
		infrared_in <= 1'b1; #4500000
		//address code: 8’h99
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//reversed address code: 8’h66
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//address code: 8’h22
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//reversed address code: 8’hdd
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 0
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #560000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//data code: 1
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #1690000
		//repeat code
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1; #42000000
		infrared_in <= 1'b0; #9000000
		infrared_in <= 1'b1; #2250000
		infrared_in <= 1'b0; #560000
		infrared_in <= 1'b1;
	end

	always #10 sys_clk = ~sys_clk;
      
endmodule

