public class Matmul {
    public static void main(String[] args) {
        long t0 = System.nanoTime();
        int n = 100;
        int size = n * n;

        long[] A = new long[size];
        long[] B = new long[size];
        long[] C = new long[size];

        for (int i = 0; i < n; ++i) {
            for (int j = 0; j < n; ++j) {
                int idx = i * n + j;
                A[idx] = (i + j) % 10;
                B[idx] = (i * 2 + j) % 10;
            }
        }

        for (int i = 0; i < n; ++i) {
            for (int k = 0; k < n; ++k) {
                long a_val = A[i * n + k];
                for (int j = 0; j < n; ++j) {
                    C[i * n + j] += a_val * B[k * n + j];
                }
            }
        }

        long checksum = 0;
        for (int i = 0; i < size; ++i) {
            checksum += C[i];
            if (checksum > 1000000000) {
                checksum %= 1000000000;
            }
        }

        long t1 = System.nanoTime();
        long us = (t1 - t0) / 1000;
        System.out.println("W3_MATMUL checksum=" + checksum + " time_us=" + us);
    }
}
