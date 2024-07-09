# BPF 

- BPF consists of 10 (r0 - r9) general-purpose 64 bit registers, (r10) a frame-pointer read-only register a program counter,
  and 512 bytes stack space.
- BPF program can call predefined helper functions using the following calling convention:
    - r0 contains the return value of the function and also the 
    - r1-r5 holds the arguments from BPF program to helper functions (at max there can be 5 arguments to helper functions)
    - r6-r9 are callee saved registers that will be preserved on helper function call
- BPF registers map one-to-one to hardware registers, this helps the JIT compilation to issue only call instruction
   with no extra instructions needed to move the arguments.
- Registers r1 - r5 are scratch registers, meaning the BPF program needs to either spill them to the BPF stack or
  move them to callee saved registers if these arguments are to be reused across multiple helper function calls. 
- Upon entering the execution of a BPF program, register r1 initially contains the context for the program. 
