public class Fib {
    public static long fib(long n) {
        if (n < 2) return n;
        return fib(n - 1) + fib(n - 2);
    }

    public static void main(String[] args) {
        long t0 = System.nanoTime();
        long res = fib(30);
        long t1 = System.nanoTime();
        long us = (t1 - t0) / 1000;
        System.out.println("W1_FIB checksum=" + res + " time_us=" + us);
    }
}
