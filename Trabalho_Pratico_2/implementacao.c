#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// 1 - 
//Definição da struct valueT 
typedef struct {
    int processId;
    char command[100];
} valueT;

// 2 - 
//Definição da struct nodeT que representa um nó na lista ligada
typedef struct _nodeT {
    valueT value;
    struct _nodeT *next;
} nodeT;

// struct stackT que representa a Stack
typedef struct {
    nodeT *head;
} stackT;

// Função para criar um novo nó na heap
nodeT *NewNode(void) {
    nodeT *newNode = (nodeT *)malloc(sizeof(nodeT));
    if (newNode == NULL) {
        printf("Erro: Memoria Insuficiente\n");
        return NULL;
    }
    newNode->next = NULL;
    return newNode;
}

// Função para criar uma nova Stack
stackT *NewStack(void) {
    stackT *newStack = (stackT *)malloc(sizeof(stackT));
    if (newStack == NULL) {
        printf("Erro: Memoria Insuficiente\n");
        return NULL;
    }
    newStack->head = NULL;
    return newStack;
}

// Função para adicionar um processo à Stack (push)
void Push(stackT *stack, valueT processo) {
    nodeT *newNode = NewNode();
    if (newNode == NULL) {
        return;
    }
    newNode->value = processo;
    newNode->next = stack->head;
    stack->head = newNode;
}

// Função para remover e retornar o processo no topo da Stack (pop)
valueT Pop(stackT *stack) {
    valueT emptyValue;
    emptyValue.processId = -1;  // Valor inválido para indicar erro
    
    if (isEmpty(stack)) {
        printf("Erro: Stack esta Vazia\n");
        return emptyValue;
    }
    
    valueT topValue = stack->head->value;
    nodeT *temp = stack->head;
    stack->head = stack->head->next;
    free(temp);
    
    return topValue;
}

// Função para esvaziar a Stack, liberando a memória alocada
void EmptyStack(stackT *stack) {
    while (!isEmpty(stack)) {
        nodeT *temp = stack->head;
        stack->head = stack->head->next;
        free(temp);
    }
}

// Função para liberar a memória alocada para a Stack
void FreeStack(stackT *stack) {
    if (!isEmpty(stack)) {
        printf("Error: Stack nao esta Vazia\n");
        return;
    }
    free(stack);
}

// Função para verificar se a Stack está vazia
int isEmpty(stackT *stack) {
    return stack->head == NULL;
}

int main() {
    stackT *myStack = NewStack();

    // Adicionando processos à Stack
    valueT process1;
    process1.processId = 1;
    strcpy(process1.command, "Programa 1");
    Push(myStack, process1);

    valueT process2;
    process2.processId = 2;
    strcpy(process2.command, "Programa 2");
    Push(myStack, process2);

    valueT process3;
    process3.processId = 3;
    strcpy(process3.command, "Programa 3");
    Push(myStack, process3);

    // Removendo e exibindo os processos da Stack
    printf("Top process: %s\n", Pop(myStack).command);
    printf("Top process: %s\n", Pop(myStack).command);
    printf("Top process: %s\n", Pop(myStack).command);

    // Verificando se a Stack está vazia
    if (isEmpty(myStack)) {
        printf("Stack esta vazia\n");
    } else {
        printf("Stack nao esta vazia\n");
    }

    // Liberando a memória alocada
    EmptyStack(myStack);
    FreeStack(myStack);

    return 0;
}
