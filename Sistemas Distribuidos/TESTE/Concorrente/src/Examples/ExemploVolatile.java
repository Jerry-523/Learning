package Examples;

public class ExemploVolatile {

    private static volatile boolean flag = false;

    public static void main(String[] args) {
        Thread writerThread = new Thread(() -> {
            try {
                Thread.sleep(2000);
                flag = true;
                System.out.println("Valor da flag alterado para true");
            } catch (InterruptedException e) {
                System.out.println("Thread interrompida!");
            }
        });

        Thread readerThread = new Thread(() -> {
            while (!flag) {
                System.out.println("Aguardando a mudança da flag...");
                try {
                    Thread.sleep(500);
                } catch (InterruptedException e) {
                    System.out.println("Thread interrompida!");
                }
            }
            System.out.println("Flag agora é true");
        });

        writerThread.start();
        readerThread.start();
    }
}
/*
* Neste exemplo, a variável flag é marcada como volatile,
* garantindo que as alterações feitas por uma Thread sejam visíveis por outras Threads.
* */