package Examples;

public class ExemploRunnable {

    public static void main(String[] args) {
        Runnable minhaRunnable = () -> {
            for (int i = 1; i <= 5; i++) {
                System.out.println("Thread: " + Thread.currentThread().getName() + " - Contagem: " + i);
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    System.out.println("Thread interrompida!");
                }
            }
        };

        Thread thread1 = new Thread(minhaRunnable, "Thread 1");
        Thread thread2 = new Thread(minhaRunnable, "Thread 2");

        thread1.start();
        thread2.start();
    }
}

/*
* Neste exemplo, a interface Runnable é implementada por meio de expressões
* lambda para definir o comportamento das Threads thread1 e thread2.
*/