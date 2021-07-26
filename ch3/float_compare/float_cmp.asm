    .text
    .global asm_main
asm_main:
    # load number
    movq (a), %xmm0
    movq (b), %xmm1
    ucomisd %xmm0, %xmm1 # perform compare and set EFLAG
    pushq %rax # perform call alignment first
    # lesser equal branch start
    ja great_label
    lea lesser, %rdi
    call puts
    
    jmp end
great_label:
    # greater branch start 
    lea greater, %rdi
    call puts
end:
    popq %rax # revoke call alignment
    xor %rax, %rax
    ret

    .data
a: .double 1.3
b: .double 2.5
greater: .asciz "Greater\n"
lesser: .asciz "Lesser\n"
