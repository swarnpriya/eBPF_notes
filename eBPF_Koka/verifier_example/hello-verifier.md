# Object file
```
hello-verifier.bpf.o:   file format elf64-bpf

Disassembly of section ksyscall/execve:

0000000000000000 <kprobe_exec>:
       0:       bf 16 00 00 00 00 00 00 r6 = r1
       1:       18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 r1 = 0 ll
       3:       61 12 00 00 00 00 00 00 r2 = *(u32 *)(r1 + 0)
       4:       bf 23 00 00 00 00 00 00 r3 = r2
       5:       07 03 00 00 01 00 00 00 r3 += 1
       6:       63 31 00 00 00 00 00 00 *(u32 *)(r1 + 0) = r3
       7:       b7 01 00 00 00 00 00 00 r1 = 0
       8:       63 1a f8 ff 00 00 00 00 *(u32 *)(r10 - 8) = r1
       9:       63 1a f4 ff 00 00 00 00 *(u32 *)(r10 - 12) = r1
      10:       63 1a f0 ff 00 00 00 00 *(u32 *)(r10 - 16) = r1
      11:       63 1a ec ff 00 00 00 00 *(u32 *)(r10 - 20) = r1
      12:       63 1a e8 ff 00 00 00 00 *(u32 *)(r10 - 24) = r1
      13:       63 1a e4 ff 00 00 00 00 *(u32 *)(r10 - 28) = r1
      14:       63 1a fc ff 00 00 00 00 *(u32 *)(r10 - 4) = r1
      15:       63 2a e0 ff 00 00 00 00 *(u32 *)(r10 - 32) = r2
      16:       85 00 00 00 0e 00 00 00 call 14
      17:       63 0a d8 ff 00 00 00 00 *(u32 *)(r10 - 40) = r0
      18:       85 00 00 00 0f 00 00 00 call 15
      19:       63 0a dc ff 00 00 00 00 *(u32 *)(r10 - 36) = r0
      20:       67 00 00 00 20 00 00 00 r0 <<= 32
      21:       77 00 00 00 20 00 00 00 r0 >>= 32
      22:       7b 0a d0 ff 00 00 00 00 *(u64 *)(r10 - 48) = r0
      23:       bf a2 00 00 00 00 00 00 r2 = r10
      24:       07 02 00 00 d0 ff ff ff r2 += -48
      25:       18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 r1 = 0 ll
      27:       85 00 00 00 01 00 00 00 call 1
      28:       bf 07 00 00 00 00 00 00 r7 = r0
      29:       15 07 0c 00 00 00 00 00 if r7 == 0 goto +12 <LBB0_2>
      30:       71 73 00 00 00 00 00 00 r3 = *(u8 *)(r7 + 0)
      31:       67 03 00 00 38 00 00 00 r3 <<= 56
      32:       c7 03 00 00 38 00 00 00 r3 s>>= 56
      33:       18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 r1 = 0 ll
      35:       b7 02 00 00 03 00 00 00 r2 = 3
      36:       85 00 00 00 06 00 00 00 call 6
      37:       bf a1 00 00 00 00 00 00 r1 = r10
      38:       07 01 00 00 f4 ff ff ff r1 += -12
      39:       b7 02 00 00 0c 00 00 00 r2 = 12
      40:       bf 73 00 00 00 00 00 00 r3 = r7
      41:       05 00 05 00 00 00 00 00 goto +5 <LBB0_3>

0000000000000150 <LBB0_2>:
      42:       bf a1 00 00 00 00 00 00 r1 = r10
      43:       07 01 00 00 f4 ff ff ff r1 += -12
      44:       b7 02 00 00 0c 00 00 00 r2 = 12
      45:       18 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 r3 = 0 ll

0000000000000178 <LBB0_3>:
      47:       85 00 00 00 71 00 00 00 call 113
      48:       18 07 00 00 00 00 00 00 00 00 00 00 00 00 00 00 r7 = 0 ll
      50:       61 71 00 00 00 00 00 00 r1 = *(u32 *)(r7 + 0)
      51:       25 01 16 00 0b 00 00 00 if r1 > 11 goto +22 <LBB0_6>
      52:       18 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 r2 = 0 ll
      54:       0f 12 00 00 00 00 00 00 r2 += r1
      55:       71 23 00 00 00 00 00 00 r3 = *(u8 *)(r2 + 0)
      56:       67 03 00 00 38 00 00 00 r3 <<= 56
      57:       c7 03 00 00 38 00 00 00 r3 s>>= 56
      58:       18 01 00 00 03 00 00 00 00 00 00 00 00 00 00 00 r1 = 3 ll
      60:       b7 02 00 00 03 00 00 00 r2 = 3
      61:       85 00 00 00 06 00 00 00 call 6
      62:       61 71 00 00 00 00 00 00 r1 = *(u32 *)(r7 + 0)
      63:       25 01 0a 00 0b 00 00 00 if r1 > 11 goto +10 <LBB0_6>
      64:       bf a2 00 00 00 00 00 00 r2 = r10
      65:       07 02 00 00 d8 ff ff ff r2 += -40
      66:       0f 12 00 00 00 00 00 00 r2 += r1
      67:       71 23 1c 00 00 00 00 00 r3 = *(u8 *)(r2 + 28)
      68:       67 03 00 00 38 00 00 00 r3 <<= 56
      69:       c7 03 00 00 38 00 00 00 r3 s>>= 56
      70:       18 01 00 00 06 00 00 00 00 00 00 00 00 00 00 00 r1 = 6 ll
      72:       b7 02 00 00 03 00 00 00 r2 = 3
      73:       85 00 00 00 06 00 00 00 call 6

0000000000000250 <LBB0_6>:
      74:       bf a1 00 00 00 00 00 00 r1 = r10
      75:       07 01 00 00 e4 ff ff ff r1 += -28
      76:       b7 02 00 00 10 00 00 00 r2 = 16
      77:       85 00 00 00 10 00 00 00 call 16
      78:       bf a4 00 00 00 00 00 00 r4 = r10
      79:       07 04 00 00 d8 ff ff ff r4 += -40
      80:       bf 61 00 00 00 00 00 00 r1 = r6
      81:       18 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 r2 = 0 ll
      83:       18 03 00 00 ff ff ff ff 00 00 00 00 00 00 00 00 r3 = 4294967295 ll
      85:       b7 05 00 00 28 00 00 00 r5 = 40
      86:       85 00 00 00 19 00 00 00 call 25
      87:       b7 00 00 00 00 00 00 00 r0 = 0
      88:       95 00 00 00 00 00 00 00 exit

Disassembly of section xdp:

0000000000000000 <xdp_hello>:
       0:       61 14 04 00 00 00 00 00 r4 = *(u32 *)(r1 + 4)
       1:       61 13 00 00 00 00 00 00 r3 = *(u32 *)(r1 + 0)
       2:       18 01 00 00 09 00 00 00 00 00 00 00 00 00 00 00 r1 = 9 ll
       4:       b7 02 00 00 06 00 00 00 r2 = 6
       5:       85 00 00 00 06 00 00 00 call 6
       6:       b7 00 00 00 02 00 00 00 r0 = 2
       7:       95 00 00 00 00 00 00 00 exit

```

