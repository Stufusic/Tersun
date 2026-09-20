#pragma once
// ==============================================================================
// Tersun VM/JIT Escape Analysis Subsystem (G6R.2.2)
// Implements Escape State Lattice and Inter-Block SSA Dataflow Analysis
// Conforms to Doc/G6.2.md Sections 21-23 (Phases 2.2-A & 2.2-B)
// ==============================================================================

#include "vm/machine_ir.hpp"
#include <cstdint>
#include <string>
#include <vector>
#include <unordered_map>
#include <unordered_set>
#include <iostream>

namespace setun {

enum class EscapeState : uint8_t {
    NoEscape = 0,     // Object is completely confined to current function/loop. Eligible for SRA/scalarization.
    ArgEscape = 1,    // Object escapes as argument to non-inlinable function call.
    ReturnEscape = 2, // Object is returned from function via RET.
    HeapEscape = 3,   // Object is stored into another heap object, array, or global.
    Unknown = 4       // Indeterminate escape state. DO NOT OPTIMIZE (Mục 23 Doc/G6.2.md).
};

inline const char* to_string(EscapeState state) {
    switch (state) {
        case EscapeState::NoEscape: return "NoEscape";
        case EscapeState::ArgEscape: return "ArgEscape";
        case EscapeState::ReturnEscape: return "ReturnEscape";
        case EscapeState::HeapEscape: return "HeapEscape";
        case EscapeState::Unknown: default: return "Unknown";
    }
}

struct AllocSiteInfo {
    uint32_t site_id{0};
    uint32_t bytecode_ip{0};
    std::string type_name;
    uint32_t field_count{0};
    vreg_t obj_vreg{NO_VREG};
    EscapeState state{EscapeState::Unknown};
    uint64_t alloc_count{1};
    uint64_t allocated_bytes{32};
};

struct EscapeAnalysisResult {
    std::vector<AllocSiteInfo> sites;
    std::unordered_map<vreg_t, EscapeState> vreg_escape_state;
    
    // Census counters conforming to Telemetry Group 10
    uint64_t total_candidates{0};
    uint64_t no_escape_count{0};
    uint64_t arg_escape_count{0};
    uint64_t return_escape_count{0};
    uint64_t heap_escape_count{0};
    uint64_t unknown_escape_count{0};

    [[nodiscard]] bool is_no_escape(vreg_t vreg) const noexcept {
        auto it = vreg_escape_state.find(vreg);
        if (it != vreg_escape_state.end()) {
            return it->second == EscapeState::NoEscape;
        }
        return false;
    }

    void dump(std::ostream& os) const {
        os << "=== Escape Analysis Census ===\n";
        os << "  Total Allocation Candidates: " << total_candidates << "\n";
        os << "  NoEscape Objects           : " << no_escape_count << "\n";
        os << "  ArgEscape Objects          : " << arg_escape_count << "\n";
        os << "  ReturnEscape Objects       : " << return_escape_count << "\n";
        os << "  HeapEscape Objects         : " << heap_escape_count << "\n";
        os << "  Unknown Escape Objects     : " << unknown_escape_count << "\n";
        for (const auto& site : sites) {
            os << "  [Site #" << site.site_id << "] IP=" << site.bytecode_ip 
               << " Type=" << site.type_name << " State=" << to_string(site.state) 
               << " vreg=" << site.obj_vreg << "\n";
        }
    }
};

class EscapeAnalysis {
public:
    static EscapeAnalysisResult analyze(const MIRFunction& func);

private:
    static EscapeState merge_states(EscapeState a, EscapeState b);
};

} // namespace setun
