section .data
    prompt db "Verificar se um numero e [par] ou [impar]: ", 0
    result_even db "PAR", 0
    result_odd db "IMPAR", 0

section .bss
    number resq 1  ; Aumentei o tamanho do buffer para 10 bytes
    num_length resd 1  ; Variável para armazenar o tamanho do número

section .text
    global _start

_start:
    ; Escreve a mensagem de prompt
    mov rdi, 1
    mov rsi, prompt
    mov rdx, 43 ; Tamanho da mensagem
    mov rax, 1   ; syscall write
    syscall

    ; Lê o número
    mov rdi, 0
    mov rsi, number
    mov rdx, 1    ; Tamanho do buffer
    mov rax, 0    ; syscall read
    syscall

    ; Chama a função para obter o tamanho do número
    mov rdi, number
    mov rax, 0
    call getNumeroLength

    ; Converte a string para número
    mov rdi, number
    mov eax, 0
    call str2int

    ; Verifica se é par ou ímpar
    test eax, 1   ; testa o bit menos significativo (0 para par, 1 para ímpar)
    jz is_even   ; se é 0, então é par

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

; Função para obter o tamanho do número
getNumeroLength:
    xor rax, rax
    mov rcx, 0
getNumLoop:
    cmp byte [rdi + rcx], 0
    je  getNumDone
    inc rcx
    jmp getNumLoop
getNumDone:
    mov [num_length], rcx
    ret
