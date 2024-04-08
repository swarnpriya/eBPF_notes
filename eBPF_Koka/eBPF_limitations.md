# Limitations of eBPF programs

- The eBPF calling convention is defined as follows: (11 64 bit registers with 32 bit subregisters, a pc, 512 byte large stack space)
    - ```r0``` :
       + contains the return value of a helper function call
       + the exit value for BPF program is defined by the type of the program
       + when handing execution back to the kernel, the exit value is passed as a 32 bit value
    - ```r1``` to ```r5``` : hold arguments from BPF program to kernel helper function
    - ```r6``` to ```r9``` : called saved registers that will be preserved on helper function call.
- **Helper function calls with more than 5 arguments are not supported.**
- **BPF programs are restricted to work on a single context.**
    + The context of the program is defined by the program type.
- Upon entering execution of a BPF program, register ```r1``` initially contains the context for the program.
- Maximum number of instructions should be ```4096``` BPF instructions, which ensures that any program will terminate quickly. (Maybe increased now)
    + No non-static bounds loops allowed.
    + Tail calls (a mechanism that allows one BPF program to call another, without returning back to the old program) are limited to 33 calls.
        + Only programs of the same type can tail call.
- All BPF handling such as loading of programs into the kernel or creation of BPF maps is managed through a central ```bpf()``` system call.
    + Manages map entries (lookup/update/delete)
    + Making programs as well as maps persistent in the BPF file system through pinning.
    + ...
-  Available helper functions may differ for each program type.
    + BPF programs attacked to sockets can only call into a subset of helpers compared to BPF programs attached to the tc layer.
- **eBPF programs allows only register ```r0``` to be used as return value, hence it does not support multiple return value.**
- eBPF programs cannot access instruction pointer or return address.
- eBPF programs cannot access stack pointer (only frame pointer is accessible). The BPF compiler make use of ```r11``` to store stack pointer but the program cannot access it.
- **The return type of a program needs to be an int.**
    + eBPF programs return value in register ```r0``` no matter what the function return type is, hence it tries to read register ```r0``` for 
      returning before exit instruction. If it is uninitialized, the verifier throws an error.
- **No call to malloc/dynamic memory allocation in eBPF programs**
    + Programs that use maps, arrays etc. uses helper functions to perform the allocation in memory. 

## References
- [Q&A kernel](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/bpf/bpf_design_QA.rst)
- [Cilium doc](https://docs.cilium.io/en/latest/bpf/architecture/)
- [sysdig](https://sysdig.com/blog/the-art-of-writing-ebpf-programs-a-primer/)
