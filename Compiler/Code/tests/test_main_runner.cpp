// Entry point for the standalone self-test binary (setunc_test.exe).
#include <iostream>

int run_all_tests();

int main() {
    std::cout << "[setunc_test] Running Tersun self-test suite...\n\n";
    int rc = run_all_tests();
    std::cout << "\n[setunc_test] Exit code: " << rc << "\n";
    return rc;
}
