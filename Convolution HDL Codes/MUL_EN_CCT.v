module MUL_EN_CCT(
input [2:0] F , // Filter Size
input Local_Reset,
output reg [63:0] Mul_en
);
//If Local Reset == 1, I need all Multipliers to produce 0 and disabled
always @(*)
    begin
        case(F)
        3'b000: Mul_en <= {64{~Local_Reset}} & 64'b1;
        3'b001: Mul_en <= {64{~Local_Reset}} & 64'b11_11;
        3'b010: Mul_en <= {64{~Local_Reset}} & 64'b111_111_111;
        3'b011: Mul_en <= {64{~Local_Reset}} & 64'b1111_1111_1111_1111;
        3'b100: Mul_en <= {64{~Local_Reset}} & 64'b11111_11111_11111_11111_11111;
        3'b101: Mul_en <= {64{~Local_Reset}} & 64'b111111_111111_111111_111111_111111_111111;
        3'b110: Mul_en <= {64{~Local_Reset}} & 64'b1111111_1111111_1111111_1111111_1111111_1111111_1111111;
        3'b111: Mul_en <= {64{~Local_Reset}} & 64'b11111111_11111111_11111111_11111111_11111111_11111111_11111111_11111111;
        endcase
    end
endmodule