# Translated bytecode
```
int kprobe_exec(void * ctx):
; int kprobe_exec(void *ctx)
   0: (bf) r6 = r1
; data.counter = c; 
   1: (18) r1 = map[id:115][0]+0
   3: (61) r2 = *(u32 *)(r1 +0)
; c++; 
   4: (bf) r3 = r2
   5: (07) r3 += 1
   6: (63) *(u32 *)(r1 +0) = r3
   7: (b7) r1 = 0
; struct data_t data = {}; 
   8: (63) *(u32 *)(r10 -8) = r1
   9: (63) *(u32 *)(r10 -12) = r1
  10: (63) *(u32 *)(r10 -16) = r1
  11: (63) *(u32 *)(r10 -20) = r1
  12: (63) *(u32 *)(r10 -24) = r1
  13: (63) *(u32 *)(r10 -28) = r1
  14: (63) *(u32 *)(r10 -4) = r1
; data.counter = c; 
  15: (63) *(u32 *)(r10 -32) = r2
; data.pid = bpf_get_current_pid_tgid();
  16: (85) call bpf_get_current_pid_tgid#235360
; data.pid = bpf_get_current_pid_tgid();
  17: (63) *(u32 *)(r10 -40) = r0
; uid = bpf_get_current_uid_gid() & 0xFFFFFFFF;
  18: (85) call bpf_get_current_uid_gid#235920
; data.uid = uid;
  19: (63) *(u32 *)(r10 -36) = r0
; uid = bpf_get_current_uid_gid() & 0xFFFFFFFF;
  20: (67) r0 <<= 32
  21: (77) r0 >>= 32
; uid = bpf_get_current_uid_gid() & 0xFFFFFFFF;
  22: (7b) *(u64 *)(r10 -48) = r0
  23: (bf) r2 = r10
; 
  24: (07) r2 += -48
; p = bpf_map_lookup_elem(&my_config, &uid);
  25: (18) r1 = map[id:112]
  27: (85) call __htab_map_lookup_elem#267808
  28: (15) if r0 == 0x0 goto pc+1
  29: (07) r0 += 56
  30: (bf) r7 = r0
; if (p != 0) {
  31: (15) if r7 == 0x0 goto pc+12
; char a = p->message[0];
  32: (71) r3 = *(u8 *)(r7 +0)
  33: (67) r3 <<= 56
  34: (c7) r3 s>>= 56
; bpf_printk("%d", a);        
  35: (18) r1 = map[id:116][0]+0
  37: (b7) r2 = 3
  38: (85) call bpf_trace_printk#-108752
; 
  39: (bf) r1 = r10
  40: (07) r1 += -12
; bpf_probe_read_kernel(&data.message, sizeof(data.message), p->message);  
  41: (b7) r2 = 12
  42: (bf) r3 = r7
  43: (05) goto pc+5
; 
  44: (bf) r1 = r10
  45: (07) r1 += -12
; bpf_probe_read_kernel(&data.message, sizeof(data.message), message); 
  46: (b7) r2 = 12
  47: (18) r3 = map[id:115][0]+4
; 
  49: (85) call bpf_probe_read_kernel#-120192
; if (c < sizeof(message)) {
  50: (18) r7 = map[id:115][0]+0
  52: (61) r1 = *(u32 *)(r7 +0)
; if (c < sizeof(message)) {
  53: (25) if r1 > 0xb goto pc+22
; char a = message[c];
  54: (18) r2 = map[id:115][0]+4
  56: (0f) r2 += r1
  57: (71) r3 = *(u8 *)(r2 +0)
  58: (67) r3 <<= 56
  59: (c7) r3 s>>= 56
; bpf_printk("%c", a);
  60: (18) r1 = map[id:116][0]+3
  62: (b7) r2 = 3
  63: (85) call bpf_trace_printk#-108752
; if (c < sizeof(data.message)) {
  64: (61) r1 = *(u32 *)(r7 +0)
; if (c < sizeof(data.message)) {
  65: (25) if r1 > 0xb goto pc+10
  66: (bf) r2 = r10
; char a = data.message[c];
  67: (07) r2 += -40
  68: (0f) r2 += r1
  69: (71) r3 = *(u8 *)(r2 +28)
  70: (67) r3 <<= 56
  71: (c7) r3 s>>= 56
; bpf_printk("%c", a);
  72: (18) r1 = map[id:116][0]+6
  74: (b7) r2 = 3
  75: (85) call bpf_trace_printk#-108752
; bpf_get_current_comm(&data.command, sizeof(data.command));
  76: (bf) r1 = r10
  77: (07) r1 += -28
; bpf_get_current_comm(&data.command, sizeof(data.command));
  78: (b7) r2 = 16
  79: (85) call bpf_get_current_comm#236064
  80: (bf) r4 = r10
; bpf_get_current_comm(&data.command, sizeof(data.command));
  81: (07) r4 += -40
; bpf_perf_event_output(ctx, &output, BPF_F_CURRENT_CPU,  &data, sizeof(data));
  82: (bf) r1 = r6
  83: (18) r2 = map[id:113]
  85: (18) r3 = 0xffffffff
  87: (b7) r5 = 40
  88: (85) call bpf_perf_event_output#-109808
; return 0;
  89: (b7) r0 = 0
  90: (95) exit
```

