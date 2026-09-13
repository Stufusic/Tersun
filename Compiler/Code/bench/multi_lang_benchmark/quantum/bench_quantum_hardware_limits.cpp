#include "qvm/qreg.hpp"
#include "qvm/qgate.hpp"
#include <iostream>
#include <chrono>
#include <vector>
#include <cmath>
#include <iomanip>
#include <sstream>
#include <stdexcept>
#include <new>

using namespace tersun::qvm;

struct LimitResult {
    size_t n_qubits;
    uint64_t dim;
    double mem_mb;
    double alloc_time_ms;
    double circuit_time_ms;
    double measure_time_ms;
    double total_time_ms;
    bool success;
    std::string status_msg;
};

// ============================================================================
// Stress Suite 1: Deep Gate Complexity - QFT Scaling (N = 4 to 22)
// ============================================================================
void run_qft_scaling() {
    std::cout << "\n==================================================================================\n";
    std::cout << "  [PHASE 1] QFT GATE COMPLEXITY SCALING (O(N^2) Gates across Statevector)        \n";
    std::cout << "==================================================================================\n";
    std::cout << std::left << std::setw(8)  << "Qubits"
              << std::setw(14) << "Dimension"
              << std::setw(12) << "Mem (MB)"
              << std::setw(10) << "Gates"
              << std::setw(16) << "Exec Time (ms)"
              << std::setw(18) << "Throughput (Mops/s)"
              << "\n";
    std::cout << std::string(78, '-') << "\n";

    std::vector<size_t> qft_qubits = {4, 6, 8, 10, 12, 14, 16, 18, 20, 22};

    for (size_t n : qft_qubits) {
        uint64_t dim = 1ULL << n;
        double mem_mb = static_cast<double>(dim * sizeof(QComplex)) / (1024.0 * 1024.0);
        size_t n_gates = n + (n * (n - 1)) / 2 + n / 2; // H + CPHASE + SWAP

        try {
            QuantumCircuit circuit(n);
            circuit.qft(n);

            auto t0 = std::chrono::high_resolution_clock::now();
            QubitRegister reg(n);
            circuit.execute(reg);
            auto t1 = std::chrono::high_resolution_clock::now();

            double elapsed_ms = std::chrono::duration<double, std::milli>(t1 - t0).count();
            double throughput = (elapsed_ms > 0.0) ? (static_cast<double>(dim * n_gates) / (elapsed_ms * 1000.0)) : 0.0;

            std::cout << std::left << std::setw(8)  << n
                      << std::setw(14) << dim
                      << std::setw(12) << std::fixed << std::setprecision(2) << mem_mb
                      << std::setw(10) << n_gates
                      << std::setw(16) << std::fixed << std::setprecision(3) << elapsed_ms
                      << std::setw(18) << std::fixed << std::setprecision(2) << throughput
                      << "\n";

            std::cout << "QFT_SCALING N=" << n << " dim=" << dim 
                      << " mem_mb=" << mem_mb << " time_ms=" << elapsed_ms << "\n";
        } catch (const std::exception& e) {
            std::cout << std::left << std::setw(8)  << n
                      << std::setw(14) << dim
                      << std::setw(12) << mem_mb
                      << "FAILED: " << e.what() << "\n";
            break;
        }
    }
}

