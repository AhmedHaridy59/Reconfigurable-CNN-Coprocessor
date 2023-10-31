module Out_MUX_IF_Load(
input [2:0] F,
input [63:0] ROM1_out,
input [63:0] ROM2_out,
input [63:0] ROM3_out,
input [63:0] ROM4_out,
input [63:0] ROM5_out,
input [63:0] ROM6_out,
input [63:0] ROM7_out,
input [63:0] ROM8_out,
output reg [63:0] ROM_IFLoad_Out
);

always @(*)
begin
    case (F)
        3'b000: ROM_IFLoad_Out <= ROM1_out;
        3'b001: ROM_IFLoad_Out <= ROM2_out;
        3'b010: ROM_IFLoad_Out <= ROM3_out;
        3'b011: ROM_IFLoad_Out <= ROM4_out;
        3'b100: ROM_IFLoad_Out <= ROM5_out;
        3'b101: ROM_IFLoad_Out <= ROM6_out;
        3'b110: ROM_IFLoad_Out <= ROM7_out;
        3'b111: ROM_IFLoad_Out <= ROM8_out;   
    endcase
end

endmodule