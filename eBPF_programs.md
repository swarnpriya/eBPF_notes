# Introduction:
As application developers, we typically don't use the system call interface directly, because programming language give us high-level abstractions and standard libraries that are easier interfaces to program. Due to this many of us are unaware of how much kernel is doing while our program runs in the user space. 

```
strace -c echo "hello"
```
Here is a simple example where with the help of command ```strace```, we are able to see that more than 100 system calls are being involved while we try to echo the word *hello* on the screen. Syscalls like ```read```, ```write```, ```mpprotect```, ```exec```, etc. 



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
b.attach_kprobe(event=syscall, fn_name="hello") /* attach eBPF program to the event */

b.trace_print() /* loops indefintely until we stop and print the trace */
```
BCC is like a wrapper written in Python that supports BPF features and also take care of compilation of C code and connecting it to the events. 
The code consists of two parts: 
- the eBPF program written in C that will be executed at the kernel level
- some user-space code that loads the eBPF program into the kernel and reads out the trace it generates.
- the eBPF program is written in C (the function name is hello)
- the eBPF program uses a helper function called ```bpf_trace_printk()``` to write the message *Hello World!*. 
- The helper functions are set of functions that eBPF programs can call to interact with the kernel. 
- The entire eBPF program is defined as a string called ```program``` in the Python code. 
- The C program needs to be compiled before it can be executed, but BCC takes care of it. 
- The program is passed as a parameter when creating the BPF object. 
- The syscall used in the above program is ```execve```, whose job is just to execute the program.
- ```attach_kprobe``` is used to attach the eBPF program "hello" to the event "execve".


![user-kernel](https://github.com/swarnpriya/eBPF_notes/blob/main/images/helloProg.png)

- Pictorial representation:

![user-kernel](https://github.com/swarnpriya/eBPF_notes/blob/main/images/helloWorldOperation.png)
