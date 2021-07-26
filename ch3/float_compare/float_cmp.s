    .text
    .global asm_main
asm_main:
    subq $16, %rsp # setup stack
    # Input number
    pushq %rax # setup alignment
    leaq input_prompt, %rdi
    call printf # call printf to print prompt
    leaq input_format, %rdi
    leaq 8(%rsp), %rsi # additional offset to avoid touching alignment filler
    leaq 16(%rsp), %rdx
    call scanf # call scanf to get user input
    popq %rax # remove alignment
    # load number from mem
    movq (%rsp), %xmm0
    movq 8(%rsp), %xmm1
    ucomisd %xmm1, %xmm0 # perform compare and set EFLAG (S2 ? S1)
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
    add $16, %rsp # restore stack frame
    xor %rax, %rax
    ret

    .data
a: .double 1.3
b: .double 2.5
greater: .asciz ">"
lesser: .asciz "<"
input_prompt: .asciz "Input two float number: "
input_format: .asciz "%lf %lf"
