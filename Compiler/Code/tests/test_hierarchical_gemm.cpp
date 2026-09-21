#include "compiler/canonical_ternary_ir.hpp"
#include <iostream>
#include <vector>
#include <cassert>
#include <random>

namespace setun::test {

static std::vector<uint8_t> pack_trits(const std::vector<int8_t>& dense) {
    size_t count = dense.size();
    size_t byte_count = (count + 3) / 4;
    std::vector<uint8_t> packed(byte_count, 0);

    for (size_t i = 0; i < count; ++i) {
        int8_t t = dense[i];
        uint8_t code = 0;
        if (t == 1) code = 1;
        else if (t == -1) code = 2;
        packed[i / 4] |= (code << ((i % 4) * 2));
    }
    return packed;
}

void test_hierarchical_gemm_suite() {
    std::cout << "\n===================================================================\n";
    std::cout << "  [Gate 7.3.3] Hierarchical AVX2 GEMM & Multi-Layout Verification  \n";
    std::cout << "===================================================================\n";

    using namespace setun::compiler;

    struct DimCase {
        size_t M, N, K;
        const char* desc;
    };

    std::vector<DimCase> cases = {
        { 1, 8, 64,   "GEMV special case (M=1, N=8, K=64)" },
        { 4, 8, 32,   "Micro-kernel base tile (4x8x32)" },
        { 8, 16, 64,  "Small multiple of 8 (8x16x64)" },
        { 16, 32, 128, "Standard AI layer (16x32x128)" },
        { 7, 13, 29,  "Odd / prime dimensions tail-masking (7x13x29)" },
        { 5, 3, 7,    "Small arbitrary dimensions (5x3x7)" },
        { 11, 19, 31, "Unaligned multi-row remainder (11x19x31)" },
        { 32, 64, 256, "Cache-blocked macro-kernel tile (32x64x256)" }
    };

    std::mt19937 rng(999);
    std::uniform_int_distribution<int> dist_a(-15, 15);
    std::uniform_int_distribution<int> dist_b(-1, 1);
    std::uniform_int_distribution<int> dist_bias(-20, 20);

    for (size_t i = 0; i < cases.size(); ++i) {
        const auto& c = cases[i];
        std::cout << "  [G7.3.3-Grid-" << (i + 1) << "] " << c.desc << "... ";

        size_t M = c.M;
        size_t N = c.N;
        size_t K = c.K;

        std::vector<int32_t> A(M * K);
        std::vector<int8_t> B(K * N);
        std::vector<int32_t> bias(N);

        for (auto& a : A) a = dist_a(rng);
        for (auto& b : B) b = static_cast<int8_t>(dist_b(rng));
        for (auto& b : bias) b = dist_bias(rng);

        auto packed_B = pack_trits(B);

        std::vector<int32_t> Y_scalar_dense(M * N, 0);
        std::vector<int32_t> Y_scalar_packed(M * N, 0);
        std::vector<int32_t> Y_avx2_dense(M * N, 0);
        std::vector<int32_t> Y_avx2_packed(M * N, 0);

        ContractionSchedule sched = ContractionCostModel::derive_schedule(M, N, K);

        // 1. Reference Scalar Dense
        CanonicalTernaryEngine::execute_scalar_gemm(
            A.data(), B.data(), bias.data(), Y_scalar_dense.data(), M, N, K
        );

        // 2. Reference Scalar Packed
        CanonicalTernaryEngine::execute_scalar_packed_gemm(
            A.data(), packed_B.data(), bias.data(), Y_scalar_packed.data(), M, N, K
        );

        // 3. AVX2 Dense GEMM
        CanonicalTernaryEngine::execute_avx2_dense_gemm(
            A.data(), B.data(), bias.data(), Y_avx2_dense.data(), M, N, K, sched
        );

        // 4. AVX2 Packed GEMM
        CanonicalTernaryEngine::execute_avx2_packed_gemm(
            A.data(), packed_B.data(), bias.data(), Y_avx2_packed.data(), M, N, K, sched
        );

        // Verify 100% bit-exact parity across all four variants
        for (size_t idx = 0; idx < M * N; ++idx) {
            int32_t ref = Y_scalar_dense[idx];
            assert(Y_scalar_packed[idx] == ref);
            assert(Y_avx2_dense[idx] == ref);
            assert(Y_avx2_packed[idx] == ref);
        }

        std::cout << "PASSED (Bit-Exact 4-Way Parity)\n";
    }
}

} // namespace setun::test
