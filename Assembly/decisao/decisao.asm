section .text

global option1
global option2

    ; Estrutura do if else
    option1:
        cmp EDI, ESI
        jg selectEDI
        jmp selectESI

    selectEDI:
        mov EAX, EDI
        ret

    selectESI:
        mov EAX, ESI
        ret

    ; Estrutura Switch Case
    option2:
        cmp EDI, 1
        je select5
        cmp EDI, 2
        je select10
        cmp EDI, 3
        je select15
        mov EAX, 0x0
        ret

    select5:
        mov EAX, 0x5
        ret

    select10:
        mov EAX, 0xA
        ret

    select15:
        mov EAX, 0xF
        ret