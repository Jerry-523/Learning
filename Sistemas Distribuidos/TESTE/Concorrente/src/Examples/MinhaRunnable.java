package Examples;

public class MinhaRunnable implements Runnable {

    @Override
    public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println("Thread implementando Runnable: " + i);
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                System.out.println("Thread interrompida!");
            }
        }
    }

    public static void main(String[] args) {
        MinhaRunnable minhaRunnable = new MinhaRunnable();
        Thread thread = new Thread(minhaRunnable);
        thread.start();
    }
}

