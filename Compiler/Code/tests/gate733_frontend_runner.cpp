#include <iostream>

namespace setun::test {
void test_tuple_and_destructuring_suite();
void test_tensor_view_indexing_suite();
void test_split_at_mut_safety_suite();
}

int main() {
    std::cout << "=== Running Gate 7.3.3 Frontend Tests ===\n";
    try {
        setun::test::test_tuple_and_destructuring_suite();
        setun::test::test_tensor_view_indexing_suite();
        setun::test::test_split_at_mut_safety_suite();
        std::cout << "\n=== All Gate 7.3.3 Frontend Tests PASSED ===\n";
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "[FAIL] Gate 7.3.3 Frontend Tests failed: " << e.what() << "\n";
        return 1;
    }
}
