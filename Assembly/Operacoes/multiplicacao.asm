section .data
    prompt1 db 'Insira o primeiro número: ', 0xA, 0
    prompt2 db 'Insira o segundo número: ', 0xA, 0
    result_msg db 'Resultado da multiplicação: ', 0xA, 0

    ; Syscalls e file descriptors
    SYS_WRITE equ 1
    SYS_READ equ 0
    SYS_EXIT equ 60
    SYS_CALL equ 80
    STDOUT equ 1
    STDIN equ 0
    RETURN_VALUE equ 0

    num1 dd 0
    num2 dd 0
    result dd 0

section .text
    global _start

_start:
    ; Prompt e input para o primeiro número
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, prompt1
    mov edx, 27
    int SYS_CALL

    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num1
    mov edx, 4
    int SYS_CALL

    ; Prompt e input para o segundo número
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, prompt2
    mov edx, 28
    int SYS_CALL

    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num2
    mov edx, 4
    int SYS_CALL

    ; Converte os números de string para inteiro
    mov eax, [num1]
    mov ebx, [num2]
    
    ; Multiplicação dos números
    imul eax, ebx

    ; Salva o resultado
    mov [result], eax

    ; Prompt e impressão do resultado final
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, result_msg
    mov edx, 29
    int SYS_CALL

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, result
    mov edx, 11
    int SYS_CALL

    ; Encerrar o programa
    mov eax, SYS_EXIT
    xor ebx, RETURN_VALUE
    int SYS_CALL
