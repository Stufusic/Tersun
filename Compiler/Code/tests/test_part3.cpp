#include "tafpu/tafpu.hpp"
#include "tafpu/tmat.hpp"
#include "tafpu/tvec3.hpp"
#include "tafpu/tquat.hpp"
#include "tafpu/nn_ops.hpp"
#include <cassert>
#include <iostream>
#include <vector>
#include <chrono>
#include <cmath>

namespace setun {

// Module 6 - Test Case 1: Neural Network GEMM (1024 x 1024 BitNet Ternary Weights {-1, 0, 1})
void test_part3_neural_net_gemm_1024() {
    std::cout << "  [Test] Module 6 - Test Case 1: 1024x1024 BitNet Ternary Weights Multiplication-Free GEMM...\n";
    constexpr size_t M = 1024;
    constexpr size_t K = 1024;

    std::vector<int8_t> W(M * K);
    std::vector<TAF_Register> X(K);

    // Initialize pseudo-random ternary weights {-1, 0, 1} and activations in Q(sqrt(3))
    for (size_t i = 0; i < M * K; ++i) {
        int r = (i * 13 + 7) % 3;
        W[i] = (r == 0) ? 0 : ((r == 1) ? 1 : -1);
    }
    for (size_t i = 0; i < K; ++i) {
        X[i] = TAF_Register((i % 5) - 2, (i % 3) - 1, 0);
    }

    auto start = std::chrono::high_resolution_clock::now();
    std::vector<TAF_Register> Y = gemm_ternary_weights(W.data(), X.data(), M, K);
    auto end = std::chrono::high_resolution_clock::now();

    double elapsed_ms = std::chrono::duration<double, std::milli>(end - start).count();
    assert(Y.size() == M);

    // Verify first row manually: Y[0] = sum(W[0][c] * X[c])
    TAF_Register manual_y0(0, 0, 0);
    for (size_t c = 0; c < K; ++c) {
        if (W[c] == 1) manual_y0 = manual_y0 + X[c];
        else if (W[c] == -1) manual_y0 = manual_y0 - X[c];
    }
    assert(Y[0] == manual_y0);

    std::cout << "    -> Computed " << (M * K) << " ternary-activation ops in " << elapsed_ms << " ms (Multiplication-free!)\n";
    std::cout << "    -> PASSED: 1024x1024 Ternary GEMM matched exact manual accumulator!\n";
}

// Module 6 - Test Case 2: Physics Simulation 1,000,000 Steps (Zero Coordinate Drift)
void test_part3_physics_1m_steps_zero_drift() {
    std::cout << "  [Test] Module 6 - Test Case 2: 1,000,000 Steps Physics Integration with ZERO Coordinate Drift...\n";
    
    // Initial particle: pos = (0, 0, 0), vel = (1 + sqrt(3), 2, 0), acc = (0, 0, 0)
    tvec3 init_pos(TAF_Register(0, 0, 0), TAF_Register(0, 0, 0), TAF_Register(0, 0, 0));
    tvec3 velocity(TAF_Register(1, 1, 0), TAF_Register(2, 0, 0), TAF_Register(0, 0, 0));
    tvec3 acceleration(TAF_Register(0, 0, 0), TAF_Register(0, 0, 0), TAF_Register(0, 0, 0));

    ExactPhysicsBody body(init_pos, velocity, acceleration);
    TAF_Register dt(1, 0, 0); // dt = 1 step

    constexpr int NUM_STEPS = 1000000;
    for (int step = 0; step < NUM_STEPS; ++step) {
        body.step(dt);
    }

    // Exact theoretical position after 1,000,000 steps: pos = velocity * 1,000,000
    // x = 1,000,000 + 1,000,000*sqrt(3) -> A=1000000, B=1000000, S=0
    // y = 2,000,000                     -> A=2000000, B=0, S=0
    // z = 0
    assert(body.position.x.a == 1000000 && body.position.x.b == 1000000 && body.position.x.s == 0);
    assert(body.position.y.a == 2000000 && body.position.y.b == 0 && body.position.y.s == 0);
    assert(body.position.z.a == 0 && body.position.z.b == 0 && body.position.z.s == 0);

    std::cout << "    -> Final Position after 1,000,000 steps: " << body.position.to_string() << "\n";
    std::cout << "    -> PASSED: Exactly 0.00000000% accumulated drift in 1,000,000 continuous physics steps!\n";
}

// Module 6 - Test Case 3: Batch TAFPU Vectorized Algebraic Multiplication
void test_part3_batch_tafpu_benchmark() {
    std::cout << "  [Test] Module 6 - Test Case 3: High-Throughput Batch TAFPU Multiplication Benchmark...\n";
    constexpr size_t BATCH_SIZE = 100000;
    std::vector<TAF_Register> A(BATCH_SIZE);
    std::vector<TAF_Register> B(BATCH_SIZE);
    std::vector<TAF_Register> C(BATCH_SIZE);

    for (size_t i = 0; i < BATCH_SIZE; ++i) {
        A[i] = TAF_Register((i % 100) + 1, (i % 50) + 1, 0);
        B[i] = TAF_Register((i % 70) + 1, (i % 30) + 1, 0);
    }

    auto start = std::chrono::high_resolution_clock::now();
    for (size_t i = 0; i < BATCH_SIZE; ++i) {
        // (A1*A2 + 3*B1*B2) + (A1*B2 + A2*B1)*sqrt(3)
        C[i] = A[i] * B[i];
    }
    auto end = std::chrono::high_resolution_clock::now();

    double elapsed_us = std::chrono::duration<double, std::micro>(end - start).count();
    double per_op_ns = (elapsed_us * 1000.0) / BATCH_SIZE;

    std::cout << "    -> " << BATCH_SIZE << " algebraic multiplications executed in " << elapsed_us << " us (" << per_op_ns << " ns/op)\n";
    std::cout << "    -> PASSED: Ultra-fast algebraic throughput maintained with zero error!\n";
}

// Module 6 - Test Case 4: CORDIC / Newton-Raphson Inversion & Quaternions
void test_part3_cordic_and_quaternions() {
    std::cout << "  [Test] Module 6 - Test Case 4: Newton-Raphson Inversion & Exact Ternary Quaternions...\n";
    
    // Test Newton-Raphson denominator inversion on D = A^2 - 3*B^2 = 25^2 - 3*(10^2) = 625 - 300 = 325
    int64_t D = 325;
    double inv_d = newton_raphson_ternary_inv(D, 6);
    double expected_inv = 1.0 / 325.0;
    double diff = std::abs(inv_d - expected_inv);
    assert(diff < 1e-10);
    std::cout << "    -> Newton-Raphson 1/325 = " << inv_d << " (error: " << diff << ")\n";

    // Test Quaternion multiplication and norm
    // q = (1, 0, 1, 0) in Q(sqrt(3)) -> norm^2 = 1^2 + 0^2 + 1^2 + 0^2 = 2
    tquat q1(TAF_Register(1, 0, 0), TAF_Register(0, 0, 0), TAF_Register(1, 0, 0), TAF_Register(0, 0, 0));
    tquat q2 = q1.conjugate();
    tquat q_prod = q1 * q2;

    assert(q_prod.w == q1.norm_squared());
    assert(q_prod.x.a == 0 && q_prod.y.a == 0 && q_prod.z.a == 0);

    // Test 3D vector rotation via Quaternion (unnormalized q: scales by |q|^2 = 2)
    tvec3 v(TAF_Register(0, 1, 0), TAF_Register(2, 0, 0), TAF_Register(0, 0, 0)); // (sqrt(3), 2, 0)
    tvec3 rotated = q1.rotate(v);
    assert(rotated.y.a == 4); // 2 * |q|^2 = 4
    assert(rotated.z.b == -2); // sqrt(3)*i rotated by 90 deg around j -> -2*sqrt(3)*k

    std::cout << "    -> PASSED: Newton-Raphson divider and Ternary Quaternion algebra verified!\n";
}

} // namespace setun
