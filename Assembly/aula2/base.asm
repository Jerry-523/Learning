section .data
    txt_msg db 'Exemplo de Assembly', 0xA
    msg_length equ $- txt_msg

section .text

global _start
_start:
    ;
    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, "FNORD"
    mov EDX, 0xA
    int 0x80 ; system call(inicia a execucao)

    mov EAX, 0x1
    mov EBX, 0x0 
    int 0x80

