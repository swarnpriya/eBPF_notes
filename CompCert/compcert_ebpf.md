# eBPF support in CompCert
- Both the source level of CompCert (Clight) and the target langauge (BPF bytecode) should have a trace producing semantics. 
- CompCert traces are composed of events recording the calls the whole program makes to system calls (helper function calls) performing IO and the results they return.
  - If we allow exposing pointers in the trace then it would complicate back-translation proofs and memory injection.
 
## SECOMP:
- SECOMP extended the CompCert's syscall events to record any bytes loaded from or stored to global memory buffers
  - Event-syscall name $\overline{v}$ $\overline{bs}$ v $\overline{bs}$
