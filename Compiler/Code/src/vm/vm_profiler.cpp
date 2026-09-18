#include "vm/vm_profiler.hpp"
#include <iostream>
#include <sstream>
#include <iomanip>
#include <algorithm>

namespace setun {

static std::string format_op_name(uint8_t op) {
    std::string_view sv = opcode_name(static_cast<OpCode>(op));
    if (!sv.empty() && sv != "UNKNOWN") return std::string(sv);
    return "OP_0x" + std::to_string(static_cast<int>(op));
}

VMProfiler::VMProfiler() : config_() {
    bigram_counts_.resize(256);
    reset();
}

VMProfiler::VMProfiler(ProfilerConfig config) : config_(config) {
    bigram_counts_.resize(256);
    reset();
}

void VMProfiler::reset() {
    last_opcode_ = 0xFF;
    total_opcodes_ = 0;
    opcode_counts_.fill(0);
    for (auto& row : bigram_counts_) {
        row.fill(0);
    }
    stack_reads_ = 0;
    stack_writes_ = 0;
    call_count_ = 0;
    ret_count_ = 0;
    max_call_depth_ = 0;
    array_generic_reads_ = 0;
    array_generic_writes_ = 0;
    array_flat_reads_ = 0;
    array_flat_writes_ = 0;
    field_lookups_hit_ = 0;
    field_lookups_miss_ = 0;
    ic_hits_ = 0;
    ic_misses_ = 0;
    ic_megamorphic_fallbacks_ = 0;
}

std::string VMProfiler::to_json() const {
    std::ostringstream oss;
    oss << "{\n";
    oss << "  \"total_opcodes\": " << total_opcodes_ << ",\n";
    oss << "  \"stack_reads\": " << stack_reads_ << ",\n";
    oss << "  \"stack_writes\": " << stack_writes_ << ",\n";
    oss << "  \"call_count\": " << call_count_ << ",\n";
    oss << "  \"ret_count\": " << ret_count_ << ",\n";
    oss << "  \"max_call_depth\": " << max_call_depth_ << ",\n";
    oss << "  \"array_generic_reads\": " << array_generic_reads_ << ",\n";
    oss << "  \"array_generic_writes\": " << array_generic_writes_ << ",\n";
    oss << "  \"array_flat_reads\": " << array_flat_reads_ << ",\n";
    oss << "  \"array_flat_writes\": " << array_flat_writes_ << ",\n";
    oss << "  \"field_lookups_hit\": " << field_lookups_hit_ << ",\n";
    oss << "  \"field_lookups_miss\": " << field_lookups_miss_ << ",\n";
    oss << "  \"ic_hits\": " << ic_hits_ << ",\n";
    oss << "  \"ic_misses\": " << ic_misses_ << ",\n";
    oss << "  \"ic_megamorphic_fallbacks\": " << ic_megamorphic_fallbacks_ << ",\n";

    // Opcode Distribution
    oss << "  \"opcode_distribution\": {\n";
    bool first_op = true;
    for (size_t op = 0; op < 256; ++op) {
        if (opcode_counts_[op] > 0) {
            if (!first_op) oss << ",\n";
            oss << "    \"" << format_op_name(static_cast<uint8_t>(op)) << "\": " << opcode_counts_[op];
            first_op = false;
        }
    }
    oss << "\n  },\n";

    // Top Bigrams for Superinstruction Fusion
    struct BigramEntry {
        uint8_t op1;
        uint8_t op2;
        uint64_t count;
    };
    std::vector<BigramEntry> sorted_bigrams;
    for (size_t op1 = 0; op1 < 256; ++op1) {
        for (size_t op2 = 0; op2 < 256; ++op2) {
            if (bigram_counts_[op1][op2] > 0) {
                sorted_bigrams.push_back({static_cast<uint8_t>(op1), static_cast<uint8_t>(op2), bigram_counts_[op1][op2]});
            }
        }
    }
    std::sort(sorted_bigrams.begin(), sorted_bigrams.end(), [](const auto& a, const auto& b) {
        return a.count > b.count;
    });

    oss << "  \"top_bigrams\": [\n";
    size_t limit = std::min<size_t>(sorted_bigrams.size(), 20);
    for (size_t i = 0; i < limit; ++i) {
        const auto& b = sorted_bigrams[i];
        oss << "    {\"pair\": [\"" << format_op_name(b.op1) << "\", \"" << format_op_name(b.op2) << "\"], \"count\": " << b.count << "}";
        if (i + 1 < limit) oss << ",";
        oss << "\n";
    }
    oss << "  ]\n";
    oss << "}\n";
    return oss.str();
}

bool VMProfiler::dump_profile_json(const std::string& filepath) const {
    std::ofstream ofs(filepath);
    if (!ofs.is_open()) return false;
    ofs << to_json();
    return true;
}

void VMProfiler::print_summary() const {
    std::cout << "\n============================================================\n";
    std::cout << "                 TERSUN VM PROFILING REPORT                 \n";
    std::cout << "============================================================\n";
    std::cout << "  Total Opcodes Executed : " << total_opcodes_ << "\n";
    std::cout << "  Stack Loads (Reads)    : " << stack_reads_ << "\n";
    std::cout << "  Stack Stores (Writes)  : " << stack_writes_ << "\n";
    std::cout << "  Function Calls / Rets  : " << call_count_ << " / " << ret_count_ << "\n";
    std::cout << "  Max Call Stack Depth   : " << max_call_depth_ << "\n";
    std::cout << "  Array Ops (Generic/Flat): " << (array_generic_reads_ + array_generic_writes_)
              << " / " << (array_flat_reads_ + array_flat_writes_) << "\n";
    std::cout << "  Inline Cache (Hits/Miss): " << ic_hits_ << " / " << ic_misses_ << "\n";
    std::cout << "------------------------------------------------------------\n";
    std::cout << "  Top Opcodes:\n";

    std::vector<std::pair<uint8_t, uint64_t>> ops;
    for (size_t i = 0; i < 256; ++i) {
        if (opcode_counts_[i] > 0) {
            ops.push_back({static_cast<uint8_t>(i), opcode_counts_[i]});
        }
    }
    std::sort(ops.begin(), ops.end(), [](const auto& a, const auto& b) { return a.second > b.second; });
    for (size_t i = 0; i < std::min<size_t>(ops.size(), 10); ++i) {
        double pct = total_opcodes_ > 0 ? (100.0 * ops[i].second / total_opcodes_) : 0.0;
        std::cout << "    " << std::setw(20) << std::left << format_op_name(ops[i].first)
                  << ": " << std::setw(12) << std::right << ops[i].second
                  << " (" << std::fixed << std::setprecision(1) << pct << "%)\n";
    }
    std::cout << "============================================================\n";
}

} // namespace setun
