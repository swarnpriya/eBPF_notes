# llvm dump of object file 
$ llvm-objdump -S hash_map_example.bpf.o
```
hash_map_example.bpf.o: file format elf64-bpf

Disassembly of section ksyscall/execve:

0000000000000000 <hello>:
;     uid = bpf_get_current_uid_gid() & 0xFFFFFFFF;   //returns a 64 bits integer containing the current GID and UID
       0:       85 00 00 00 0f 00 00 00 call 15
       1:       67 00 00 00 20 00 00 00 r0 <<= 32
       2:       77 00 00 00 20 00 00 00 r0 >>= 32
       3:       7b 0a f8 ff 00 00 00 00 *(u64 *)(r10 - 8) = r0
       4:       bf a2 00 00 00 00 00 00 r2 = r10
       5:       07 02 00 00 f8 ff ff ff r2 += -8
;     p = bpf_map_lookup_elem(&counter_table, (&uid)); //returns a pointer to the corresponding value in the hash table 
       6:       18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 r1 = 0 ll
       8:       85 00 00 00 01 00 00 00 call 1
       9:       b7 01 00 00 01 00 00 00 r1 = 1
;     if (p!= 0) {
      10:       15 00 02 00 00 00 00 00 if r0 == 0 goto +2 <LBB0_2>
;         counter = *p;
      11:       79 01 00 00 00 00 00 00 r1 = *(u64 *)(r0 + 0)
;     }
      12:       07 01 00 00 01 00 00 00 r1 += 1

0000000000000068 <LBB0_2>:
;     counter++;
      13:       7b 1a f0 ff 00 00 00 00 *(u64 *)(r10 - 16) = r1
      14:       bf a2 00 00 00 00 00 00 r2 = r10
      15:       07 02 00 00 f8 ff ff ff r2 += -8
      16:       bf a3 00 00 00 00 00 00 r3 = r10
      17:       07 03 00 00 f0 ff ff ff r3 += -16
;     bpf_map_update_elem(&counter_table, &uid, &counter, 0);
      18:       18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 r1 = 0 ll
      20:       b7 04 00 00 00 00 00 00 r4 = 0
      21:       85 00 00 00 02 00 00 00 call 2
;     return 0;
      22:       b7 00 00 00 00 00 00 00 r0 = 0
      23:       95 00 00 00 00 00 00 00 exit
```

# Translated bytecode
```
int hello(void * ctx):
; uid = bpf_get_current_uid_gid() & 0xFFFFFFFF;   //returns a 64 bits integer containing the current GID and UID
   0: (85) call bpf_get_current_uid_gid#235744
; uid = bpf_get_current_uid_gid() & 0xFFFFFFFF;   //returns a 64 bits integer containing the current GID and UID
   1: (67) r0 <<= 32
   2: (77) r0 >>= 32
; uid = bpf_get_current_uid_gid() & 0xFFFFFFFF;   //returns a 64 bits integer containing the current GID and UID
   3: (7b) *(u64 *)(r10 -8) = r0
   4: (bf) r2 = r10
; 
   5: (07) r2 += -8
; p = bpf_map_lookup_elem(&counter_table, (&uid)); //returns a pointer to the corresponding value in the hash table 
   6: (18) r1 = map[id:19]
   8: (85) call __htab_map_lookup_elem#267632
   9: (15) if r0 == 0x0 goto pc+1
  10: (07) r0 += 56
  11: (b7) r1 = 1
; if (p!= 0) {
  12: (15) if r0 == 0x0 goto pc+2
; counter = *p;
  13: (79) r1 = *(u64 *)(r0 +0)
; }
  14: (07) r1 += 1
; counter++;
  15: (7b) *(u64 *)(r10 -16) = r1
  16: (bf) r2 = r10
; 
  17: (07) r2 += -8
  18: (bf) r3 = r10
  19: (07) r3 += -16
; bpf_map_update_elem(&counter_table, &uid, &counter, 0);
  20: (18) r1 = map[id:19]
  22: (b7) r4 = 0
  23: (85) call htab_map_update_elem#280992
; return 0;
  24: (b7) r0 = 0
  25: (95) exit
```

# Assembly
```
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
```


### References
(1) https://qmonnet.github.io/whirl-offload/2021/09/23/bpftool-features-thread/

(2) https://thegraynode.io/posts/bpftool_introduction/