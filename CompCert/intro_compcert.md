# Introduction to CompCert

- A formally verified compiler with machine-assisted mathematical proofs for its correctness and hence ensure no miscompilation issues. 
- **Semantic preservation theorem**
  - For all source program S and compiler-generated code C, 
    if the compiler, applied to the source S, produces the code C,
    without reporting a compile-time error,
    then the observable behavior of C improves on one of the allowed observable behaviors of S. 
    - S : Abstract syntax tree for CompCert C language (after preprocessing, type-checking 
          and elaboration)
    - C : Abstract syntac tree for Asm language (before assembling and linking) 
- CompCert compiler is allowed to fail in the case where source level program is not syntactically correct or have type error or it does not meet the architecture specific requirement. 
- As in C program, there is non-determinism in expression evaluation order; different orders can result in several different observable behaviors. CompCert is allowed to select one of the possible bahviors of the source program. The compiler is also allowed to improve the behavior of source program. By "improve" the behavior means the compiler can convert the run-time behavior into a more defined bahvior by using some optimizations like dead code elimination etc. 
- **Observable behaviors**
    - Everthing the user of the program, or the physical world in which it executes can see about the action of the program with the exception of execution time and memory consumption.
    - Trace of all I/O behaviors and volatile operations it performs. 
    - <font color="red">Indication of whether it terminates and how it terminates (normally or an error)</font> 
      ```
      int main() {
        int i = 1;
        while(i < 5) {
            bpf_printk("temination_check");
        }
        return 0;
      }

      ```
      - Program 1: 
        - Compiles with CompCert without any warning/error, but with -interp option it does catches 
          it as undefined behavior.
          Output: Stuck state: calling bpf_trace_printk(<ptr>, 17)
          ERROR: Undefined behavior
      ```
      int main() {
        int i = 1;
        while(i > 5) {
            bpf_printk("temination_check");
        }
        return 0;
      }

      ```
      - Program 2: 
        - Compiles with CompCert without any warning/error, but with -interp option it does says 
          that program terminates.
          Output: Time 17: program terminated (exit code = 0)
    - Event_syscall : <font color="blue">A system call recording the name of the system call, its parameters, and its result.
    
        </font> (<font color="red">All helper functions are kind of external syscalls that CompCert C uses in eBPF program. The eventval can be used to capture the ebpf properties that a specific helper function has the specific type and return value. We need to extend it to add a boolean for license and pkt_access (true: license requires/pkt_access, false: no license/no pkt_access). 
    
        Example, bpf_map_lookup_elem:

        bpf_map_lookup_elem will produce the event of form:
        Event_syscall(bpf_map_lookup_elem, (ptr to map :: ptr to key), ptr to value, license: false, pkt_access: true)</font>)
    ```
     const struct bpf_func_proto bpf_map_lookup_elem_proto = 
     {.func		= bpf_map_lookup_elem,
	  .gpl_only	= false,
	  .pkt_access	= true,
	  .ret_type	= RET_PTR_TO_MAP_VALUE_OR_NULL,
	  .arg1_type	= ARG_CONST_MAP_PTR,
	  .arg2_type	= ARG_PTR_TO_MAP_KEY,};
    ```
    - Event_vload : <font color="blue">A volatile load from a global memory location, recording the chunk
      and address being read and the value just read.</font>
    - Event_vstore : <font color="blue">A volatile store to a global memory location, recording the chunk
      and address being written and the value stored there.</font>
    - Event_annot : <font color="blue">An annotation, recording the text of the annotation and the values
      of the arguments.</font> <font color="red">Question: What kind of annotation does this captures?</font>

    ```
    Inductive eventval: Type :=
    | EVint: int -> eventval
    | EVlong: int64 -> eventval
    | EVfloat: float -> eventval
    | EVsingle: float32 -> eventval
    | EVptr_global: ident -> ptrofs -> eventval.

    Inductive event: Type :=
    | Event_syscall: string -> list eventval -> eventval -> event
    | Event_vload: memory_chunk -> ident -> ptrofs -> eventval -> event
    | Event_vstore: memory_chunk -> ident -> ptrofs -> eventval -> event
    | Event_annot: string -> list eventval -> event.

    Definition trace := list event.

    CoInductive traceinf : Type :=
    | Econsinf: event -> traceinf -> traceinf.

    ```