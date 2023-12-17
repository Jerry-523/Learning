package Examples;

public class ExemploNotifyNotifyAll {
    private final Object lock = new Object();
    private boolean flag = false;

    public void metodoNotify() {
        Thread notifyThread = new Thread(() -> {
            synchronized (lock) {
                for (int i = 0; i <= 10; i+=2) {
                    try {
                        System.out.println("Prova pronta.");
                        Thread.sleep(2000);
                        flag = true;
                        lock.notify(); // Notifica uma única Thread
                    } catch (InterruptedException e) {
                        System.out.println("Thread de notificação interrompida!");
                    }
                }
            }
        });

        Thread waitThread = new Thread(() -> {
            synchronized (lock) {
                while (!flag) {
                    try {
                        System.out.println("Aguardando notificação...");
                        lock.wait(); // Aguarda notificação
                        System.out.println("Recebeu notificação.");
                    } catch (InterruptedException e) {
                        System.out.println("Thread interrompida enquanto aguardava notificação!");
                    }
                }
                System.out.println("Sou aluno PEGUEI");
            }
        });

        notifyThread.start();
        waitThread.start();
    }

    public void metodoNotifyAll() {
        Thread notifyAllThread = new Thread(() -> {
            synchronized (lock) {
                try {
                    System.out.println("Thread de notificação iniciada.");
                    Thread.sleep(2000);
                    flag = true;
                    System.out.println("Alterando a flag para true e notificando todas as Threads.");
                    lock.notifyAll(); // Notifica todas as Threads
                } catch (InterruptedException e) {
                    System.out.println("Thread de notificação interrompida!");
                }
            }
        });

        Thread waitThread = new Thread(() -> {
            synchronized (lock) {
                while (!flag) {
                    try {
                        System.out.println("Aguardando notificação...");
                        lock.wait(); // Aguarda notificação
                        System.out.println("Recebeu notificação.");
                    } catch (InterruptedException e) {
                        System.out.println("Thread interrompida enquanto aguardava notificação!");
                    }
                }
                System.out.println("Flag é verdadeira!");
            }
        });

        notifyAllThread.start();
        waitThread.start();
    }

    public static void main(String[] args) {
        ExemploNotifyNotifyAll exemplo = new ExemploNotifyNotifyAll();
        System.out.println("Exemplo com notify():");
        exemplo.metodoNotify();
        try {
            Thread.sleep(4000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("\nExemplo com notifyAll():");
        exemplo.metodoNotifyAll();
    }
}
