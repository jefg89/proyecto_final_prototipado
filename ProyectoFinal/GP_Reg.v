module GP_Reg(
	input clk,
	input rst_n,
	input read,
	input write,
	input [9:0] address,
	input [31:0] write_data,
	output reg [31:0] read_data,
	output reg[31:0] Q_out,
	output IRQ
);

assign IRQ=Q_out[0];
always @(posedge clk or negedge rst_n)
begin	
	if (!rst_n)
		begin
			Q_out<=32'b0;
		end
	else if (write)
			Q_out<=write_data;
end

always @(posedge clk)
begin
	if (read)
		begin
			read_data<=Q_out;
		end
end
endmodule
