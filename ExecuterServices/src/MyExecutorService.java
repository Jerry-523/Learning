import java.util.ArrayDeque;
import java.util.Queue;

public class MyExecutorService {
    private final int poolSize;
    private final Thread[] threads;
    private final Queue<Runnable> tasks;

    public MyExecutorService(int poolSize) {
        this.poolSize = poolSize;
        this.threads = new Thread[poolSize];
        this.tasks = new ArrayDeque<>();

        for (int i = 0; i < poolSize; i++) {
            threads[i] = new Thread(new TaskRunner());
            threads[i].start();
        }
    }

    public void submit(Runnable task) {
        synchronized (tasks) {
            tasks.add(task);
            tasks.notify();
        }
    }

    private class TaskRunner implements Runnable {
        @Override
        public void run() {
            while (true) {
                Runnable task = null;
                synchronized (tasks) {
                    while (tasks.isEmpty()) {
                        try {
                            tasks.wait();
                        } catch (InterruptedException e) {
                            Thread.currentThread().interrupt();
                            return;
                        }
                    }
                    task = tasks.poll();
                }
                try {
                    task.run();
                } catch (RuntimeException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void shutdown() {
        for (Thread thread : threads) {
            thread.interrupt();
        }
    }
}
