public class Main {
    public static void main(String[] args) {

        MyExecutorService executorService = new MyExecutorService(3);// Criando uma instância com 3 threads

        Runnable task1 = () -> {
            System.out.println("Tarefa 1 executada por: " + Thread.currentThread().getName());
        };

        Runnable task2 = () -> {
            System.out.println("Tarefa 2 executada por: " + Thread.currentThread().getName());
        };

        Runnable task3 = () -> {
            System.out.println("Tarefa 3 executada por: " + Thread.currentThread().getName());
        };

        // mandar as tarefas para execucao
        executorService.submit(task1);
        executorService.submit(task2);
        executorService.submit(task3);

        // Aguardando as tarefas serem executadas
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        executorService.shutdown();// Encerrando
    }
}
