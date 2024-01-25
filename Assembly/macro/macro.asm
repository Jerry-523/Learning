%include 'lib.inc'

%macro mostrarMesg 2
    mov eax, SYSTEM_WRITE
    mov ebx, STANDART_OUT
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro


section .data
    msg1 db "Mensagem um: ", LF, NULL
    tam1 equ $-msg1

    msg2 db "Mensagem dois: ", LF, NULL
    tam2 equ $-msg2

    msg3 db "Mensagem tres: ", LF, NULL
    tam3 equ $-msg3

section .text

global _start

    _start:

        mostrarMesg msg1, tam1
        mostrarMesg msg2, tam2
        mostrarMesg msg3, tam3



        mov EAX, SYSTEM_EXIT
        mov EBX, RETURN_ON_EXIT
        int SYSTEM_CALL