module IF_Map_instance(
input clk,
input reset,
input [15:0] Rd_data0,
input [15:0] Rd_data1,
input [15:0] Rd_data2,
input [15:0] Rd_data3,
input [15:0] Rd_data4,
input [15:0] Rd_data5,
input [15:0] Rd_data6,
input [15:0] Rd_data7,
input Reg_loads_i, // register loads
input [2:0] Mux_Sel_i, // Mux selection that gets data in registers
input Local_Reset_i, // to reset unused registers 
output reg [15:0] IF_MAP_Array_i
);
always @(posedge clk or posedge reset)
begin
    if(reset || Local_Reset_i)
        IF_MAP_Array_i <= 16'b0;
        else if (Reg_loads_i)
          begin
            case(Mux_Sel_i)
                3'b000: IF_MAP_Array_i <= Rd_data0;
                3'b001: IF_MAP_Array_i <= Rd_data1;
                3'b010: IF_MAP_Array_i <= Rd_data2;
                3'b011: IF_MAP_Array_i <= Rd_data3;
                3'b100: IF_MAP_Array_i <= Rd_data4;
                3'b101: IF_MAP_Array_i <= Rd_data5;
                3'b110: IF_MAP_Array_i <= Rd_data6;
                3'b111: IF_MAP_Array_i <= Rd_data7;
            endcase
          end   
            else 
                IF_MAP_Array_i <= IF_MAP_Array_i;
end
endmodule
