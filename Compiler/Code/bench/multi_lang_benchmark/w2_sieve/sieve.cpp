#include <iostream>
#include <vector>
#include <chrono>

int main() {
    auto t0 = std::chrono::high_resolution_clock::now();
    const int n = 100000;
    std::vector<int> flags(n + 1, 0);

    for (int p = 2; p < 320; ++p) {
        if (flags[p] == 0) {
            int mult = p * p;
            while (mult <= n) {
                flags[mult] = 1;
                mult += p;
            }
        }
    }

    int count = 0;
    for (int i = 2; i <= n; ++i) {
        if (flags[i] == 0) {
            count++;
        }
    }

    auto t1 = std::chrono::high_resolution_clock::now();
    auto us = std::chrono::duration_cast<std::chrono::microseconds>(t1 - t0).count();
    std::cout << "W2_SIEVE checksum=" << count << " time_us=" << us << "\n";
    return 0;
}
