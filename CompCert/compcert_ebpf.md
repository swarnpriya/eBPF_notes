# eBPF support in CompCert
- Both the source level of CompCert (Clight) and the target langauge (BPF bytecode) should have a trace producing semantics. 
- CompCert traces are composed of events recording the calls the whole program makes to system calls (helper function calls) performing IO and the results they return. 