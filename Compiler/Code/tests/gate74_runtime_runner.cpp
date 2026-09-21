#include <iostream>

namespace setun::test {
void test_tokenizer_suite();
void test_sampler_contract_suite();
void test_kv_cache_parity_suite();
void test_chat_and_manifest_suite();
void test_zero_alloc_session_suite();
}

int main() {
    std::cout << "===================================================================\n";
    std::cout << "       TERSUN GATE 7.4 — LLM RUNTIME CORRECTNESS VERIFICATION      \n";
    std::cout << "===================================================================\n";
    try {
        setun::test::test_tokenizer_suite();
        setun::test::test_sampler_contract_suite();
        setun::test::test_chat_and_manifest_suite();
        setun::test::test_kv_cache_parity_suite();
        setun::test::test_zero_alloc_session_suite();

        std::cout << "\n===================================================================\n";
        std::cout << "  >>> GATE 7.4: ALL RUNTIME CORRECTNESS INVARIANTS SEALED & PASSED <<<\n";
        std::cout << "===================================================================\n";
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "\n[FAIL] Gate 7.4 Runtime Tests failed with exception: " << e.what() << "\n";
        return 1;
    }
}
