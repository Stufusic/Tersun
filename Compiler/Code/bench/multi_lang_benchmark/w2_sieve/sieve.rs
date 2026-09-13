use std::time::Instant;

fn main() {
    let t0 = Instant::now();
    let n: usize = 100000;
    let mut flags = vec![0i32; n + 1];

    for p in 2..320 {
        if flags[p] == 0 {
            let mut mult = p * p;
            while mult <= n {
                flags[mult] = 1;
                mult += p;
            }
        }
    }

    let mut count = 0;
    for i in 2..=n {
        if flags[i] == 0 {
            count += 1;
        }
    }

    let us = t0.elapsed().as_micros();
    println!("W2_SIEVE checksum={} time_us={}", count, us);
}
