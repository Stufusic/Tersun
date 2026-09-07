// ============================================================================
// Tersun QVM: Quantum Fourier Transform (QFT) Scaling Benchmark (N = 16 .. 22)
// Comprehensive Metrics:
//   - N Qubits (16, 17, 18, 19, 20, 21, 22)
//   - Gate Count (Decomposed into H, RZ, CNOT, SWAP primitives)
//   - Runtime (ms & sec) + log2(runtime_ms)
//   - Gates/s throughput
//   - State RAM (MB) and Peak RSS (MB via Windows OS API)
//   - Quantum State Fidelity F = |<psi_ideal|psi_actual>|^2
//   - Scaling Analysis vs O(N * 2^N) and O(G(N) * 2^N)
//   - JSON export for freezing
// ============================================================================

#include "qvm/qbackend_statevector.hpp"
#include "qvm/qgate.hpp"
#include <iostream>
#include <fstream>
#include <iomanip>
#include <vector>
#include <chrono>
#include <cmath>
#include <complex>
#include <cassert>

#ifdef _WIN32
#include <windows.h>
#include <psapi.h>
static double get_peak_rss_mb() {
    PROCESS_MEMORY_COUNTERS pmc;
    if (GetProcessMemoryInfo(GetCurrentProcess(), &pmc, sizeof(pmc))) {
        return static_cast<double>(pmc.PeakWorkingSetSize) / (1024.0 * 1024.0);
    }
    return 0.0;
}
#else
static double get_peak_rss_mb() { return 0.0; }
#endif

using namespace tersun::qvm;

struct QFTDataPoint {
    size_t n;
    size_t dim;
    size_t gates;
    double runtime_ms;
    double log2_runtime;
    double gates_per_sec;
    double state_ram_mb;
    double peak_rss_mb;
    double fidelity;
    double norm_err;
    double theoretical_n2n;
    double scaling_ratio_n2n;
    double scaling_ratio_g2n;
};

