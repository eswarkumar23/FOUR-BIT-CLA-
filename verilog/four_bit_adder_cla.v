module four_bit_adder_cla(
    input wire [3:0] a, 
    input wire [3:0] b, 
    input wire carry,
    output wire [3:0] sum, 
    output wire out_carry
);
    wire p0, p1, p2, p3;
    wire g0, g1, g2, g3;

    xor (p0, a[0], b[0]);
    xor (p1, a[1], b[1]);
    xor (p2, a[2], b[2]);
    xor (p3, a[3], b[3]);

    and (g0, a[0], b[0]);
    and (g1, a[1], b[1]);
    and (g2, a[2], b[2]);
    and (g3, a[3], b[3]);



    wire intermediate_c0;
    and (intermediate_c0, p0, carry_reg);
    or  (c0, intermediate_c0, g0);

    // Stage 2
    wire intermediate_c11, intermediate_c12, inter_c13;
    and (intermediate_c11, intermediate_c0, p1);
    and (intermediate_c12, g0, p1);
    or  (inter_c13, g1, intermediate_c11);
    or  (c1, inter_c13, intermediate_c12);

    // Stage 3
    wire intermediate_c21, intermediate_c22, intermediate_c23, intermediate_c24, inter_c26;
    and (intermediate_c21, p2, intermediate_c11);
    and (intermediate_c22, intermediate_c12, p2);
    and (intermediate_c23, g1, p2);
    or  (intermediate_c24, g2, intermediate_c21);
    or  (inter_c26, intermediate_c24, intermediate_c22);
    or  (c2, inter_c26, intermediate_c23);

    // Stage 4
    wire intermediate_c31, intermediate_c32, intermediate_c33, intermediate_c34;
    wire intermediate_c35, inter_c36, inter_c37;
    and (intermediate_c31, p3, intermediate_c21);
    and (intermediate_c32, intermediate_c22, p3);
    and (intermediate_c33, intermediate_c23, p3);
    and (intermediate_c34, g2, p3);
    or   (intermediate_c35, g3, intermediate_c31);
    or  (inter_c36, intermediate_c35, intermediate_c32);
    or  (inter_c37, inter_c36, intermediate_c33);
    or  (out_carry, inter_c37, intermediate_c34);

    xor (sum[0], p0, carry);
    xor (sum[1], p1, c0);
    xor (sum[2], p2, c1);
    xor (sum[3], p3, c2);

endmodule
