SHELL=/bin/bash
NOME := multi

all: $(NOME).o
	echo $@
	ld -s -o $(NOME) $(NOME).o
	rm -rf *.o

%.o: %.asm
	echo $@
	nasm -f elf64 $<