default rel
extern printf
segment .data
    float1 dd 1.5
    formatfp db "%lf", 0xA, 0
    formatin db "%d", 0xA, 0
    int123 dd 2
segment .bss

segment .text
    global asm_main

asm_main:

    movsd xmm0, [float1] ; call ftod
    push rbx
    call ftod
    pop rbx

    lea rdi, [formatfp] ; call printf
    mov ax, 1
    push rbx
    call printf
    pop rbx

    mov eax, [int123] ; call itod
    push rbx
    call itod
    pop rbx

    lea rdi, [formatfp] ; call printf
    mov ax, 1
    push rbx
    call printf
    pop rbx

    movsd xmm0, [float1] ; call d2i
    push rbx
    call ftoi
    pop rbx

    lea rdi, [formatin] ; call printf
    mov ax, 0
    push rbx
    call printf
    pop rbx

    mov rax, 0 ; ret
    ret

ftod:
    movss	[rsp-4], xmm0 
    vpxor xmm0, xmm0
    cvtss2sd xmm0, [rsp-4]
    ret

itod:
    mov	[rsp-4], eax 
    vpxor xmm0, xmm0
    cvtsi2sd xmm0, [rsp-4]
    ret

ftoi:
    movss	[rsp-4], xmm0 
    vpxor xmm0, xmm0
    cvttss2si rsi, [rsp-4]
    ret