int main(int argc, char** argv) {
    std::string out_json_path = (argc > 1) ? argv[1] : "qft_scaling_data.json";

    std::cout << "====================================================================================================================\n";
    std::cout << "          TERSUN QVM: QUANTUM FOURIER TRANSFORM (QFT) CONTINUOUS SCALING BENCHMARK (N = 16 .. 22)          \n";
    std::cout << "====================================================================================================================\n\n";

    std::cout << "Theoretical Foundations:\n";
    std::cout << "  * Target Algorithm    : Quantum Fourier Transform (Cooley-Tukey analog in Hilbert Space)\n";
    std::cout << "  * State Space         : 2^N complex double amplitudes in C^(2^N)\n";
    std::cout << "  * Gate Complexity     : G(N) = N + 5 * (N*(N-1)/2) + floor(N/2)\n";
    std::cout << "  * Complexity Hypotheses:\n";
    std::cout << "      (1) O(N * 2^N)      : Algorithmic time if CPhase gates could be parallelized/constant-depth\n";
    std::cout << "      (2) O(G(N) * 2^N)   : Exact statevector FLOPs = O(N^2 * 2^N)\n";
    std::cout << "  * Ideal Fidelity Ref  : F = |<psi_ideal | psi_actual>|^2 == 1.000000000000 (Exact Unitary Evolution)\n\n";

    std::cout << std::string(126, '=') << "\n";
    std::cout << std::left
              << std::setw(6)  << "N (Q)"
              << std::setw(12) << "Dimension"
              << std::setw(8)  << "Gates"
              << std::setw(14) << "Runtime (ms)"
              << std::setw(12) << "log2(T)"
              << std::setw(14) << "Gates/sec"
              << std::setw(13) << "RAM (MB)"
              << std::setw(13) << "Peak RSS(MB)"
              << std::setw(14) << "Fidelity (F)"
              << std::setw(10) << "T/(N*2^N)"
              << "Status\n";
    std::cout << std::string(126, '-') << "\n";

    std::vector<size_t> qubit_counts = {16, 17, 18, 19, 20, 21, 22};
    std::vector<QFTDataPoint> dataset;

    double base_n2n = 0.0;
    double base_g2n = 0.0;

    for (size_t n : qubit_counts) {
        size_t dim = 1ULL << n;
        double state_mem_mb = static_cast<double>(dim * sizeof(QComplex)) / (1024.0 * 1024.0);

        // 1. Build Circuit
        QuantumCircuit circuit(n);
        circuit.qft(n);
        size_t total_gates = circuit.gates().size();

        // 2. Execute on Exact Statevector Engine
        StatevectorBackend backend(n);

        using clk = std::chrono::steady_clock;
        auto t0 = clk::now();
        backend.execute_circuit(circuit);
        auto t1 = clk::now();

        double elapsed_ms = std::chrono::duration<double, std::milli>(t1 - t0).count();
        double log2_t = (elapsed_ms > 0) ? std::log2(elapsed_ms) : 0.0;
        double gates_per_sec = (elapsed_ms > 0) ? (total_gates / (elapsed_ms / 1000.0)) : 0.0;

        // 3. Fidelity and Mathematical Correctness
        double inv_sqrt_dim = 1.0 / std::sqrt(static_cast<double>(dim));
        const auto& amps = backend.reg().amplitudes();

        QComplex inner_product(0.0, 0.0);
        double total_norm = 0.0;

        for (size_t i = 0; i < dim; ++i) {
            const auto& a = amps[i];
            total_norm += std::norm(a);
            inner_product += a;
        }
        inner_product *= inv_sqrt_dim;

        double fidelity = std::norm(inner_product);
        double norm_err = std::abs(total_norm - 1.0);
        double peak_rss_mb = get_peak_rss_mb();

        // 4. Scaling Ratios
        double n2n = static_cast<double>(n) * static_cast<double>(dim);
        double g2n = static_cast<double>(total_gates) * static_cast<double>(dim);

        if (n == 16) {
            base_n2n = elapsed_ms / n2n;
            base_g2n = elapsed_ms / g2n;
        }

        double ratio_n2n = (base_n2n > 0) ? ((elapsed_ms / n2n) / base_n2n) : 1.0;
        double ratio_g2n = (base_g2n > 0) ? ((elapsed_ms / g2n) / base_g2n) : 1.0;

        bool pass = (std::abs(fidelity - 1.0) < 1e-6) && (norm_err < 1e-6);

        QFTDataPoint pt;
        pt.n = n;
        pt.dim = dim;
        pt.gates = total_gates;
        pt.runtime_ms = elapsed_ms;
        pt.log2_runtime = log2_t;
        pt.gates_per_sec = gates_per_sec;
        pt.state_ram_mb = state_mem_mb;
        pt.peak_rss_mb = peak_rss_mb;
        pt.fidelity = fidelity;
        pt.norm_err = norm_err;
        pt.theoretical_n2n = n2n;
        pt.scaling_ratio_n2n = ratio_n2n;
        pt.scaling_ratio_g2n = ratio_g2n;
        dataset.push_back(pt);

        std::cout << std::left
                  << "N=" << std::setw(4) << n
                  << std::setw(12) << dim
                  << std::setw(8)  << total_gates
                  << std::fixed << std::setprecision(2) << std::setw(14) << elapsed_ms
                  << std::fixed << std::setprecision(3) << std::setw(12) << log2_t
                  << std::scientific << std::setprecision(2) << std::setw(14) << gates_per_sec
                  << std::fixed << std::setprecision(2) << std::setw(13) << state_mem_mb
                  << std::fixed << std::setprecision(2) << std::setw(13) << peak_rss_mb
                  << std::fixed << std::setprecision(8) << std::setw(14) << fidelity
                  << std::fixed << std::setprecision(2) << std::setw(10) << ratio_n2n << "x "
                  << (pass ? "[EXACT]" : "[FAIL]")
                  << "\n";

        assert(pass && "Quantum Fourier Transform fidelity must strictly equal 1.0!");
    }

    std::cout << std::string(126, '=') << "\n\n";

    // Write JSON file
    std::ofstream ofs(out_json_path);
    if (ofs.is_open()) {
        ofs << "{\n  \"benchmark\": \"QFT_Scaling_N16_to_N22\",\n";
        ofs << "  \"engine\": \"Tersun QVM (Statevector Exact Backend)\",\n";
        ofs << "  \"datapoints\": [\n";
        for (size_t i = 0; i < dataset.size(); ++i) {
            const auto& pt = dataset[i];
            ofs << "    {\n"
                << "      \"n\": " << pt.n << ",\n"
                << "      \"dim\": " << pt.dim << ",\n"
                << "      \"gates\": " << pt.gates << ",\n"
                << "      \"runtime_ms\": " << std::fixed << std::setprecision(3) << pt.runtime_ms << ",\n"
                << "      \"log2_runtime_ms\": " << std::fixed << std::setprecision(4) << pt.log2_runtime << ",\n"
                << "      \"gates_per_sec\": " << std::scientific << std::setprecision(3) << pt.gates_per_sec << ",\n"
                << "      \"state_ram_mb\": " << std::fixed << std::setprecision(3) << pt.state_ram_mb << ",\n"
                << "      \"peak_rss_mb\": " << std::fixed << std::setprecision(3) << pt.peak_rss_mb << ",\n"
                << "      \"fidelity\": " << std::fixed << std::setprecision(10) << pt.fidelity << ",\n"
                << "      \"norm_err\": " << std::scientific << std::setprecision(3) << pt.norm_err << ",\n"
                << "      \"ratio_vs_n2n\": " << std::fixed << std::setprecision(4) << pt.scaling_ratio_n2n << ",\n"
                << "      \"ratio_vs_g2n\": " << std::fixed << std::setprecision(4) << pt.scaling_ratio_g2n << "\n"
                << "    }" << (i + 1 < dataset.size() ? "," : "") << "\n";
        }
        ofs << "  ]\n}\n";
        std::cout << "[OK] Exported raw scientific data to: " << out_json_path << "\n";
    }

    return 0;
}
