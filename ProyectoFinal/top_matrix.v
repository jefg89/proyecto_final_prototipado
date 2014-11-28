module top_matrix (
	input clk,
	output [7:0] LEDs
);


wire [31:0] R;
assign LEDs=R[7:0];
wire IRQ;
    soc_matrix u0 (
        .clk_clk                                        (clk),                                        //                                     clk.clk
        .reset_reset_n                                  (1'b1),                                  
           .general_purpuose_register_0_conduit_end_1_export (R)  // general_purpuose_register_0_conduit_end.export
    );

endmodule
