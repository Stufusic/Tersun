#include <iostream>

namespace setun::test {
void test_aot_suite();
}

int main() {
    std::cout << "=== Running Gate 7.3.3 LLVM AOT Standalone Tests ===\n";
    try {
        setun::test::test_aot_suite();
        std::cout << "\n=== All Gate 7.3.3 AOT Tests PASSED ===\n";
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "[FAIL] Gate 7.3.3 AOT Tests failed: " << e.what() << "\n";
        return 1;
    }
}
