section .data
    prompt1 db 'Insira o primeiro numero: ', 0
    prompt2 db 'Insira o segundo numero: ', 0
    prompt3 db 'Insira o terceiro numero: ', 0
    result_msg db 'O resultado eh: %d', 10, 0

section .bss
    number1 resd 1
    number2 resd 1
    number3 resd 1
    produto_num1_num2 resd 1
    resultado resd 1

section .text
    global _start

_start:
    ; Input do primeiro numero
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt1
    mov edx, 25
    int 0x80

    mov eax, 3
    mov ebx, 0
    lea ecx, [number1]
    mov edx, 4
    int 0x80

    ; Input do segundo numero
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt2
    mov edx, 25
    int 0x80

    mov eax, 3
    mov ebx, 0
    lea ecx, [number2]
    mov edx, 4
    int 0x80

    ; Input do terceiro numero
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt3
    mov edx, 26
    int 0x80

    mov eax, 3
    mov ebx, 0
    lea ecx, [number3]
    mov edx, 4
    int 0x80

    ; Calculo do produto_num1_num2
    mov eax, [number1]
    mul dword [number2]
    mov [produto_num1_num2], eax

    ; Calculo do resultado
    mov eax, [produto_num1_num2]
    mul dword [number3]
    mov [resultado], eax

    ; Print do resultado
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 19
    int 0x80

    ; Print do número resultado
    mov eax, 4
    mov ebx, 1
    mov ecx, [resultado]
    mov edx, 4
    int 0x80

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
