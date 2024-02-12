# Notes
- eBPF programs are written using subset of C to make the verifiecation easier and is safe to run in the kernel.
- Loops are allowed in eBPF programs only if the bounds of the loop is statically known.
- Global variables are not allowed in the program. Instead they reply on the map which is a key-value store.
- eBPF program does not support floating-point arithmetic as they want to ensure deterministic behavior. 
- eBPF programs can only call restricted set of system calls represented as "helper functions".
