segment .data
    LF          equ 0xA
    SYS_CALL    equ 0x80
    NULL        equ 0xD

    SYS_EXIT    equ 0x1
    SYS_READ    equ 0x3
    SYS_WRITE   equ 0x4

    RET_ON_EXIT equ 0x0
    STD_IN      equ 0x0
    STD_OUT     equ 0x1

segment .text


mostrarSaida:
    call tamString
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    int SYS_CALL

    ret

tamSring:
    mov EDX, ECX

proxChar:
    cmp byte[EDX], NULL
    jz terminado

    inc EDX
    jmp proxChar

terminado:
    sub EBX, ECX
    ret
