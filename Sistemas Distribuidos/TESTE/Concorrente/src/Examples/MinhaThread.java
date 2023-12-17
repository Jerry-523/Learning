package Examples;

public class MinhaThread extends Thread {

    @Override
    public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println("Thread estendendo a classe Thread: " + i);
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                System.out.println("Thread interrompida!");
            }
        }
    }

    public static void main(String[] args) {
        MinhaThread thread = new MinhaThread();
        thread.start();
    }
}

