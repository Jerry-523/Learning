public class Threads1Million {
    private static int i;
    public static final int MAX = 1_000_000;

    public static void main(String[] args) {
        Runnable runnable = new MyRunnable();

        // Criar threads
        Thread[] threads = new Thread[10];//criando 10 threads
        for (int j = 0; j < threads.length; j++) {
            threads[j] = new Thread(runnable);
            threads[j].start();
        }
    }

    public static class MyRunnable implements Runnable {
        private static final Object lock = new Object();

        @Override
        public void run() {
            while (true) {
                synchronized (lock) {
                    if (i < MAX) {
                        i++;
                        String name = Thread.currentThread().getName();
                        System.out.println(name + " : " + i);
                    } else {
                        break;
                    }
                }
            }
        }
    }
}
