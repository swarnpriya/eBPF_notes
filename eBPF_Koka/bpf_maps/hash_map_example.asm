int hello(void * ctx):
bpf_prog_6b3c3cd5303307e4_hello:
; uid = bpf_get_current_uid_gid() & 0xFFFFFFFF;   //returns a 64 bits integer containing the current GID and UID
   0:   nopl    (%rax,%rax)
   5:   nop
   7:   pushq   %rbp
   8:   movq    %rsp, %rbp
   b:   subq    $16, %rsp
  12:   callq   0xffffffffd528700c
; uid = bpf_get_current_uid_gid() & 0xFFFFFFFF;   //returns a 64 bits integer containing the current GID and UID
  17:   shlq    $32, %rax
  1b:   shrq    $32, %rax
; uid = bpf_get_current_uid_gid() & 0xFFFFFFFF;   //returns a 64 bits integer containing the current GID and UID
  1f:   movq    %rax, -8(%rbp)
  23:   movq    %rbp, %rsi
; 
  26:   addq    $-8, %rsi
; p = bpf_map_lookup_elem(&counter_table, (&uid)); //returns a pointer to the corresponding value in the hash table 
  2a:   movabsq $-115576415311872, %rdi
  34:   callq   0xffffffffd528ec9c
  39:   testq   %rax, %rax
  3c:   je      0x42
  3e:   addq    $56, %rax
  42:   movl    $1, %edi
; if (p!= 0) {
  47:   testq   %rax, %rax
  4a:   je      0x54
; counter = *p;
  4c:   movq    (%rax), %rdi
; }
  50:   addq    $1, %rdi
; counter++;
  54:   movq    %rdi, -16(%rbp)
  58:   movq    %rbp, %rsi
; 
  5b:   addq    $-8, %rsi
  5f:   movq    %rbp, %rdx
  62:   addq    $-16, %rdx
; bpf_map_update_elem(&counter_table, &uid, &counter, 0);
  66:   movabsq $-115576415311872, %rdi
  70:   xorl    %ecx, %ecx
  72:   callq   0xffffffffd52920cc
; return 0;
  77:   xorl    %eax, %eax
  79:   leave
  7a:   jmp     0xffffffffd60a33fc
