#pragma once

#include <cstdint>
#include <chrono>
#include <iostream>

#if defined(_WIN32)
#include <windows.h>
#include <psapi.h>
#pragma comment(lib, "psapi.lib")
#elif defined(__linux__)
#include <sys/resource.h>
#include <unistd.h>
#endif

namespace setun {

struct VMMemoryMetrics {
    size_t current_rss_bytes{0};
    size_t peak_rss_bytes{0};
    size_t peak_stack_depth{0};
    int64_t elapsed_us{0};

    static VMMemoryMetrics capture(size_t stack_depth = 0) {
        VMMemoryMetrics m;
        m.peak_stack_depth = stack_depth;

#if defined(_WIN32)
        PROCESS_MEMORY_COUNTERS info;
        if (GetProcessMemoryInfo(GetCurrentProcess(), &info, sizeof(info))) {
            m.current_rss_bytes = info.WorkingSetSize;
            m.peak_rss_bytes = info.PeakWorkingSetSize;
        }
#elif defined(__linux__)
        struct rusage usage;
        if (getrusage(RUSAGE_SELF, &usage) == 0) {
            m.peak_rss_bytes = static_cast<size_t>(usage.ru_maxrss) * 1024;
            m.current_rss_bytes = m.peak_rss_bytes;
        }
#endif
        return m;
    }

    double current_rss_mb() const {
        return static_cast<double>(current_rss_bytes) / (1024.0 * 1024.0);
    }

    double peak_rss_mb() const {
        return static_cast<double>(peak_rss_bytes) / (1024.0 * 1024.0);
    }
};

class VMTimer {
public:
    VMTimer() : start_(std::chrono::steady_clock::now()) {}

    void reset() {
        start_ = std::chrono::steady_clock::now();
    }

    int64_t elapsed_us() const {
        auto end = std::chrono::steady_clock::now();
        return std::chrono::duration_cast<std::chrono::microseconds>(end - start_).count();
    }

    double elapsed_ms() const {
        return static_cast<double>(elapsed_us()) / 1000.0;
    }

private:
    std::chrono::time_point<std::chrono::steady_clock> start_;
};

struct VMProfilerBreakdown {
    std::string function_name{"main"};
    uint64_t total_dispatches{0};
    uint64_t total_opcodes{0};
    uint64_t basic_block_count{0};
    uint64_t loop_backedge_count{0};
    uint64_t function_entries{0};
    uint64_t heap_allocations{0};
    uint64_t heap_bytes_allocated{0};
    uint64_t boxing_ops{0};
    uint64_t unboxing_ops{0};

    // Time metrics (microseconds)
    double t_dispatch_us{0.0};
    double t_opcode_exec_us{0.0};
    double t_allocation_us{0.0};
    double t_boxing_us{0.0};
    double t_call_overhead_us{0.0};
    double t_loop_overhead_us{0.0};
    double t_total_runtime_us{0.0};

    // Opcode histogram
    uint64_t op_load_local{0};
    uint64_t op_store_local{0};
    uint64_t op_add{0};
    uint64_t op_mul{0};
    uint64_t op_other{0};

    void print_breakdown(std::ostream& os = std::cout) const {
        os << "\n===================================================================\n";
        os << "  GATE 5 PROFILER BREAKDOWN: Function: " << function_name << "\n";
        os << "-------------------------------------------------------------------\n";
        double total = (t_total_runtime_us > 0.0) ? t_total_runtime_us : 1.0;
        auto pct = [&](double v) -> double { return (v / total) * 100.0; };

        os << "  Total Execution Time   : " << t_total_runtime_us << " us\n";
        os << "  Total Bytecode Dispatch: " << total_dispatches << "\n";
        os << "  Basic Blocks Executed  : " << basic_block_count << "\n";
        os << "  Loop Backedges Taken   : " << loop_backedge_count << "\n";
        os << "  Function Entries       : " << function_entries << "\n";
        os << "  Heap Allocations       : " << heap_allocations << " (" << heap_bytes_allocated << " bytes)\n";
        os << "-------------------------------------------------------------------\n";
        os << "  Time & Component Breakdown (Estimate % of Runtime):\n";
        
        double p_dispatch = pct(t_dispatch_us);
        double p_exec     = pct(t_opcode_exec_us);
        double p_alloc    = pct(t_allocation_us);
        double p_box      = pct(t_boxing_us);
        double p_call     = pct(t_call_overhead_us);
        double p_loop     = pct(t_loop_overhead_us);
        double p_other    = 100.0 - (p_dispatch + p_exec + p_alloc + p_box + p_call + p_loop);
        if (p_other < 0.0) p_other = 0.0;

        os << "    Interpreter Dispatch : " << p_dispatch << " %\n";
        os << "    Opcode Execution     : " << p_exec << " %\n";
        os << "    Heap Allocation      : " << p_alloc << " %\n";
        os << "    Boxing / Unboxing    : " << p_box << " %\n";
        os << "    Call Frame Overhead  : " << p_call << " %\n";
        os << "    Loop Overhead        : " << p_loop << " %\n";
        os << "    Other Overhead       : " << p_other << " %\n";
        os << "===================================================================\n";
    }
};

} // namespace setun
