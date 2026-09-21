#include <iostream>

namespace setun::test {
void test_attention_parity_suite();
}

int main() {
    std::cout << "===================================================================\n";
    std::cout << "     TERSUN GATE 7.5 — LLM EXECUTION OPTIMIZATION VERIFICATION     \n";
    std::cout << "===================================================================\n";
    try {
        setun::test::test_attention_parity_suite();

        std::cout << "\n===================================================================\n";
        std::cout << "  >>> GATE 7.5: ALL VERIFICATION SUITES SEALED & PASSED <<<\n";
        std::cout << "===================================================================\n";
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "\n[FAIL] Gate 7.5 Tests failed with exception: " << e.what() << "\n";
        return 1;
    }
}
