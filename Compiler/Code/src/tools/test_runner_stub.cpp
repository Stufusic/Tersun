// Linked into setunc.exe in place of the full self-test suite so the
// production binary does not carry every test translation unit.
// The complete suite is built separately as setunc_test.exe.
#include <iostream>

int run_all_tests() {
    std::cout << "[Info] The full self-test suite ships as setunc_test.exe.\n";
    std::cout << "[Info] Run: setunc_test\n";
    return 0;
}
