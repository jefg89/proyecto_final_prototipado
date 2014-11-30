module top_RN (
	input clk,
	output [7:0] LEDs //
);


wire [31:0] R;
assign LEDs=R[7:0];
wire IRQ;
    SOC u0 (
        .clk_clk                                        (clk),                                        //                                     clk.clk
        .reset_reset_n                                  (1'b1)
    );

endmodule
