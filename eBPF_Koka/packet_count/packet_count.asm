int packet_count(void * ctx):
bpf_prog_644ee9a75611c6d0_packet_count:
; bpf_printk("%d", counter);
    0: nopl (%rax,%rax)
    5: nop
    7: pushq %rbp
    8: movq %rsp, %rbp
    b: pushq %rbx
    c: movabsq $-79770420068352, %rbx
    16: movl (%rbx), %edx
    19: movabsq $-109408656120560, %rdi
    23: movl $3, %esi
    28: callq 0xffffffffc9c462cc
; counter++;
    2d: movl (%rbx), %edi
    30: addq $1, %rdi
    34: movl %edi, (%rbx)
; return XDP_PASS;
    37: movl $2, %eax
    3c: popq %rbx
    3d: leave
    3e: retq
    3f: int3
