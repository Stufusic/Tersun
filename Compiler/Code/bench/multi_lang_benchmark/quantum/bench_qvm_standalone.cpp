#include "qvm/qreg.hpp"
#include "qvm/qgate.hpp"
#include <iostream>
#include <chrono>
#include <vector>
#include <cmath>

using namespace tersun::qvm;

// Q-Task 1: QFT on N qubits (repeated K times)
void bench_qft(size_t n, size_t iters) {
    QuantumCircuit circuit(n);
    circuit.qft(n);

    auto t0 = std::chrono::high_resolution_clock::now();
    for (size_t i = 0; i < iters; ++i) {
        QubitRegister reg(n);
        circuit.execute(reg);
    }
    auto t1 = std::chrono::high_resolution_clock::now();
    auto us = std::chrono::duration_cast<std::chrono::microseconds>(t1 - t0).count();
    std::cout << "Q_TASK1_QFT" << n << " iters=" << iters << " total_time_us=" << us 
              << " avg_time_us=" << (static_cast<double>(us) / iters) << "\n";
}

// Q-Task 2: Bell State + 10,000 Measurement Shots
void bench_bell_shots(size_t num_shots) {
    QuantumCircuit circuit(2);
    circuit.h(0);
    circuit.cnot(0, 1);

    auto t0 = std::chrono::high_resolution_clock::now();
    size_t count00 = 0;
    size_t count11 = 0;

    for (size_t i = 0; i < num_shots; ++i) {
        QubitRegister reg(2);
        circuit.execute(reg);
        int m0 = reg.measure(0);
        int m1 = reg.measure(1);
        if (m0 == 0 && m1 == 0) count00++;
        else if (m0 == 1 && m1 == 1) count11++;
    }

    auto t1 = std::chrono::high_resolution_clock::now();
    auto us = std::chrono::duration_cast<std::chrono::microseconds>(t1 - t0).count();
    std::cout << "Q_TASK2_BELL shots=" << num_shots << " total_time_us=" << us 
              << " avg_time_us=" << (static_cast<double>(us) / num_shots)
              << " count00=" << count00 << " count11=" << count11 << "\n";
}

// Q-Task 3: Grover Search on 3 qubits (target 7)
void bench_grover(size_t iters) {
    QuantumCircuit circuit(3);
    circuit.grover(3, 7); // target = 7 (|111>)

    auto t0 = std::chrono::high_resolution_clock::now();
    double target_prob = 0.0;
    for (size_t i = 0; i < iters; ++i) {
        QubitRegister reg(3);
        circuit.execute(reg);
        if (i == 0) {
            target_prob = std::norm(reg.amplitudes()[7]);
        }
    }
    auto t1 = std::chrono::high_resolution_clock::now();
    auto us = std::chrono::duration_cast<std::chrono::microseconds>(t1 - t0).count();
    std::cout << "Q_TASK3_GROVER3 iters=" << iters << " total_time_us=" << us 
              << " avg_time_us=" << (static_cast<double>(us) / iters)
              << " target_prob=" << target_prob << "\n";
}

int main() {
    std::cout << "[TERSUN_QVM_BENCHMARK]\n";
    bench_qft(4, 1000);
    bench_qft(8, 100);
    bench_bell_shots(10000);
    bench_grover(1000);
    return 0;
}
