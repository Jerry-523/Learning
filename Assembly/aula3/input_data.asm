.segment .data
    QL equ 0xA ; Line Feed (Quebra de LInha)
    NULL equ 0xD ; Carriage return (Terminar msg com valor nulo)

    ; EAX
    SYS_WRITE equ 0x4 
    SYS_EXIT equ 0x1

    ; EBX
    SDT_OUTPUT equ 0x1
    SYS_CALL equ 0x80 ; chamada do system(interupcao)
    RETURN_VALLUE equ 0x0
;==============================================================================================
section .data
    msg db "Introduza o seu nome: ",QL, NULL
    msg_length equ $- msg
    result db "O nome inserido foi: "
    result_lenhth equ $- result
;==============================================================================================
section .bss
    nome RESB 1 ;REservar 1 byte para conter a entrada do utilizador
;==============================================================================================

section .text
global _start
    mov eax, SYS_WRITE
    mov ebx, SDT_OUTPUT
    mov ecx, msg
    mov edx, msg_length
    int SYS_CALL

    ;Finalizar programa
    mov eax, SYS_EXIT
    mov ebx, RETURN_VALLUE
    int SYS_CALL
