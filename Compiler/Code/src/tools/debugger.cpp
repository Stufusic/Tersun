#include "tools/debugger.hpp"
#include <iostream>
#include <iomanip>
#include <cmath>

namespace setun {
namespace tools {

void VisualDebugger::add_breakpoint(size_t pc) {
    breakpoints_.insert(pc);
}

void VisualDebugger::remove_breakpoint(size_t pc) {
    breakpoints_.erase(pc);
}

bool VisualDebugger::has_breakpoint(size_t pc) const {
    return breakpoints_.find(pc) != breakpoints_.end();
}

DebuggerState VisualDebugger::inspect_vm_state(const VM& vm) {
    DebuggerState state;
    state.pc = vm.ip();
    state.branch3_flag = 0;

    auto regs = vm.tafpu_registers();
    state.tafpu_a = regs[0].a;
    state.tafpu_b = regs[0].b;
    state.tafpu_s = regs[0].s;
    state.current_instruction = "OP_EXEC (PC: " + std::to_string(state.pc) + ")";
    return state;
}

void VisualDebugger::print_visual_panel(const DebuggerState& state) {
    double approx = (state.tafpu_a + state.tafpu_b * std::sqrt(3.0)) * std::pow(std::sqrt(3.0), state.tafpu_s);

    std::cout << "\n==================== [Setun-70 Visual Debugger] ====================\n";
    std::cout << " PC: 0x" << std::hex << std::setw(4) << std::setfill('0') << state.pc << std::dec
              << " | Instruction: " << state.current_instruction << "\n";
    std::cout << "--------------------------------------------------------------------\n";
    std::cout << " [3-Way Branch Flag] : ";
    if (state.branch3_flag == -1) {
        std::cout << "[-] NEGATIVE (-1) => Route Arm 1\n";
    } else if (state.branch3_flag == 0) {
        std::cout << "[0] ZERO     ( 0) => Route Arm 2\n";
    } else {
        std::cout << "[+] POSITIVE (+1) => Route Arm 3\n";
    }
    std::cout << " [TAFPU Register]    : [" << state.tafpu_a << ", " << state.tafpu_b << ", " << state.tafpu_s 
              << "] in Q(√3) (Exact: " << state.tafpu_a << " + " << state.tafpu_b << "*√3, ≈ " << approx << ")\n";
    std::cout << "====================================================================\n\n";
}

bool VisualDebugger::start_session(const std::string& bytecode_path) {
    Chunk chunk;
    if (!Chunk::load_from_file(bytecode_path, chunk)) {
        std::cerr << "[Debugger Error]: Unable to load bytecode from " << bytecode_path << "\n";
        return false;
    }

    VM vm;
    std::cout << "[Debugger] Session started for " << bytecode_path << ". Total bytecode: " << chunk.code.size() << " bytes.\n";
    std::cout << "Commands: (r)un, (p)rint state, (b)reak <pc>, (q)uit\n";

    DebuggerState state = inspect_vm_state(vm);
    print_visual_panel(state);

    std::string cmd;
    while (std::cout << "(setundbg) " && std::cin >> cmd) {
        if (cmd == "q" || cmd == "quit") {
            break;
        } else if (cmd == "r" || cmd == "run") {
            vm.run(chunk);
            std::cout << "[Debugger] Program finished execution.\n";
            state = inspect_vm_state(vm);
            print_visual_panel(state);
            break;
        } else if (cmd == "p" || cmd == "print") {
            state = inspect_vm_state(vm);
            print_visual_panel(state);
        } else if (cmd == "b" || cmd == "break") {
            size_t bp = 0;
            if (std::cin >> bp) {
                add_breakpoint(bp);
                std::cout << "[Debugger] Breakpoint registered at PC: 0x" << std::hex << bp << std::dec << "\n";
            }
        } else {
            std::cout << "Available commands: run, print, break <pc>, quit\n";
        }
    }
    return true;
}

} // namespace tools
} // namespace setun
