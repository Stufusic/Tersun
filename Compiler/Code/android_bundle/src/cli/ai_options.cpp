#include "cli/ai_options.hpp"
#include <cstring>
#include <iomanip>
#include <sstream>

namespace setun::cli {

AIOptions AIOptions::parse(int argc, char* argv[], int start_idx) {
    AIOptions opts;
    if (start_idx >= argc) {
        opts.subcommand = "help";
        return opts;
    }

    opts.subcommand = argv[start_idx];
    if (opts.subcommand == "--help" || opts.subcommand == "-h") {
        opts.subcommand = "help";
        return opts;
    }

    for (int i = start_idx + 1; i < argc; ++i) {
        std::string arg = argv[i];

        if (arg.rfind("--target=", 0) == 0) {
            std::string val = arg.substr(9);
            if (val == "auto") opts.target = TargetBackend::Auto;
            else if (val == "scalar") opts.target = TargetBackend::Scalar;
            else if (val == "avx2") opts.target = TargetBackend::AVX2;
            else if (val == "neon") opts.target = TargetBackend::NEON;
            else {
                std::cerr << "Warning: Unknown target backend '" << val << "', falling back to 'auto'\n";
                opts.target = TargetBackend::Auto;
            }
        } else if (arg.rfind("--profile=", 0) == 0) {
            std::string val = arg.substr(10);
            if (val == "desktop") opts.profile = ProfileMode::Desktop;
            else if (val == "edge-static") opts.profile = ProfileMode::EdgeStatic;
            else {
                std::cerr << "Warning: Unknown profile '" << val << "', defaulting to 'desktop'\n";
                opts.profile = ProfileMode::Desktop;
            }
        } else if (arg.rfind("--budget=", 0) == 0) {
            std::string val = arg.substr(9);
            if (val == "128k" || val == "128KB") opts.memory_budget_bytes = 128 * 1024;
            else if (val == "256k" || val == "256KB") opts.memory_budget_bytes = 256 * 1024;
            else if (val == "512k" || val == "512KB") opts.memory_budget_bytes = 512 * 1024;
            else if (val == "1m" || val == "1MB" || val == "1024k") opts.memory_budget_bytes = 1024 * 1024;
            else {
                try {
                    opts.memory_budget_bytes = std::stoull(val);
                } catch (...) {
                    std::cerr << "Warning: Invalid budget '" << val << "'\n";
                }
            }
        } else if (arg.rfind("--iterations=", 0) == 0) {
            opts.iterations = std::stoi(arg.substr(13));
        } else if (arg.rfind("--warmup=", 0) == 0) {
            opts.warmup_iterations = std::stoi(arg.substr(9));
        } else if (arg.rfind("--export=", 0) == 0) {
            opts.export_json = arg.substr(9);
        } else if (arg.rfind("--vectors=", 0) == 0) {
            opts.vector_path = arg.substr(10);
        } else if (arg == "--json") {
            opts.json_output = true;
        } else if (arg.rfind("-", 0) != 0) {
            // Positional parameter: first is model path, second could be iterations if integer
            if (opts.model_path.empty()) {
                // If it's a number and subcommand is benchmark, could be iterations
                bool is_num = !arg.empty();
                for (char c : arg) if (!std::isdigit(c)) is_num = false;
                if (is_num && opts.subcommand == "benchmark") {
                    opts.iterations = std::stoi(arg);
                } else {
                    opts.model_path = arg;
                }
            } else {
                bool is_num = !arg.empty();
                for (char c : arg) if (!std::isdigit(c)) is_num = false;
                if (is_num) {
                    opts.iterations = std::stoi(arg);
                }
            }
        }
    }

    return opts;
}

std::string AIOptions::target_to_string() const {
    switch (target) {
        case TargetBackend::Auto: return "auto";
        case TargetBackend::Scalar: return "scalar";
        case TargetBackend::AVX2: return "avx2";
        case TargetBackend::NEON: return "neon";
    }
    return "unknown";
}

std::string AIOptions::profile_to_string() const {
    switch (profile) {
        case ProfileMode::Desktop: return "desktop";
        case ProfileMode::EdgeStatic: return "edge-static";
    }
    return "unknown";
}

void AIOptions::print_help(const char* prog_name) {
    std::cout << "Usage: " << prog_name << " <profile|inspect|run|benchmark|cross-check> [model.safetensors] [options...]\n\n"
              << "Subcommands:\n"
              << "  profile                      Display host target capabilities and active dispatch plan\n"
              << "  inspect <model.safetensors>  Inspect SafeTensors metadata, shapes, and byte sizes\n"
              << "  run [model.safetensors]      Execute single forward inference with ArgMax prediction\n"
              << "  benchmark [iters] [model]    Run multi-iteration benchmark measuring latency and FPS\n"
              << "  cross-check [model]          Run cross-architecture parity check and dump results\n\n"
              << "Options:\n"
              << "  --target=<auto|scalar|avx2|neon>   Select compute backend (forced modes fail if unsupported)\n"
              << "  --profile=<desktop|edge-static>    Select execution profile (edge-static enables 0-heap arena)\n"
              << "  --budget=<128k|256k|512k|1m>       Set EdgeArena memory capacity (default: 256k for edge)\n"
              << "  --iterations=<N>                   Number of inference iterations (default: 10000)\n"
              << "  --warmup=<N>                       Number of warmup iterations (default: 500)\n"
              << "  --json                             Emit machine-readable JSON output\n"
              << "  --export=<file.json>               Save execution metrics and checksums to JSON file\n";
}

void AIOptions::print_dispatch_plan(const runtime::TargetCapabilities& caps) const {
    std::cout << "Requested target : " << target_to_string() << "\n";
    std::cout << "Detected ISA     : " << caps.arch_name << (caps.has_avx2 ? "+avx2" : (caps.has_neon ? "+neon" : "+scalar")) << "\n";
    std::cout << "Memory Profile   : " << profile_to_string() 
              << (memory_budget_bytes > 0 ? (" (Budget: " + std::to_string(memory_budget_bytes / 1024) + " KB)") : "") << "\n";

    std::cout << "Dispatch plan:\n";
    std::cout << "  K0 (Unpack/Decode) : scalar (LUT-direct)\n";

    if (target == TargetBackend::Scalar || (!caps.has_avx2 && !caps.has_neon)) {
        std::cout << "  K2 (Dot Product)   : scalar\n";
        std::cout << "  K3 (GEMV)          : scalar\n";
        std::cout << "  K5 (GEMM + Bias)   : scalar\n";
        std::cout << "  K6 (Fused Linear)  : scalar\n";
        std::cout << "Fallback status  : " << (target == TargetBackend::Scalar ? "forced_scalar" : "automatic_scalar_fallback") << "\n";
    } else if (target == TargetBackend::AVX2 || (target == TargetBackend::Auto && caps.has_avx2)) {
        std::cout << "  K2 (Dot Product)   : avx2 (256-bit YMM)\n";
        std::cout << "  K3 (GEMV)          : avx2 (multiplication-free)\n";
        std::cout << "  K5 (GEMM + Bias)   : avx2 (fused bias)\n";
        std::cout << "  K6 (Fused Linear)  : avx2 (fused relu)\n";
        std::cout << "Fallback status  : none\n";
    } else if (target == TargetBackend::NEON || (target == TargetBackend::Auto && caps.has_neon)) {
        std::cout << "  K2 (Dot Product)   : neon (128-bit vector)\n";
        std::cout << "  K3 (GEMV)          : neon (multiplication-free)\n";
        std::cout << "  K5 (GEMM + Bias)   : neon (fused bias)\n";
        std::cout << "  K6 (Fused Linear)  : neon (fused relu)\n";
        std::cout << "Fallback status  : none\n";
    }
}

} // namespace setun::cli
