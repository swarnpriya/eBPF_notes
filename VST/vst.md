# Verifiable C 

- A program logic (high-order impredicative concurrent separation logic, symbolic execution, entailement solving) for C programs with these restrictions:
    - No casting between integers and pointers 
    - No goto statements 
    - No bitfields in structs. 
    - No struct-copying assignments, struct parameters, or struct returns.
    - Only structured switch statements 
    - ..
- Concurrent seperation logic verifier in Coq (based on Iris)
- The Verifiable C program logic operates on the CompCert Clight language. 
- CompCert's clightgen tool translates C into Clight. 
    - clightgen -normalize file.c (produces file.v (representing the AST of file.c expressed in Coq))
- The CompCert verified C compiler translates standard C source programs into an abstract syntax for CompCert C, and then translates that into abstract syntax for C light. Then VST Seperation Logic is applied to the C light abstract syntax. 
- Clight programs proved correct using the VST seperation logic can then be compiled (by CompCert) to assembly language. 

## Workflow
- Write a C program File.c
- Run clightgen -normalize File.c to translate it inot a Coq file File.v
- Write a verification of File.v in a file such as verify_File.v. This file must import File.v and the VST Floyd program verification system, VST.floyd.proofauto.

## Functional model, API spec
- verify_File.v contains the specification of File.c and the proof of correctness of the C program with respect to that specification. 
- For larger programs, we can break this verification file into three or more files:
    - Functional model (often in the form of Coq function)
    - API specification 
    - Function-body correctness proofs, one per file.

## VST notion for reasoning about memory 
- To match with CompCert semantics and its memory model, VST takes into consideration about various permissions used along with memory accesses in CompCert.
    - Lattice: $\bot$ < unreadable < readable < writable < $\top$
- It uses seperation logic (IRIS as the current support) to reason about memory.

