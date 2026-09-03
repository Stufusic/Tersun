#pragma once

#include <string>

namespace setun {

// -----------------------------------------------------------------------------
// Verilog RTL Emitter for TAFPU ALU Hardware IP-Core (Module 4)
// -----------------------------------------------------------------------------
class VerilogEmitter {
public:
    static std::string emit_tafpu_alu_core();
    static std::string emit_btvp_adder_module();
};

} // namespace setun
