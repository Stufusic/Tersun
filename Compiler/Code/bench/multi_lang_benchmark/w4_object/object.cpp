#include <iostream>
#include <chrono>
#include <cstdint>

class Particle {
public:
    int64_t x;
    int64_t y;
    int64_t vx;
    int64_t vy;

    Particle(int64_t px, int64_t py, int64_t pvx, int64_t pvy)
        : x(px), y(py), vx(pvx), vy(pvy) {}

    void update() {
        x += vx;
        y += vy;
    }

    int64_t energy() const {
        return (x * x + y * y) % 1000000007;
    }
};

int main() {
    auto t0 = std::chrono::high_resolution_clock::now();
    Particle p(10, 20, 2, 3);
    int64_t total_energy = 0;
    const int n = 200000;

    for (int i = 0; i < n; ++i) {
        p.update();
        total_energy += p.energy();
        if (total_energy > 1000000000) {
            total_energy %= 1000000000;
        }
    }

    auto t1 = std::chrono::high_resolution_clock::now();
    auto us = std::chrono::duration_cast<std::chrono::microseconds>(t1 - t0).count();
    std::cout << "W4_OBJECT checksum=" << total_energy << " time_us=" << us << "\n";
    return 0;
}
