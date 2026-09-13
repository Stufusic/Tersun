use std::time::Instant;

fn fib(n: i64) -> i64 {
    if n < 2 {
        return n;
    }
    fib(n - 1) + fib(n - 2)
}

fn main() {
    let t0 = Instant::now();
    let res = fib(30);
    let us = t0.elapsed().as_micros();
    println!("W1_FIB checksum={} time_us={}", res, us);
}
