module lfsr(
 input  clk,
 input  rst_n,
 input read,
 output reg [31:0] read_data
);
reg [7:0] out_data = 8'hff;
wire feedback = ((out_data[7] ^ out_data[3]) ^ (out_data[2] ^ out_data[1])) ;
always @(posedge clk or negedge rst_n)
       if (~rst_n) 
               out_data<= 8'hff;
       else
               out_data<= {out_data[6:0], feedback} ;
always @(posedge clk or negedge rst_n)
       if (~rst_n) 
               read_data<= 32'h00;
       else begin
               if(read) 
                       read_data<= {24'h0,out_data} ;
       end
endmodule