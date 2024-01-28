# Hello World! in eBPF
```
from bcc import BPF
program = r"""
int hello(void *ctx) {
  bpf_trace_printk("Hello World!");
  return 0;
}
"""

b = BPF(text=program)
syscall = b.get_syscall_fnname("execve")
b.attach_kprobe(event=syscall, fn_name="hello")

b.trace_print()
```

The code consists of two parts: 
- the eBPF program written in C that will be executed at the kernel level
- some user-space code that loads the eBPF program into the kernel and reads out the trace it generates.
