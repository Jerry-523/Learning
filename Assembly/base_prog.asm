; Na criação do codigo fonte para assembly, a extenção do arquivo nao tem muita relevancia,

; Estrutura básica do programa
; A sessão .data, destina-se à declaração de constantes (que não se altera o seu valor durante o tempo de execução do programa)
section .data
    ; Aqui segue a declaração de constante msg_text_text, que contem o texto que pretendemos imprimir
    msg_text db 'Seja benvindo ao curso de LEISC da UM',0xA  ; Essa declaração no fim serve para incrtruir o sistema a realizar uma quebra de linha depois da impressão da mensagem (Tabela ASCII: New Line = 10 decimal = A hexadecimal)
    
    ; Declaração de mais uma constante que irá conter de forma dinâmica, o número correspondente à quantidade de letras na variável indicada
    ; equ quer diser que queremos dizer igual, queremos dizer que a variavel é igual ao valor que é pegado dinamicamente atraves da da instrução ($-)
    ; ($- msg_text) pega a quantidade de caracteres na variavel, que no caso é msg_text
    tam_text equ $- msg_text

    ; ========================================================================
    ; Atenção!! Caso tivessimos duas ou mais mesnagems a impremir, deve-se colocar o mecanismo de deteção de tamanho logo a seguir à primeira variavel
    ; Caso contrário, o programa entende que deve pegar tudo declarado e contabeliza como valor de uma única variavel
    
    ; Exemplo: 
    ; msg_text1 db 'Mensabem 1',0xA 
    ; msg_text2 db 'Mensabem 2',0xA
    ; tam_text equ $- msg_text
    ; O tam_text teria o seu valor contado da premeira declaração para msg_text1 até a ultima linha e nese caso se executamos o programa
    ; provamelemente veriamos as dois mensagens
    ; ========================================================================

; Aqui devemos colocar as variaveis, que podem ter os seus valores alterados durante o tempo de execução
section .bss

; Onde comoça o programa, portando devemos colocar as instruções a serem processadas
section .text

; Aqui trata-se de um label ou ponteiro, que obrigatóriamente tem de existir, em que define o ponto de entraga do programa, ou ponto de inicialização
global _start
    _start:
        ; Esta declaração instrui o porcessador a preparar para efetuar uma saída de dados (Mostrar a mensagem)
        mov EAX, 0x4
        ; Esta declaração diz que o mecanismo de saída que vai ser usado, será a saída padrão 
        mov EBX, 0x1 ; Este 0x1 (Tambem pode-se usar 0x2) quer dizer apenas uma saída padrão, eu poderia usar uma impressora ou um arquivo como saida de dados
        ; Esses dois registradores são pareados, assim quando se faz uma movimentação em um tem-se de fazer no outro
        mov ECX, msg_text ; Consta a variavel que conmtem a informação que queremos enviar para a saída
        mov EDX, tam_text ; Indicação doo tamanho da mensagem (Quantidade de caracteres) que queremos enviar para a saída
        int 0x80 ; System Call - Mecanismo de interrupção, Pedir ao processador para executar todas as instruções declaradas declarações

        
        ; Em termos funcionais, queremos dizer para o sistema que o registador quer terminar o programa
        mov EAX, 0x1 ; Pretendo sair do programa
        ; Esta declaração é para instruir o sistema sobre o valor de retorno quando saírmos do programa.
        mov EBX, 0x0 ; O valor de retorno que o SO vai receber quando sair é 0
        ; Quando chamamos esse valor 0x80, o sistema operacional pega todas as declarações feitas e executa
        int 0x80 ; System Call - Mecanismo de interrupção, Dizer para o sistema processar as informações anteriormente declaradas.

        ; Para qualquer programa, estas ultimas três movimentações (declarações) devem estar presentes
        ; Basicamente, o comando para sair, o retorno da saida e o comando para executar as declarações.

