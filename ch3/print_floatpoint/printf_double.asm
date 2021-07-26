default rel
extern printf
segment .data
    b DD 2
    a DQ 1.5
    format DB "%lf %d", 0xA, 0
segment .bss

segment .text
    global asm_main
asm_main:
    lea rdi, [format]       ; pass printf format string
    movsd xmm0, [a]         ; pass float point argument for printf to print
    mov esi, [b]            ; pass int argument to print
    mov ax, 2               ; hint va_arg by passing argument count
    push rax                ; assist to align C function call
    call printf             ; make printf function call
    pop rax                 ; restore call stack
    mov rax, 0              ; set return value
    ret