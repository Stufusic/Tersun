#include <iostream>

namespace setun::test {
void test_hierarchical_gemm_suite();
}

int main() {
    std::cout << "=== Running Gate 7.3.3 GEMM Parity Tests ===\n";
    try {
        setun::test::test_hierarchical_gemm_suite();
        std::cout << "\n=== All Gate 7.3.3 GEMM Tests PASSED ===\n";
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "[FAIL] Gate 7.3.3 GEMM Tests failed: " << e.what() << "\n";
        return 1;
    }
}
