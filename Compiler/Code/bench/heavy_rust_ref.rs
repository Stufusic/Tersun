// ============================================================================
// Heavy Benchmark Suite Reference for Rust (rustc -O -C opt-level=3)
// H1: Prime Sieve (N=100,000)
// H2: Matrix Multiplication (100x100)
// H3: N-Queens Solver (N=11)
// H4: Binary Trees (Depth=14)
// ============================================================================

use std::time::Instant;
use std::env;

// --- H3 Helper ---
fn solve_nqueens(row: i64, n: i64, cols: i64, diag1: i64, diag2: i64) -> i64 {
    if row == n {
        return 1;
    }
    let mut count = 0;
    let all_ones = (1i64 << n) - 1;
    let occupied = cols | diag1 | diag2;
    let mut available = all_ones ^ (all_ones & occupied);
    while available > 0 {
        let bit = available & (-available);
        available ^= bit;
        count += solve_nqueens(row + 1, n, cols | bit, (diag1 | bit) << 1, (diag2 | bit) >> 1);
    }
    count
}

// --- H4 Helper ---
struct TreeNode {
    item: i64,
    left: Option<Box<TreeNode>>,
    right: Option<Box<TreeNode>>,
}

fn make_tree(depth: i64, item: i64) -> Box<TreeNode> {
    if depth > 0 {
        Box::new(TreeNode {
            item,
            left: Some(make_tree(depth - 1, 2 * item - 1)),
            right: Some(make_tree(depth - 1, 2 * item)),
        })
    } else {
        Box::new(TreeNode {
            item,
            left: None,
            right: None,
        })
    }
}

fn check_tree(node: &TreeNode, depth: i64) -> i64 {
    let mut sum = node.item;
    if depth > 0 {
        if let Some(ref l) = node.left {
            sum += check_tree(l, depth - 1);
        }
        if let Some(ref r) = node.right {
            sum += check_tree(r, depth - 1);
        }
    }
    sum
}

fn main() {
    let args: Vec<String> = env::args().collect();
    let mode = if args.len() > 1 { args[1].as_str() } else { "all" };

    // ------------------------------------------------------------ H1: Sieve
    if mode == "all" || mode == "sieve" {
        let t0 = Instant::now();
        let n: usize = 100000;
        let mut flags = vec![0u8; n + 1];
        let mut p = 2;
        while p < 320 {
            if flags[p] == 0 {
                let mut mult = p * p;
                while mult <= n {
                    flags[mult] = 1;
                    mult += p;
                }
            }
            p += 1;
        }
        let mut count = 0i64;
        for i in 2..=n {
            if flags[i] == 0 {
                count += 1;
            }
        }
        let elapsed = t0.elapsed();
        let us = elapsed.as_micros();
        println!("HEAVY_SIEVE count={} time_us={}", count, us);
    }

    // ------------------------------------------------------------ H2: Matmul
    if mode == "all" || mode == "matmul" {
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

        let mut checksum = 0i64;
        for i in 0..size {
            checksum += c[i];
            if checksum > 1000000000 {
                checksum %= 1000000000;
            }
        }
        let elapsed = t0.elapsed();
        let us = elapsed.as_micros();
        println!("HEAVY_MATMUL checksum={} time_us={}", checksum, us);
    }

    // ------------------------------------------------------------ H3: NQueens
    if mode == "all" || mode == "nqueens" {
        let t0 = Instant::now();
        let solutions = solve_nqueens(0, 11, 0, 0, 0);
        let elapsed = t0.elapsed();
        let us = elapsed.as_micros();
        println!("HEAVY_NQUEENS solutions={} time_us={}", solutions, us);
    }

    // ------------------------------------------------------------ H4: Trees
    if mode == "all" || mode == "trees" {
        let t0 = Instant::now();
        let d = 14i64;
        let root = make_tree(d, 1);
        let chk = check_tree(&root, d);
        let elapsed = t0.elapsed();
        let us = elapsed.as_micros();
        println!("HEAVY_TREES checksum={} time_us={}", chk, us);
    }
}
