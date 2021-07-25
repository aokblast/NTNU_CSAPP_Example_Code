CC ?= gcc
CFLAGS ?= -Wall -Wextra -Wno-implicit-function-declaration -std=c11 -Og -fno-pie
LDFLAGS ?= -no-pie

hello: hello.o driver.o

driver.o: driver.c

%.o: %.asm
	nasm -f elf64 -g -F stabs $^ -o $@

clean:
	rm -rf hello hello.o driver.o
