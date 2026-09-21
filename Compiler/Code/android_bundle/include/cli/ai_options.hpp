#pragma once

#include <string>
#include <vector>
#include <cstdint>
#include <cstddef>
#include <iostream>
#include "runtime/target_capabilities.hpp"

namespace setun::cli {

enum class TargetBackend : int {
    Auto = 0,
    Scalar = 1,
    AVX2 = 2,
    NEON = 3
};

enum class ProfileMode : int {
    Desktop = 0,
    EdgeStatic = 1
};

struct AIOptions {
    std::string subcommand{"help"};
    std::string model_path{""};
    TargetBackend target{TargetBackend::Auto};
    ProfileMode profile{ProfileMode::Desktop};
    size_t memory_budget_bytes{0}; // 0 = unlimited / desktop default
    int iterations{10000};
    int warmup_iterations{500};
    bool json_output{false};
    std::string vector_path{""};
    std::string export_json{""};

    static AIOptions parse(int argc, char* argv[], int start_idx = 2);
    static void print_help(const char* prog_name = "setunc ai");
    void print_dispatch_plan(const runtime::TargetCapabilities& caps) const;
    std::string target_to_string() const;
    std::string profile_to_string() const;
};

} // namespace setun::cli
