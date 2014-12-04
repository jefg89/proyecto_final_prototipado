module testCyclone4(
input clk,
input reset_n
);

    SoC u0 (
        .clk_clk       (clk),       //   clk.clk
        .reset_reset_n (reset_n)  // reset.reset_n
    );

endmodule
