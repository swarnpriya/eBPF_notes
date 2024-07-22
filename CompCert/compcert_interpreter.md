# CompCert Interpreter
- The CompCert C interpreter executes the given C source file by interpretation, displaying the outcome of the execution (normal termination or aborting on an undefined behavior), as well as the observable effects (eg printf calls are printed as syscall events) performed during the execution.
- The interpreter is faithful to the formal semantics of CompCert.
- It immediately stops and reports when undefined behavior is encountered. 
- In case of compilation, the machine code can crash in case of undefined behavior or it can continue with some other defined behavior for that case. The interpreter is used to check whether a run of a C program exhibits behaviors that are undefined in CompCert C. 
- By default, the interpreter evaluates a C expression following a fixed, left-to-right evaluation order. 
- **-random**: Randomize execution order of the interpreter. 
- **-all** : Explore in parallel all evaluation orders allowed by the semantics of CompCert C, displaying all possible outcomes of the input program. Very costly. 

## Limitations:
- The C source files must contain a complete, standalone program, including in particular main function. 
- The only extenal functions allowed are: 
    - printf
    - malloc
    - free
    - __builtin_annot (mark execution points)
    - __builtin_annot_intval 
    - __builtin_fabs 

### Add example:  