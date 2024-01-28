# Hello World! in eBPF
```
#!/usr/bin/python /* Python code */
from bcc import BPF
program = r"""   /* program is defined as a string */
int hello(void *ctx) {
  bpf_trace_printk("Hello World!"); /* helper function */
  return 0;
}
"""

b = BPF(text=program)   /* creates a BPF object */
syscall = b.get_syscall_fnname("execve") /* eBPF program needs to be attached to an event; here execve is the event (a syscall used to execute the program) */
b.attach_kprobe(event=syscall, fn_name="hello")

b.trace_print()
```

The code consists of two parts: 
- the eBPF program written in C that will be executed at the kernel level
- some user-space code that loads the eBPF program into the kernel and reads out the trace it generates.

![user-kernel](https://github.com/swarnpriya/eBPF_notes/blob/main/images/helloProg.png)
