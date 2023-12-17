package Examples;

public class ExemploSynchronized {

    private static int contador = 0;
    private static final Object lock = new Object(); // Objeto de bloqueio explícito

    public static void main(String[] args) {
        Thread thread1 = new Thread(() -> {
            synchronized (lock) {
                try {
                    System.out.println("Thread 1: Aguardando por 2 segundos...");
                    Thread.sleep(2000);
                    contador++;
                    System.out.println("Thread 1: Contador incrementado para " + contador);
                    lock.notify(); // Notifica outras Threads à espera
                } catch (InterruptedException e) {
                    System.out.println("Thread 1 interrompida!");
                }
            }
        });

        thread1.start();

        Thread thread2 = new Thread(() -> {
            synchronized (lock) {
                while (contador == 0) {
                    try {
                        System.out.println("Thread 2: Aguardando notificação...");
                        lock.wait(); // Aguarda até ser notificado
                    } catch (InterruptedException e) {
                        System.out.println("Thread 2 interrompida!");
                    }
                }
                System.out.println("Thread 2: Contador é " + contador);
            }
        });

        thread2.start();

        try {
            thread1.join();
            System.out.println("Thread 1 terminou!");
            thread2.join();
            System.out.println("Thread 2 terminou!");
        } catch (InterruptedException e) {
            System.out.println("Thread principal interrompida!");
        }
    }
}

/*
* Lock é um objeto usado para sincronizar as seções críticas do código.
* Ambas as Threads adquirem o monitor associado ao objeto lock através do bloco synchronized(lock) e,
* ao usar wait() e notify(), coordenam a execução para garantir que thread2 aguarde a notificação de thread1
* antes de acessar a variável contador.
* */