// ============================================================================
// Stress Suite 2: Statevector Hardware Limit (N = 10 up to 30)
// Tests maximum memory capacity, superposition + entanglement + collapse
// ============================================================================
void run_hardware_memory_limits() {
    std::cout << "\n==================================================================================\n";
    std::cout << "  [PHASE 2] TERSUN QVM HARDWARE MEMORY LIMIT STRESS TEST (N = 10 to 30)          \n";
    std::cout << "==================================================================================\n";
    std::cout << std::left << std::setw(8)  << "Qubits"
              << std::setw(14) << "Dimension"
              << std::setw(12) << "Mem Req"
              << std::setw(14) << "Alloc (ms)"
              << std::setw(16) << "Circuit (ms)"
              << std::setw(14) << "Measure (ms)"
              << std::setw(14) << "Total (ms)"
              << "Status" << "\n";
    std::cout << std::string(96, '-') << "\n";

    std::vector<size_t> test_qubits = {10, 14, 18, 20, 22, 24, 25, 26, 27, 28, 29, 30};

    for (size_t n : test_qubits) {
        uint64_t dim = 1ULL << n;
        double mem_bytes = static_cast<double>(dim) * sizeof(QComplex);
        double mem_mb = mem_bytes / (1024.0 * 1024.0);
        double mem_gb = mem_bytes / (1024.0 * 1024.0 * 1024.0);

        std::stringstream mem_ss;
        if (mem_gb >= 1.0) {
            mem_ss << std::fixed << std::setprecision(2) << mem_gb << " GB";
        } else {
            mem_ss << std::fixed << std::setprecision(1) << mem_mb << " MB";
        }

        LimitResult res;
        res.n_qubits = n;
        res.dim = dim;
        res.mem_mb = mem_mb;

        try {
            // Step 1: Allocation
            auto t_start = std::chrono::high_resolution_clock::now();
            QubitRegister reg(n);
            reg.promote_to_statevector();
            auto t_alloc = std::chrono::high_resolution_clock::now();

            // Step 2: Full Superposition + Entanglement Ladder
            QuantumCircuit circuit(n);
            // Superposition across all qubits
            for (size_t i = 0; i < n; ++i) {
                circuit.h(i);
            }
            // Entanglement ladder
            for (size_t i = 0; i + 1 < n; ++i) {
                circuit.cnot(i, i + 1);
            }
            circuit.execute(reg);
            auto t_circuit = std::chrono::high_resolution_clock::now();

            // Step 3: Measurement & Collapse on Qubit 0 and Qubit N-1
            int m0 = reg.measure(0);
            int m_last = reg.measure(n - 1);
            auto t_measure = std::chrono::high_resolution_clock::now();

            res.alloc_time_ms = std::chrono::duration<double, std::milli>(t_alloc - t_start).count();
            res.circuit_time_ms = std::chrono::duration<double, std::milli>(t_circuit - t_alloc).count();
            res.measure_time_ms = std::chrono::duration<double, std::milli>(t_measure - t_circuit).count();
            res.total_time_ms = std::chrono::duration<double, std::milli>(t_measure - t_start).count();
            res.success = true;
            res.status_msg = "PASSED";

            std::cout << std::left << std::setw(8)  << n
                      << std::setw(14) << dim
                      << std::setw(12) << mem_ss.str()
                      << std::setw(14) << std::fixed << std::setprecision(2) << res.alloc_time_ms
                      << std::setw(16) << std::fixed << std::setprecision(2) << res.circuit_time_ms
                      << std::setw(14) << std::fixed << std::setprecision(2) << res.measure_time_ms
                      << std::setw(14) << std::fixed << std::setprecision(2) << res.total_time_ms
                      << "OK (m0=" << m0 << ", mN=" << m_last << ")" << "\n";

            std::cout << "HW_LIMIT N=" << n << " dim=" << dim 
                      << " mem_mb=" << mem_mb << " total_ms=" << res.total_time_ms 
                      << " status=SUCCESS\n";

        } catch (const std::bad_alloc& e) {
            std::cout << std::left << std::setw(8)  << n
                      << std::setw(14) << dim
                      << std::setw(12) << mem_ss.str()
                      << std::string(44, ' ')
                      << "OUT_OF_MEMORY (std::bad_alloc: Limit Exceeded!)\n";
            std::cout << "HW_LIMIT N=" << n << " dim=" << dim 
                      << " mem_mb=" << mem_mb << " total_ms=-1.0 status=OUT_OF_MEMORY\n";
            std::cout << "  -> Physical RAM Ceiling strictly identified at N = " << n 
                      << " (" << mem_ss.str() << ")!\n";
            break;
        } catch (const std::exception& e) {
            std::cout << std::left << std::setw(8)  << n
                      << std::setw(14) << dim
                      << std::setw(12) << mem_ss.str()
                      << "ERROR: " << e.what() << "\n";
            std::cout << "HW_LIMIT N=" << n << " dim=" << dim 
                      << " mem_mb=" << mem_mb << " total_ms=-1.0 status=ERROR\n";
            break;
        }
    }
}

int main() {
    std::cout << "==================================================================================\n";
    std::cout << "          TERSUN QUANTUM VIRTUAL MACHINE (QVM) - HARDWARE STRESS TEST             \n";
    std::cout << "==================================================================================\n";
    run_qft_scaling();
    run_hardware_memory_limits();
    std::cout << "\n==================================================================================\n";
    std::cout << "                      HARDWARE STRESS TEST COMPLETED                              \n";
    std::cout << "==================================================================================\n";
    return 0;
}
