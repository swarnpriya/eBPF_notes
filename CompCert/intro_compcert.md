# Introduction to CompCert

- A formally verified compiler with machine-assisted mathematical proofs for its correctness and hence ensure no miscompilation issues. 
![compcert_overview](compcert_image)
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

          $\color{red}{\textsf{CompCert doesnot catch termination at source level, but it preserves it.}}$ 
          $\color{red}{\textsf{We have Koka type system ensuring termination, which is a great benefit here.}}$

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
- **Annotations (Event annot)**
  - CompCert C provides a general mechanism to attach free-form annotations (text messges possible mentioning values of the variables) to C program points.
  - Annotations are preserved by the compiler to the assembly.
  - __builtin_annot statements offer a general and flexible
    mechanism to mark program points and local variables in C source files, then track them all the way to assembly language. For CompCert, calling these annotation functions are like calling an external variadic function like printf. In contrast to printf most format specifiers are tagged with numbers and refer to a specific argument independent of the order. It is also possible to refer to an argument more than once.
  - **Motivation for adding these annotations to CompCert:**
    - Several anaylsis tool works directly at the executable mahcine code rather than at the C source level. 
    - To analyze code at the lower level, often the tool needs some extra information from the programmer that can not be reconstructed at the lower level.
    - Motivating example: 
      ```
        int bsearch(int tbl[100], int v) {
          int l = 0, u = 99;
          while (l <= u) {
            int m = (l + u) / 2;
            if (tbl[m] < v) l = m + 1;
            else if (tbl[m] > v) u = m - 1;
            else return m;
          }
          return -1;
        }
      Specifications: 
        - The array access should be between 0 and 99.
        - If we are interested in computing the WCET, 
          the while loop executes at most [log(100)] = 7. 
      aiT analyzer: 
        - Computes the WCET and it needs these two 
          information from the programmer, which needs to be
          given at assembly level.
            - loop at "bsearch" + 0x14 max 7
            - instruction at "bsearch" + 0x28 
              is entered with r4 = (0,99)
      ```
    - Annotation in CompCert:
      ```
      int bsearch(int tbl[100], int v) {
        int l = 0, u = 99;
        __builtin_annot("loop max 7");
        while (l <= u) {
          int m = (l + u) / 2;
          __builtin_annot("entered with %1 = (0,99)", m);
          if (tbl[m] < v) l = m + 1;
          else if (tbl[m] > v) u = m - 1;
          else return m;
        }
        return -1;
        }
      - Generated Assembly:
        ...
        4 bsearch:
        5 0000 9421FFF0 stwu r1, -16(r1)
        6 0004 7C0802A6 mflr r0
        7 0008 90010008 stw r0, 8(r1)
        8 000c 39200000 addi r9, 0, 0
        9 0010 39400063 addi r10, 0, 99
        10 # annotation: loop max 7
        11 .L100:
        12 0014 7C095000 cmpw cr0, r9, r10
        13 0018 41810040 bt 1, .L101
        14 001c 7CE95214 add r7, r9, r10
        15 0020 7CE50E70 srawi r5, r7, r1
        16 0024 7CA50194 addze r5, r5
        17 # annotation: entered with r5 = (0,99)
        18 0028 54A8103A rlwinm r8, r5, 2, 0, 29 # 0xfffffffc
        19 002c 7CC3402E lwzx r6, r3, r8
        20 0030 7C062000 cmpw cr0, r6, r4
        21 0034 4180001C bt 0, .L102
        ...
      - Information:
        - ebpf/test/simpl_test/bsearch.c: error: 
          In function bsearch: Builtin annot is not 
          supported by eBPF 1 error detected.
      ```
    - Notation of Annotations:
      - __builtin_annot: Take as arguments a string literal and zero, one   or several local variables.
      - Annotation consist of the string literal carried by the annotation, where positional parameters %1, %2, etc, are replaced by the locations (processor registers or stack slots) of the corresponding variable
      - void __builtin_annot(const char* msg, ...) : The first argument must be a string literal. It can be followed by arbitrarily many additional arguments, of integers, pointer or floating-point types.
      arguments.
        - %n : %n sequences are replaced by the machine location containing the value of the n-th additional argument, or by its value if the n-th additional argument is a compile-time constant
        expression of numerical type.
        - The location of an argument is either a machine register, an integer or floating-point constant, the name of a global variable, or a stack memory location of the form mem(sp + offset, size) where sp is the stack pointer register, offset a byte offset relative to the value of sp, and size the size in bytes of the argument.
        - It is highly recommended to use only non-volatile  variable names or constant expressions as additional parameters to __builtin_annot. 
      - int __builtin_annot_intval(const char * msg, int x) : In contrast with __builtin_annot, which is used as a statement, __builtin_annot_intval is intended to be used within expressions, to track the location containing the value of a subexpression and return this value unchanged. 
        - In the compiled code, __builtin_annot_intval evaluates its argument x to some temporary register, then inserts an assembly comment equal to the text msg where occurrences of %1 are replaced by the name of this register.
        - Example: 
          int x = tbl[__builtin_annot_intval("entered with %1=(0,99)", (lo + hi)/ 2)];

  - Information:
    - $\color{red}{\textsf{error: 
      In function bsearch: Builtin annot is not 
      supported by eBPF 1 error detected.}}$
  - Examples: 
    ```
      static void func(int count)
      {
        int i;
        for (int i = 0; i < count; i++) {
          __builtin_ais_annot("try loop %here bound: %e1;", count);
          ...
        }
        ...
      }
    - If constant propagation can prove that count is 
      always zero, CompCert can remove the whole loop since 
      it will never be executed. In such a situation the 
      annotation will also be removed. In contrast to this, 
      a conventional source code annotation via special 
      formatted C comments (e.g. // ai: …) would remain visible 
      and probably cause problems since a3 collects such 
      annotations by scanning the source code.
    ```

    ```
    - Specifying a time bound for a busy waiting loop
    void openCanSocket(volatile struct device_t* device)
    {
      ...
      // Busy wait for ACK. Assume a worst-case timing of 23 us
      while(device->bus_data != 0x00) {
        __builtin_ais_annot("try loop %here takes: 23 us;");
      }
      ...
    }
    ```
    ```
    - Providing unrolling hints for loops for improved 
      precision in a3:

    void strcpy_x(char s[], char t[])
    {
      int i = 0;
      while (( s[i] = t[i] ) != '\0') {
        __builtin_ais_annot("try loop %here 
        mapping { default unroll: 50; }");
        ...
      }
    }
    ```


- **Function signature**
  - Return type of eBPF program should be ``int``
    - In CompCert, a function has a signature
      ```
        Record function : Type := mkfunction {
          fn_return: type;
          fn_callconv: calling_convention;
          fn_params: list (ident * type);
          fn_vars: list (ident * type);
          fn_temps: list (ident * type);
          fn_body: statement
        }.
      ```
    - $\color{red}{\textsf{We can harcode that fn-return is always int.}}$ $\color{red}{\textsf{And add type preservation lemma in each compiler pass.}}$
    - $\color{red}{\textsf{In CompCert, if the return type of main is anything other than int then it generates a warning}}$
    - $\color{red}{\textsf{warning: return type of 'main' should be 'int' [-Wmain-return-type]}}$