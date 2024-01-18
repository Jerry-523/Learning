section .data
    menu db '###########################', 10
         db '###       [ MENU ]      ###', 10
         db '###########################', 10
         db '# 1- [   Adicao         ] #', 10
         db '# 2- [   Subtracao      ] #', 10
         db '# 3- [   Multiplicacao  ] #', 10
         db '# 4- [   Divisao        ] #', 10
         db '###########################', 10
         db ' => Choose: ', 0

    result_msg db '###########################', 10
               db '###    [ Resultado ]   ###', 10
               db '###########################', 10
               db ' => RESULTADO: ', 0

    again_msg db '[1] => Again', 10
              db '[0] => Go to menu', 10
              db ' Choose: ', 0

section .bss
    choice resb 2
    num1 resq 1
    num2 resq 1
    result resq 1
    x resb 2

section .text
    global _start

_start:
    ; display menu
    mov eax, 4         ; syscall: write
    mov ebx, 1         ; file descriptor: stdout
    mov ecx, menu      ; pointer to the message
    mov edx, 260       ; message length
    int 0x80           ; call kernel

    ; get user choice
    mov eax, 3         ; syscall: read
    mov ebx, 0         ; file descriptor: stdin
    mov ecx, choice    ; buffer to read into
    mov edx, 2         ; number of bytes to read
    int 0x80           ; call kernel

    ; convert choice to integer
    mov eax, choice
    sub eax, '0'
    sub eax, 1         ; adjust for 0-based index
    cmp eax, 1
    jl invalid_choice   ; if choice < 1, jump to invalid_choice

    ; perform corresponding operation
    cmp eax, 1
    je adicao
    cmp eax, 2
    je subtracao
    cmp eax, 3
    je multiplicacao
    cmp eax, 4
    je divisao
    jmp invalid_choice

adicao:
    ; display input prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_num1
    mov edx, 24
    int 0x80

    ; read num1
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 8
    int 0x80

    ; display input prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_num2
    mov edx, 24
    int 0x80

    ; read num2
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 8
    int 0x80

    ; convert num1 and num2 to floats (assuming decimal input)
    ; ...

    ; perform addition
    ; ...

    ; display result
    ; ...

    ; display again_msg
    ; ...

    ; get user choice (1 or 0)
    ; ...

    ; repeat or go to menu based on user choice
    ; ...

; (similar code for subtracao, multiplicacao, and divisao)

invalid_choice:
    ; display error message for invalid choice
    ; ...

    ; repeat or go to menu based on user choice
    ; ...

; (rest of the program)

