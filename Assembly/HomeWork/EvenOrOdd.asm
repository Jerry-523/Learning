section .data
    prompt db "Verificar se um numero e [par] ou [impar]: ", 0
    result_even db "PAR", 0
    result_odd db "IMPAR", 0

section .bss
    number resq 1

section .text
    global _start

_start:
    ; Escreve a mensagem de prompt
    mov rdi, 1
    mov rsi, prompt
    mov rdx, 39 ; Tamanho da mensagem
    mov rax, 1   ; syscall write
    syscall

    ; Lê o número
    mov rdi, 0
    mov rsi, number
    mov rdx, 8    ; Tamanho do buffer
    mov rax, 0    ; syscall read
    syscall

    ; Converte a string para número
    mov rdi, number
    mov eax, 0
    call str2int

    ; Verifica se é par ou ímpar
    mov rdi, eax
    mov rax, 2    ; número par se restante da divisão por 2 é 0
    xor rdx, rdx
    div rdx
    test rdx, rdx
    jz is_even    ; se restante da divisão é 0, é par

    ; É ímpar
    mov rdi, 1
    mov rsi, result_odd
    mov rdx, 5
    mov rax, 1    ; syscall write
    syscall
    jmp exit

is_even:
    ; É par
    mov rdi, 1
    mov rsi, result_even
    mov rdx, 3
    mov rax, 1    ; syscall write
    syscall

exit:
    ; Encerra o programa
    mov rax, 60   ; syscall exit
    xor rdi, rdi
    syscall

; Função para converter string para inteiro
str2int:
    xor rax, rax
    xor rbx, rbx
strloop:
    movzx rcx, byte [rdi]
    cmp rcx, 0
    je  strdone
    sub rcx, '0'
    imul rbx, rbx, 10
    add rbx, rcx
    inc rdi
    jmp strloop
strdone:
    mov eax, ebx
    ret
