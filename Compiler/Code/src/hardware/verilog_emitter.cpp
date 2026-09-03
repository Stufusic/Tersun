#include "hardware/verilog_emitter.hpp"
#include <sstream>

namespace setun {

std::string VerilogEmitter::emit_tafpu_alu_core() {
    std::ostringstream oss;
    oss << "// =============================================================================\n";
    oss << "// TAFPU ALU Core - Synthesizable Verilog RTL for FPGA\n";
    oss << "// Architecture for Q(sqrt(3)) Algebraic Arithmetic: X = (A + B*sqrt(3)) * 3^(S/2)\n";
    oss << "// =============================================================================\n\n";

    oss << "module tafpu_alu_core (\n";
    oss << "    input  wire        clk,\n";
    oss << "    input  wire        rst_n,\n";
    oss << "    input  wire [1:0]  op_sel,     // 2'b00: ADD, 2'b01: SUB, 2'b10: MUL\n";
    oss << "    input  wire [63:0] in_a1,\n";
    oss << "    input  wire [63:0] in_b1,\n";
    oss << "    input  wire [31:0] in_s1,\n";
    oss << "    input  wire [63:0] in_a2,\n";
    oss << "    input  wire [63:0] in_b2,\n";
    oss << "    input  wire [31:0] in_s2,\n";
    oss << "    output reg  [63:0] out_a,\n";
    oss << "    output reg  [63:0] out_b,\n";
    oss << "    output reg  [31:0] out_s,\n";
    oss << "    output reg         valid\n";
    oss << ");\n\n";

    oss << "    // Combinational Algebraic Multiplier: (A1*A2 + 3*B1*B2) and (A1*B2 + A2*B1)\n";
    oss << "    wire signed [63:0] s_a1 = in_a1;\n";
    oss << "    wire signed [63:0] s_b1 = in_b1;\n";
    oss << "    wire signed [63:0] s_a2 = in_a2;\n";
    oss << "    wire signed [63:0] s_b2 = in_b2;\n\n";

    oss << "    wire signed [127:0] mul_a1_a2 = s_a1 * s_a2;\n";
    oss << "    wire signed [127:0] mul_b1_b2 = s_b1 * s_b2;\n";
    oss << "    wire signed [127:0] mul_a1_b2 = s_a1 * s_b2;\n";
    oss << "    wire signed [127:0] mul_a2_b1 = s_a2 * s_b1;\n\n";

    oss << "    wire signed [63:0] mul_res_a = mul_a1_a2[63:0] + (3 * mul_b1_b2[63:0]);\n";
    oss << "    wire signed [63:0] mul_res_b = mul_a1_b2[63:0] + mul_a2_b1[63:0];\n\n";

    oss << "    always @(posedge clk or negedge rst_n) begin\n";
    oss << "        if (!rst_n) begin\n";
    oss << "            out_a <= 64'd0;\n";
    oss << "            out_b <= 64'd0;\n";
    oss << "            out_s <= 32'd0;\n";
    oss << "            valid <= 1'b0;\n";
    oss << "        end else begin\n";
    oss << "            valid <= 1'b1;\n";
    oss << "            case (op_sel)\n";
    oss << "                2'b00: begin // ADD\n";
    oss << "                    out_a <= s_a1 + s_a2;\n";
    oss << "                    out_b <= s_b1 + s_b2;\n";
    oss << "                    out_s <= in_s1;\n";
    oss << "                end\n";
    oss << "                2'b01: begin // SUB\n";
    oss << "                    out_a <= s_a1 - s_a2;\n";
    oss << "                    out_b <= s_b1 - s_b2;\n";
    oss << "                    out_s <= in_s1;\n";
    oss << "                end\n";
    oss << "                2'b10: begin // MUL (Exact Q(sqrt(3)))\n";
    oss << "                    out_a <= mul_res_a;\n";
    oss << "                    out_b <= mul_res_b;\n";
    oss << "                    out_s <= in_s1 + in_s2;\n";
    oss << "                end\n";
    oss << "                default: begin\n";
    oss << "                    out_a <= 64'd0;\n";
    oss << "                    out_b <= 64'd0;\n";
    oss << "                    out_s <= 32'd0;\n";
    oss << "                end\n";
    oss << "            endcase\n";
    oss << "        end\n";
    oss << "    end\n\n";
    oss << "endmodule\n";

    return oss.str();
}

std::string VerilogEmitter::emit_btvp_adder_module() {
    std::ostringstream oss;
    oss << "// =============================================================================\n";
    oss << "// BTVP Multi-Trit Full Adder (Table 1 Specification)\n";
    oss << "// =============================================================================\n\n";
    oss << "module btvp_trit_adder (\n";
    oss << "    input  wire signed [1:0] trit_a,    // 2'b11: -1, 2'b00: 0, 2'b01: +1\n";
    oss << "    input  wire signed [1:0] trit_b,\n";
    oss << "    input  wire signed [1:0] carry_in,\n";
    oss << "    output reg  signed [1:0] sum,\n";
    oss << "    output reg  signed [1:0] carry_out\n";
    oss << ");\n\n";
    oss << "    wire signed [3:0] raw_sum = trit_a + trit_b + carry_in;\n\n";
    oss << "    always @(*) begin\n";
    oss << "        case (raw_sum)\n";
    oss << "            -3: begin sum =  0; carry_out = -1; end\n";
    oss << "            -2: begin sum =  1; carry_out = -1; end\n";
    oss << "            -1: begin sum = -1; carry_out =  0; end\n";
    oss << "             0: begin sum =  0; carry_out =  0; end\n";
    oss << "             1: begin sum =  1; carry_out =  0; end\n";
    oss << "             2: begin sum = -1; carry_out =  1; end\n";
    oss << "             3: begin sum =  0; carry_out =  1; end\n";
    oss << "             default: begin sum = 0; carry_out = 0; end\n";
    oss << "        endcase\n";
    oss << "    end\n\n";
    oss << "endmodule\n";
    return oss.str();
}

} // namespace setun
