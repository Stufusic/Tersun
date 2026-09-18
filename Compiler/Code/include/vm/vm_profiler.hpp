#pragma once

#include <cstdint>
#include <cstddef>
#include <array>
#include <string>
#include <vector>
#include <memory>
#include <fstream>
#include "vm/opcode.hpp"

namespace setun {

struct ProfilerConfig {
    bool track_opcodes{true};
    bool track_bigrams{true};
    bool track_stack_rw{true};
    bool track_calls{true};
    bool track_arrays{true};
    bool track_fields{true};
};

class VMProfiler {
public:
    VMProfiler();
    explicit VMProfiler(ProfilerConfig config);

    void reset();

    // Event hooks
    inline void record_opcode(uint8_t op) noexcept {
        if (!config_.track_opcodes) return;
        total_opcodes_++;
        opcode_counts_[op]++;
        if (config_.track_bigrams) {
            if (last_opcode_ != 0xFF) {
                bigram_counts_[last_opcode_][op]++;
            }
            last_opcode_ = op;
        }
    }

    inline void record_stack_read(uint32_t count = 1) noexcept {
        if (config_.track_stack_rw) stack_reads_ += count;
    }

    inline void record_stack_write(uint32_t count = 1) noexcept {
        if (config_.track_stack_rw) stack_writes_ += count;
    }

    inline void record_call(size_t depth) noexcept {
        if (!config_.track_calls) return;
        call_count_++;
        if (depth > max_call_depth_) max_call_depth_ = depth;
    }

    inline void record_return() noexcept {
        if (config_.track_calls) ret_count_++;
    }

    inline void record_array_generic_read() noexcept { array_generic_reads_++; }
    inline void record_array_generic_write() noexcept { array_generic_writes_++; }
    inline void record_array_flat_read() noexcept { array_flat_reads_++; }
    inline void record_array_flat_write() noexcept { array_flat_writes_++; }

    inline void record_field_lookup(bool hit) noexcept {
        if (hit) field_lookups_hit_++;
        else field_lookups_miss_++;
    }

    inline void record_ic_probe(bool hit, bool megamorphic = false) noexcept {
        if (hit) ic_hits_++;
        else ic_misses_++;
        if (megamorphic) ic_megamorphic_fallbacks_++;
    }

    // Accessors
    uint64_t total_opcodes() const noexcept { return total_opcodes_; }
    uint64_t opcode_count(uint8_t op) const noexcept { return opcode_counts_[op]; }
    uint64_t bigram_count(uint8_t op1, uint8_t op2) const noexcept { return bigram_counts_[op1][op2]; }
    uint64_t stack_reads() const noexcept { return stack_reads_; }
    uint64_t stack_writes() const noexcept { return stack_writes_; }
    uint64_t call_count() const noexcept { return call_count_; }
    uint64_t ret_count() const noexcept { return ret_count_; }
    size_t max_call_depth() const noexcept { return max_call_depth_; }

    uint64_t array_generic_reads() const noexcept { return array_generic_reads_; }
    uint64_t array_generic_writes() const noexcept { return array_generic_writes_; }
    uint64_t array_flat_reads() const noexcept { return array_flat_reads_; }
    uint64_t array_flat_writes() const noexcept { return array_flat_writes_; }

    uint64_t ic_hits() const noexcept { return ic_hits_; }
    uint64_t ic_misses() const noexcept { return ic_misses_; }
    uint64_t ic_megamorphic_fallbacks() const noexcept { return ic_megamorphic_fallbacks_; }

    // Serialization & Reporting
    bool dump_profile_json(const std::string& filepath) const;
    std::string to_json() const;
    void print_summary() const;

private:
    ProfilerConfig config_;
    uint8_t last_opcode_{0xFF};
    uint64_t total_opcodes_{0};
    std::array<uint64_t, 256> opcode_counts_{};
    std::vector<std::array<uint64_t, 256>> bigram_counts_;

    uint64_t stack_reads_{0};
    uint64_t stack_writes_{0};

    uint64_t call_count_{0};
    uint64_t ret_count_{0};
    size_t max_call_depth_{0};

    uint64_t array_generic_reads_{0};
    uint64_t array_generic_writes_{0};
    uint64_t array_flat_reads_{0};
    uint64_t array_flat_writes_{0};

    uint64_t field_lookups_hit_{0};
    uint64_t field_lookups_miss_{0};

    uint64_t ic_hits_{0};
    uint64_t ic_misses_{0};
    uint64_t ic_megamorphic_fallbacks_{0};
};

} // namespace setun
