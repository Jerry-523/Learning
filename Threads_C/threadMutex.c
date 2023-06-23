#include <stdio.h>
#include <pthread.h>

#define NUM_THREADS 2

/*

Nesse exemplo, duas threads incrementam o contador counter em uma região crítica protegida por um mutex. O uso do mutex garante que apenas uma thread possa acessar o contador por vez, evitando condições de corrida.

*/

int counter = 0;
pthread_mutex_t mutex;

void *thread_function(void *arg) {
    int i;
    pthread_mutex_lock(&mutex);
    for (i = 0; i < 5; ++i) {
        counter++;
        printf("Thread %d: counter = %d\n", *((int *)arg), counter);
    }
    pthread_mutex_unlock(&mutex);
    pthread_exit(NULL);
}

int main() {
    pthread_t threads[NUM_THREADS];
    int thread_args[NUM_THREADS];
    int i;

    pthread_mutex_init(&mutex, NULL);

    for (i = 0; i < NUM_THREADS; ++i) {
        thread_args[i] = i;
        pthread_create(&threads[i], NULL, thread_function, (void *)&thread_args[i]);
    }

    for (i = 0; i < NUM_THREADS; ++i) {
        pthread_join(threads[i], NULL);
    }

    pthread_mutex_destroy(&mutex);

    return 0;
}

