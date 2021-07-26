CC ?= gcc
CFLAGS ?= -Wall -Wextra -Wno-implicit-function-declaration -std=c11 -Og -fno-pie
LDFLAGS ?= -no-pie

float_cmp: float_cmp.o driver.o

driver.o: driver.c

%.o: %.asm
	as $^ -o $@

clean:
	rm -rf float_cmp float_cmp.o driver.o
