default rel
extern printf
segment .data
    float1 dq 1.5
    format db "%lf", 0xA, 0
segment .bss

segment .text
    global asm_main
asm_main:
    movsd xmm0, [float1]    ; pass float point argument for printf to print
    lea rdi, [format]       ; pass printf format string
    mov ax, 1               ; hint va_arg by passing argument count
    push rax                ; assist to align C function call
    call printf             ; call stupid printf
    pop rax                 ; restore call stack
    mov rax, 0              ; set return value
    ret