public class Sieve {
    public static void main(String[] args) {
        long t0 = System.nanoTime();
        int n = 100000;
        int[] flags = new int[n + 1];

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

        long t1 = System.nanoTime();
        long us = (t1 - t0) / 1000;
        System.out.println("W2_SIEVE checksum=" + count + " time_us=" + us);
    }
}
