segment .data
    float1 dq 1.5
segment .bss

segment .text
    global asm_main

asm_main:
    mov rsi, float1
    call print 
    ret

print:
    mov rax, 0x1
    mov rdi, 0x1
    mov rdx, 0x8
    syscall
    ret
