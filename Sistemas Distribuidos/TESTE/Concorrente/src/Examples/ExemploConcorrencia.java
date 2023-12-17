package Examples;

public class ExemploConcorrencia {

    // Variável compartilhada entre as Threads
    private static int contador = 0;

    public static void main(String[] args) {
        // Criação manual de uma Thread
        Thread thread1 = new Thread(() -> {
            synchronized (ExemploConcorrencia.class) {
                try {
                    // Aguarda por um tempo definido
                    System.out.println("Thread 1: Aguardando por 2 segundos...");
                    Thread.sleep(2000);
                    // Incrementa o contador
                    contador++;
                    System.out.println("Thread 1: Contador incrementado para " + contador);
                    // Notifica outras Threads que estão à espera
                    ExemploConcorrencia.class.notify();
                } catch (InterruptedException e) {
                    System.out.println("Thread 1 interrompida!");
                }
            }
        });

        // Inicia a Thread
        thread1.start();

        // Criação manual de outra Thread
        Thread thread2 = new Thread(() -> {
            synchronized (ExemploConcorrencia.class) {
                while (contador == 0) {
                    try {
                        // Aguarda até ser notificado
                        System.out.println("Thread 2: Aguardando notificação...");
                        ExemploConcorrencia.class.wait();
                    } catch (InterruptedException e) {
                        System.out.println("Thread 2 interrompida!");
                    }
                }
                // Realiza operações após a notificação
                System.out.println("Thread 2: Contador é " + contador);
            }
        });

        // Inicia a segunda Thread
        thread2.start();

        try {
            // Aguarda até que a Thread 1 termine
            thread1.join();
            System.out.println("Thread 1 terminou!");
            // Aguarda até que a Thread 2 termine
            thread2.join();
            System.out.println("Thread 2 terminou!");
        } catch (InterruptedException e) {
            System.out.println("Thread principal interrompida!");
        }
    }
}

/*
* Thread1 incrementa um contador após dormir por 2 segundos e notifica outras Threads que estão à espera.
* Enquanto isso, thread2 aguarda a notificação para acessar e imprimir o valor do contador.
* Os métodos wait() e notify() são usados para a sincronização entre as Threads.
* */
