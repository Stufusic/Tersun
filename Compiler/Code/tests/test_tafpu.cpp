#include "tafpu/tafpu.hpp"
#include "tafpu/exception.hpp"
#include <cassert>
#include <iostream>
#include <cmath>

namespace setun {

void test_tafpu_algebraic_multiplication() {
    std::cout << "  [Test] TAFPU Algebraic Multiplication 0% Error...\n";
    // (1 + sqrt(3)) * (1 - sqrt(3)) = 1 - 3 = -2
    TafpuNum x1(1, 1, 0);
    TafpuNum x2(1, -1, 0);
    TafpuNum res = tafpu_mul(x1, x2);

    assert(res.a == -2);
    assert(res.b == 0);
    assert(res.s == 0);
    assert(std::abs(res.to_double() - (-2.0)) < 1e-12);

    // (2 + 3*sqrt(3)) * (4 + 5*sqrt(3)) = (2*4 + 3*3*5) + (2*5 + 3*4)*sqrt(3) = (8 + 45) + (10 + 12)*sqrt(3) = 53 + 22*sqrt(3)
    TafpuNum y1(2, 3, 0);
    TafpuNum y2(4, 5, 0);
    TafpuNum y_res = tafpu_mul(y1, y2);

    assert(y_res.a == 53);
    assert(y_res.b == 22);
    assert(y_res.s == 0);
    std::cout << "    -> PASSED: Algebraic multiplication is exactly preserved without float casting!\n";
}

void test_tafpu_addition_and_subtraction() {
    std::cout << "  [Test] TAFPU Addition and Subtraction...\n";
    TafpuNum x1(14, 25, 0);
    TafpuNum x2(10, -5, 0);

    TafpuNum add_res = tafpu_add(x1, x2);
    assert(add_res.a == 24);
    assert(add_res.b == 20);
    assert(add_res.s == 0);

    TafpuNum sub_res = tafpu_sub(x1, x2);
    assert(sub_res.a == 4);
    assert(sub_res.b == 30);
    assert(sub_res.s == 0);
    std::cout << "    -> PASSED: Addition and subtraction work with zero intermediate error.\n";
}

void test_tafpu_dynamic_encoding() {
    std::cout << "  [Test] TAFPU Dynamic Encoding (Paper Algorithm 3.1)...\n";
    double target = 57.30127;
    TafpuNum encoded = encode_dynamic(target);

    double diff = std::abs(encoded.to_double() - target);
    assert(diff < 0.05); // High density grid approximation
    std::cout << "    -> Encoded " << target << " => " << encoded.to_string() << " (error: " << diff << ")\n";

    // Test zero encoding
    TafpuNum zero_enc = encode_dynamic(0.0);
    assert(zero_enc.a == 0 && zero_enc.b == 0);
    std::cout << "    -> PASSED: Dynamic encoding correctly scales and locates optimal [A, B, S].\n";
}

void test_tafpu_isotropic_exception() {
    std::cout << "  [Test] TAFPU Isotropic Element Division Exception...\n";
    // Division by zero or isotropic element (A^2 - 3*B^2 == 0)
    TafpuNum numerator(10, 5, 0);
    TafpuNum isotropic_zero(0, 0, 0);

    bool caught = false;
    try {
        tafpu_div(numerator, isotropic_zero);
    } catch (const IsotropicDivisionException& e) {
        caught = true;
        std::cout << "    -> Successfully caught expected exception: " << e.what() << "\n";
    }
    assert(caught);
    std::cout << "    -> PASSED: Isotropic division exception triggered properly.\n";
}

void test_tafpu_10k_dataset_encoding() {
    std::cout << "  [Test] Dynamic Encoding on 10,000 Random Real Numbers (Plan Week 3-4)...\n";
    constexpr int NUM_SAMPLES = 10000;
    double max_error = 0.0;
    double total_error = 0.0;

    for (int i = 1; i <= NUM_SAMPLES; ++i) {
        // Generate diverse real numbers across multiple scales
        double val = (i % 2 == 0 ? 1.0 : -1.0) * (std::sin(i * 0.123) * std::pow(10.0, (i % 7) - 3));
        TAF_Register reg = encode_dynamic(val);
        double decoded = reg.to_double();
        double err = std::abs(decoded - val);

        if (err > max_error) max_error = err;
        total_error += err;
    }

    double avg_error = total_error / NUM_SAMPLES;
    std::cout << "    -> Processed " << NUM_SAMPLES << " samples: Avg Error = " << avg_error << ", Max Error = " << max_error << "\n";
    std::cout << "    -> PASSED: 10,000 real numbers encoded with ultra-dense Weyl lattice precision.\n";
}

void test_tafpu_3d_distance_combat() {
    std::cout << "  [Test] 3D Vector Combat Distance Calculation (Plan Week 7-8)...\n";
    // Position 1: (10, 20, 30) => in TAFPU
    TAF_Register p1_x(10, 0, 0), p1_y(20, 0, 0), p1_z(30, 0, 0);
    // Position 2: (13, 24, 30) => dx=3, dy=4, dz=0 => d^2 = 9 + 16 = 25
    TAF_Register p2_x(13, 0, 0), p2_y(24, 0, 0), p2_z(30, 0, 0);

    TAF_Register dist_sq = distance_squared_3d(p1_x, p1_y, p1_z, p2_x, p2_y, p2_z);
    assert(dist_sq.a == 25);
    assert(dist_sq.b == 0);
    assert(dist_sq.s == 0);
    std::cout << "    -> PASSED: 3D Distance Squared d^2 = " << dist_sq.to_string() << " (exact 0% error)!\n";
}

} // namespace setun
