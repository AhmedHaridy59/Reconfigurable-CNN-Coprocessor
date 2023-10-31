module mac (
input wire clock, reset,local_reset ,load,
input [63:0] MUL_EN, 
input [1023:0] IF_map_Out_mac,
input [1023:0] KW_map_Out_mac,
output [31:0] out_of_mac,
output Overflow
);

wire [2047:0] input_of_tree;
wire Overflow_Mul, Overflow_Add;

Multiplication_Circuit  u0 (.clk(clock),.MUL_EN(MUL_EN),.IF_map_Out(IF_map_Out_mac), .KW_map_Out(KW_map_Out_mac),.Mult_out(input_of_tree),.Overflow_Mul(Overflow_Mul));

adder_tree u1( .clk(clock),.reset(reset),.local_reset(local_reset),.load(load),.data_in(input_of_tree), .result(out_of_mac), .Overflow_Add(Overflow_Add));

Overflow_cct Ovr(.clock(clock),.Overflow_Add(Overflow_Add),.Overflow_Mul(Overflow_Mul),.Overflow(Overflow));

endmodule
