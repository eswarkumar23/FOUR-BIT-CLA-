module four_bit_register(input wire clk, input wire [3:0] d, output wire [3:0] q);
    d_flip_flop FF0 (.clk(clk), .d(d[0]), .q(q[0]));
    d_flip_flop FF1 (.clk(clk), .d(d[1]), .q(q[1]));
    d_flip_flop FF2 (.clk(clk), .d(d[2]), .q(q[2]));
    d_flip_flop FF3 (.clk(clk), .d(d[3]), .q(q[3]));
endmodule