import time

class Particle:
    __slots__ = ('x', 'y', 'vx', 'vy')

    def __init__(self, px: int, py: int, pvx: int, pvy: int):
        self.x = px
        self.y = py
        self.vx = pvx
        self.vy = pvy

    def update(self):
        self.x += self.vx
        self.y += self.vy

    def energy(self) -> int:
        return (self.x * self.x + self.y * self.y) % 1000000007

def main():
    t0 = time.perf_counter()
    p = Particle(10, 20, 2, 3)
    total_energy = 0
    n = 200000

    for _ in range(n):
        p.update()
        total_energy += p.energy()
        if total_energy > 1000000000:
            total_energy %= 1000000000

    t1 = time.perf_counter()
    us = int((t1 - t0) * 1_000_000)
    print(f"W4_OBJECT checksum={total_energy} time_us={us}")

if __name__ == "__main__":
    main()
