module tb_four_bit_adder_cla;
    reg clk;
    reg [3:0] a, b;
    reg carry;
    wire [3:0] sum;
    wire out_carry;
    wire [3:0] a_reg, b_reg, sum_reg;
    wire carry_reg, out_carry_reg;
    four_bit_register A_reg (.clk(clk), .d(a), .q(a_reg));
    four_bit_register B_reg (.clk(clk), .d(b), .q(b_reg));
    d_flip_flop C_reg (.clk(clk), .d(carry), .q(carry_reg));
    four_bit_adder_cla UUT (
        .a(a_reg), 
        .b(b_reg),
        .carry(carry_reg),
        .sum(sum), 
        .out_carry(out_carry)
    );
    four_bit_register SUM_reg (.clk(clk), .d(sum), .q(sum_reg));
    d_flip_flop COUT_reg (.clk(clk), .d(out_carry), .q(out_carry_reg));
    initial begin
    $dumpfile("waveform.vcd");  
    $dumpvars(0, tb_four_bit_adder_cla); 
    end

    initial begin
      clk = 0;
      a = 4'b0000;
      b = 4'b0000;
      carry = 0;
        $monitor("time=%0t | clock=%b | a=%b | b=%b | carry=%b |out_carry=%b | sum=%b ", 
        $time, clk, a_reg, b_reg, carry, out_carry_reg, sum_reg);
    
        #15 a = 4'b0001; b = 4'b0001; carry = 0;    
        #10                  

        #5 a = 4'b0011; b = 4'b0011; carry = 1;    
        #10 

        #5 a = 4'b0111; b = 4'b0101; carry = 0;
        #10

        #5 a = 4'b1111; b = 4'b0001; carry = 1;
        #10 

        #5 a = 4'b0101; b = 4'b0011; carry = 1;
        #10 
         $finish;
    end
    always #5 clk = ~clk; 
endmodule
