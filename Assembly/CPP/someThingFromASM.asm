section .text

global someThingFromASM

    someThingFromASM:
    ;logica
    ; em EDI => x, ESI =>y, EDX => z
        mov EAX, EDI
        add EAX, ESI
        add EAX, EDX
        ret