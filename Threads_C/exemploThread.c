#include <stdio.h>
#include <pthread.h>

#define NUM_THREADS 5

/*

Nesse exemplo, são criadas cinco threads que executam a função thread_function, que imprime uma mensagem na tela com o identificador da thread. A função pthread_create é utilizada para criar as threads e pthread_join é utilizada para aguardar a conclusão de todas as threads.

*/

void *thread_function(void *arg) {
    int thread_id = *((int *)arg);
    printf("Ola sou um thread %d\n", thread_id);
    pthread_exit(NULL);
}

int main() {
    pthread_t threads[NUM_THREADS];
    int thread_args[NUM_THREADS];
    int i;

    for (i = 0; i < NUM_THREADS; ++i) {
        thread_args[i] = i;
        pthread_create(&threads[i], NULL, thread_function, (void *)&thread_args[i]);
    }

    for (i = 0; i < NUM_THREADS; ++i) {
        pthread_join(threads[i], NULL);
    }

    return 0;
}

