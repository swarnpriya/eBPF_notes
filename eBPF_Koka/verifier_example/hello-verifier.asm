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
