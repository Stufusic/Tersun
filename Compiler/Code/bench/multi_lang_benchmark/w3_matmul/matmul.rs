use std::time::Instant;

fn main() {
    let t0 = Instant::now();
    let n: usize = 100;
    let size = n * n;

    let mut a = vec![0i64; size];
    let mut b = vec![0i64; size];
    let mut c = vec![0i64; size];

    for i in 0..n {
        for j in 0..n {
            let idx = i * n + j;
            a[idx] = ((i + j) % 10) as i64;
            b[idx] = ((i * 2 + j) % 10) as i64;
        }
    }

    for i in 0..n {
        for k in 0..n {
            let a_val = a[i * n + k];
            for j in 0..n {
                c[i * n + j] += a_val * b[k * n + j];
            }
        }
    }

    let mut checksum: i64 = 0;
    for i in 0..size {
        checksum += c[i];
        if checksum > 1000000000 {
            checksum %= 1000000000;
        }
    }

    let us = t0.elapsed().as_micros();
    println!("W3_MATMUL checksum={} time_us={}", checksum, us);
}
