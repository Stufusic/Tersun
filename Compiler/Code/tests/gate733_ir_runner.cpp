#include <iostream>

namespace setun::test {
void test_dendrite_canonical_lowering_suite();
void test_gemv_canonical_lowering_suite();
void test_epilogue_fusion_parity_suite();
}

int main() {
    std::cout << "=== Running Gate 7.3.3 IR & Fusion Tests ===\n";
    try {
        setun::test::test_dendrite_canonical_lowering_suite();
        setun::test::test_gemv_canonical_lowering_suite();
        setun::test::test_epilogue_fusion_parity_suite();
        std::cout << "\n=== All Gate 7.3.3 IR & Fusion Tests PASSED ===\n";
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "[FAIL] Gate 7.3.3 IR Tests failed: " << e.what() << "\n";
        return 1;
    }
}
