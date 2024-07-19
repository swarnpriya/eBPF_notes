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
    - $\color{red}{\textsf{Indication of whether it terminates and how it terminates (normally or an error)}}$ 
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

          $\color{red}{\textsf{ERROR: Undefined behavior}}$

          The error is from the interpreter because it doesnot understand the "bpf_printk" at this moment. 

          $\color{red}{\textsf{CompCert doesnot catch termination at source level, but it preserves it. We have Koka type system ensuring termination, which is a great benefit here.}}$

          $\color{red}{\textsf{We need to use some static analysis tool to check termination at C level}}$
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
    - Event_syscall : $\color{blue}{\textsf{A system call recording the name of the system call, its parameters, and its result.}}$
    
        $\color{red}{\textsf{All helper functions are kind of external syscalls that CompCert C uses in eBPF program.}}$ 
        $\color{red}{\textsf{The eventval can be used to capture the ebpf properties that a specific helper function has the specific type and return value.}}$ 
        $\color{red}{\textsf{We need to extend it to add a boolean for license and pkt-access (true: license requires/pkt-access, false: no license/no pkt-access).}}$ 
    
        $\color{red}{\textsf{Example, bpf-map-lookup-elem:}}$
        $\color{red}{\textsf{bpf-map-lookup-elem will produce the event of form:}}$
        $\color{red}{\textsf{Event-syscall(bpf-map-lookup-elem, (ptr to map :: ptr to key), ptr to value, license: false, pkt-access: true)}}$

        $\color{red}{\textsf{We can also use Event-annot to capture some specific helper function properties}}$
    ```
     const struct bpf_func_proto bpf_map_lookup_elem_proto = 
     {.func		= bpf_map_lookup_elem,
	  .gpl_only	= false,
	  .pkt_access	= true,
	  .ret_type	= RET_PTR_TO_MAP_VALUE_OR_NULL,
	  .arg1_type	= ARG_CONST_MAP_PTR,
	  .arg2_type	= ARG_PTR_TO_MAP_KEY,};
    ```
    - Event_vload : $\color{blue}{\textsf{A volatile load from a global memory location, recording the chunk and address being read and the value just read.}}$
    - Event_vstore : $\color{blue}{\textsf{A volatile store to a global memory location, recording the chunk and address being written and the value stored there.}}$
    - Event_annot : $\color{blue}{\textsf{An annotation, recording the text of the annotation and the values
      of the arguments.}}$ $\color{red}{\textsf{Question: What kind of annotation does this captures?}}$

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