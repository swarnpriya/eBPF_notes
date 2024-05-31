# Loops in eBPF programs

- The job of the verifier is to ensure that the program is safe to be executed at the kernel. With loops it becomes a little more complicated.
- Before v5.3, all the loops were unrolled using the compiler. In short, we can say that loops were not allowed because the verifier was not smart enough to prove termination of the program with loops. Unrolling can only be done when the bound is known at compile time.
- Since v5.3, eBPF can have bounded loops. 
- There are still programs where verifier is not able to figure out the bounds. There can be still programs with statically known bounds where the verifier does not scale well as the verifier needs to check every possible permutation of the loop. For example, suppose the bound is 1000 and the body of loop contains 20 instructions. 
- I performed some experiment to check the limit of the verifier:
  [https://github.com/swarnpriya/eBPF_notes/blob/main/eBPF_Koka/xdp_drop_prog/xdp_drop_prog.bpf.c]