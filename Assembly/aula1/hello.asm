section .data
	msg db 'Olá Mundo',0xA
	tam equ $- msg
section .bss
section .text
global _start
_start:
	mov EAX, 0x4 ;instrui sobre a necessidade da fazer uma saída
	mov EBX, 0x1 ;Específica que se deve usar o mecanismo de saída padrão
	mov ECX, msg ; A especificaçºao da mensagem que se pretende imprimir
	mov EDX, tam ; O tamanho da mensagem que se pretende imprimir
	int 0x80 ; Autorização de interrupção (call kernel)

	mov EAX, 0x1 ;Pedido de saída do programa
	mov EBX, 0x0 ;O valor do retorno do sistema
	int 0x80 ; Autorização de interrupção (call kernel)
