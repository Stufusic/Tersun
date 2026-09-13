use std::time::Instant;

struct Particle {
    x: i64,
    y: i64,
    vx: i64,
    vy: i64,
}

impl Particle {
    fn new(x: i64, y: i64, vx: i64, vy: i64) -> Self {
        Particle { x, y, vx, vy }
    }

    fn update(&mut self) {
        self.x += self.vx;
        self.y += self.vy;
    }

    fn energy(&self) -> i64 {
        (self.x * self.x + self.y * self.y) % 1000000007
    }
}

fn main() {
    let t0 = Instant::now();
    let mut p = Particle::new(10, 20, 2, 3);
    let mut total_energy: i64 = 0;
    let n = 200000;

    for _ in 0..n {
        p.update();
        total_energy += p.energy();
        if total_energy > 1000000000 {
            total_energy %= 1000000000;
        }
    }

    let us = t0.elapsed().as_micros();
    println!("W4_OBJECT checksum={} time_us={}", total_energy, us);
}
