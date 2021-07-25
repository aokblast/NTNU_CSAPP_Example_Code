CC ?= gcc
CFLAGS ?= -Wall -Wextra -Wno-implicit-function-declaration -std=c11 -Og -fno-pie
LDFLAGS ?= -no-pie

all: print_double

print_double: printf_double.o driver.o
	gcc -o $@ $^ $(LDFLAGS)

driver.o: driver.c

%.o: %.asm
	nasm -f elf64 -g -F stabs $^ -o $@

clean:
	rm -rf print_double printf_double.o driver.o