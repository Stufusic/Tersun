public class ObjectBench {
    static class Particle {
        long x;
        long y;
        long vx;
        long vy;

        Particle(long px, long py, long pvx, long pvy) {
            this.x = px;
            this.y = py;
            this.vx = pvx;
            this.vy = pvy;
        }

        void update() {
            this.x += this.vx;
            this.y += this.vy;
        }

        long energy() {
            return (this.x * this.x + this.y * this.y) % 1000000007L;
        }
    }

    public static void main(String[] args) {
        long t0 = System.nanoTime();
        Particle p = new Particle(10, 20, 2, 3);
        long total_energy = 0;
        int n = 200000;

        for (int i = 0; i < n; ++i) {
            p.update();
            total_energy += p.energy();
            if (total_energy > 1000000000L) {
                total_energy %= 1000000000L;
            }
        }

        long t1 = System.nanoTime();
        long us = (t1 - t0) / 1000;
        System.out.println("W4_OBJECT checksum=" + total_energy + " time_us=" + us);
    }
}