# Assembly 
```
int kprobe_exec(void * ctx):
bpf_prog_8754a8b0c0aca121_kprobe_exec:
; int kprobe_exec(void *ctx)
   0:   nopl    (%rax,%rax)
   5:   nop
   7:   pushq   %rbp
   8:   movq    %rsp, %rbp
   b:   subq    $48, %rsp
  12:   pushq   %rbx
  13:   pushq   %r13
  15:   movq    %rdi, %rbx
; data.counter = c; 
  18:   movabsq $-72830813560832, %rdi
  22:   movl    (%rdi), %esi
; c++; 
  25:   movq    %rsi, %rdx
  28:   addq    $1, %rdx
  2c:   movl    %edx, (%rdi)
  2f:   xorl    %edi, %edi
; struct data_t data = {}; 
  31:   movl    %edi, -8(%rbp)
  34:   movl    %edi, -12(%rbp)
  37:   movl    %edi, -16(%rbp)
  3a:   movl    %edi, -20(%rbp)
  3d:   movl    %edi, -24(%rbp)
  40:   movl    %edi, -28(%rbp)
  43:   movl    %edi, -4(%rbp)
; data.counter = c; 
  46:   movl    %esi, -32(%rbp)
; data.pid = bpf_get_current_pid_tgid();
  49:   callq   0xffffffffd5286c14
; data.pid = bpf_get_current_pid_tgid();
  4e:   movl    %eax, -40(%rbp)
; uid = bpf_get_current_uid_gid() & 0xFFFFFFFF;
  51:   callq   0xffffffffd5286e44
; data.uid = uid;
  56:   movl    %eax, -36(%rbp)
; uid = bpf_get_current_uid_gid() & 0xFFFFFFFF;
  59:   shlq    $32, %rax
  5d:   shrq    $32, %rax
; uid = bpf_get_current_uid_gid() & 0xFFFFFFFF;
  61:   movq    %rax, -48(%rbp)
  65:   movq    %rbp, %rsi
; 
  68:   addq    $-48, %rsi
; p = bpf_map_lookup_elem(&my_config, &uid);
  6c:   movabsq $-115581529390080, %rdi
  76:   callq   0xffffffffd528ead4
  7b:   testq   %rax, %rax
  7e:   je      0x84
  80:   addq    $56, %rax
  84:   movq    %rax, %r13
; if (p != 0) {
  87:   testq   %r13, %r13
  8a:   je      0xbe
; char a = p->message[0];
  8c:   movzbq  (%r13), %rdx
  91:   shlq    $56, %rdx
  95:   sarq    $56, %rdx
; bpf_printk("%d", a);        
  99:   movabsq $-115581794723056, %rdi
  a3:   movl    $3, %esi
  a8:   callq   0xffffffffd5232be4
; 
  ad:   movq    %rbp, %rdi
  b0:   addq    $-12, %rdi
; bpf_probe_read_kernel(&data.message, sizeof(data.message), p->message);  
  b4:   movl    $12, %esi
  b9:   movq    %r13, %rdx
  bc:   jmp     0xd4
; 
  be:   movq    %rbp, %rdi
  c1:   addq    $-12, %rdi
; bpf_probe_read_kernel(&data.message, sizeof(data.message), message); 
  c5:   movl    $12, %esi
  ca:   movabsq $-72830813560828, %rdx
; 
  d4:   callq   0xffffffffd522ff34
; if (c < sizeof(message)) {
  d9:   movabsq $-72830813560832, %r13
  e3:   movl    (%r13), %edi
; if (c < sizeof(message)) {
  e7:   cmpq    $11, %rdi
  eb:   ja      0x150
; char a = message[c];
  ed:   movabsq $-72830813560828, %rsi
  f7:   addq    %rdi, %rsi
  fa:   movzbq  (%rsi), %rdx
  ff:   shlq    $56, %rdx
 103:   sarq    $56, %rdx
; bpf_printk("%c", a);
 107:   movabsq $-115581794723053, %rdi
 111:   movl    $3, %esi
 116:   callq   0xffffffffd5232be4
; if (c < sizeof(data.message)) {
 11b:   movl    (%r13), %edi
; if (c < sizeof(data.message)) {
 11f:   cmpq    $11, %rdi
 123:   ja      0x150
 125:   movq    %rbp, %rsi
; char a = data.message[c];
 128:   addq    $-40, %rsi
 12c:   addq    %rdi, %rsi
 12f:   movzbq  28(%rsi), %rdx
 134:   shlq    $56, %rdx
 138:   sarq    $56, %rdx
; bpf_printk("%c", a);
 13c:   movabsq $-115581794723050, %rdi
 146:   movl    $3, %esi
 14b:   callq   0xffffffffd5232be4
; bpf_get_current_comm(&data.command, sizeof(data.command));
 150:   movq    %rbp, %rdi
 153:   addq    $-28, %rdi
; bpf_get_current_comm(&data.command, sizeof(data.command));
 157:   movl    $16, %esi
 15c:   callq   0xffffffffd5286ed4
 161:   movq    %rbp, %rcx
; bpf_get_current_comm(&data.command, sizeof(data.command));
 164:   addq    $-40, %rcx
; bpf_perf_event_output(ctx, &output, BPF_F_CURRENT_CPU,  &data, sizeof(data));
 168:   movq    %rbx, %rdi
 16b:   movabsq $-115581529362432, %rsi
 175:   movl    $4294967295, %edx
 17a:   movl    $40, %r8d
 180:   callq   0xffffffffd52327c4
; return 0;
 185:   xorl    %eax, %eax
 187:   popq    %r13
 189:   popq    %rbx
 18a:   leave
 18b:   jmp     0xffffffffd60a3234
```

