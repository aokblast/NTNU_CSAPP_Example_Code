default rel
extern printf
segment .data
    floats dq 1.1, 1.5, 1.35, 1.235, 12345.0, 1.625, 0.5, 0.1, -1.0
    asdf dq 11111
    format dq "%lf %lf %lf %lf %lf %lf %lf %lf %lf", 0xA, 0
segment .bss

segment .text
    global asm_main
asm_main:
    sub rsp, 8              ; allocate stack space
    lea rdi, [format]       ; pass printf format string
    movsd xmm0, floats[0]   ; pass 9 float point argument in order
    movsd xmm1, floats[8*1]
    movsd xmm2, floats[8*2]
    movsd xmm3, floats[8*3]
    movsd xmm4, floats[8*4]
    movsd xmm5, floats[8*5]
    movsd xmm6, floats[8*6]
    movsd xmm7, floats[8*7]
    mov rax, floats[8*8]    
    mov QWORD [rsp], rax    ; last one argument need to be pass in caller's stack frame
    mov al, 8               ; hint va_arg SSE reg count
    call printf             ; make printf function call
    add rsp, 8              ; restore stack pointer
    mov rax, 0              ; set return value
    ret