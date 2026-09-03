#pragma once

#include "vm/vm.hpp"
#include <string>
#include <vector>
#include <unordered_set>

namespace setun {
namespace tools {

struct DebuggerState {
    size_t pc{0};
    int8_t branch3_flag{0}; // -1, 0, +1
    int64_t tafpu_a{0};
    int64_t tafpu_b{0};
    int32_t tafpu_s{0};
    std::string current_instruction;
};

class VisualDebugger {
public:
    VisualDebugger() = default;

    void add_breakpoint(size_t pc);
    void remove_breakpoint(size_t pc);
    bool has_breakpoint(size_t pc) const;

    DebuggerState inspect_vm_state(const VM& vm);
    void print_visual_panel(const DebuggerState& state);

    bool start_session(const std::string& bytecode_path);

private:
    std::unordered_set<size_t> breakpoints_;
};

} // namespace tools
} // namespace setun
