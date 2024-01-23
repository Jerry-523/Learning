
CC = g++

CFLAGS = -m64 -std=c++11
ASMFLAGS = -f elf64

# Source files
CPP_SOURCES = prog1.cpp
ASM_SOURCES = someThingFromASM.asm

# Object files
CPP_OBJECTS = $(CPP_SOURCES:.cpp=.o)
ASM_OBJECTS = $(ASM_SOURCES:.asm=.o)

# Executable
TARGET = prog1


# Targets
all: $(TARGET)

$(TARGET): $(CPP_OBJECTS) $(ASM_OBJECTS)
	$(CC) $(CFLAGS) $^ -o $@

%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.asm
	nasm $(ASMFLAGS) $< -o $@

clean:
	rm -f $(CPP_OBJECTS) $(ASM_OBJECTS) $(TARGET)
