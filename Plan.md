# Project overview
(1) Add a new source-level language to write eBPF program called koka++. 

![project_overview](eBPF_existing_languages.png)



![project_overview](pictorial_view_of_project.png)



## Property preservation by byte-code

## Approach 1: 
### Specification language:
- We need a specification language to specify the properties of interest.
  - DIV x y : 
    - Specification: y != 0, no overflow in case of signed division (-128/-1 = 128 leads to overflow in 8 bits.) (**Disallow division by zero**)
  - MOD x y:
    - Specification: y != 0, no overflow in case of signed division (-128/-1 = 128 leads to overflow in 8 bits.) (**Disallow division by zero**)
  - LOAD addr:
    - Specifications: addr ahouls be aligned, addr should be valid and in range. (**Disallow out of bound memory access**)

- Safety condition generator:
  - **Generate_safety_cond(BI) = {s1, s2, ..., sn}**, where BI is an byte-code instruction and si is the safety condition.
  
### Semantic and Proof language:
- If a BPF bytecode program meets the specification then it will always reach an ```ok``` state.
- Formalize the execution of BPF Bytecode programs as state machines.
  - Single step execution (For one BI instruction)
  - Multi step execution (For a sequence of BI instruction)
- **Sem(P), st --> st'**, where P is a sequence of BI and st represents the state which can be ```ok``` or ```error```
- Proof
  - **BI |= s ->
    Sem(BI), st --> ok st'** (Single step rule)
    
    - Example: In case of division operation, the semantic will only reach the ```ok``` state if the divisor is non-zero and result should not overflow in case of signed division (**BI |= s**). 
  - **P |= s ->
    Sem(P), st --> ok st'** (Multi step rule, which can be proved using indution hypothesis)
- **A safe BPF byte code program never gets to a stuck/error state.**

### Proof checker:
- Any safe BPF bytecode program written in this language will never reach a stuck state.
- One way is to manually prove each program written in the language specified above.
- Use symbolic execution/abstract interpretation to generate the proof.
- Then we validate the proof.

### Note
- Prior work "Exoverifer", "Serval" and "Jitterbug" implements this approach in Lean

#### Properties verified by Exoverifier:
- ALU64_X op dest src :
    - op((scalar_value x), (scalar_value y))
        -
          ```
          def doALU64_scalar_check : ALU → i64 → i64 → bool
          | DIV x y  := y ≠ 0 -- Disallow division by zero.
          | MOD x y  := y ≠ 0 -- Disallow mod by zero.
          | LSH x y  := y < 64 -- Prohibit oversized shift.
          | RSH x y  := y < 64 -- Prohibit oversized shift.
          | ARSH x y := y < 64 -- Prohibit oversized shift.
          | END x y  := ff -- Disallow endianness conversion for now TODO
          | _ x y    := tt
          ```
     - op((pointer p), (scalar_value y))
       -
         ```
         def doALU_pointer_scalar_check : ALU → bool
        | ADD := tt
        | SUB := tt
        | MOV := tt
        | _   := ff

         ```
#### Properties not verified by Exoverifier:
- No checks on loads and stores (grammar for Exoverifier seems to be incomplete)
- No helper function check: It is dangerous as even the verified code using the BPF verifier will interact with unverified helper function at the 
  kernel level to read/write to various kernel level data structure.
- No guarantees on mitigation against side-channel attacks
- Basically it boils down to formally verfying the current BPF verifier using formal method techniques.
     - This helped them to find some error in the verifier like semantical error in the operators and not capturing relations between regsiters.

## Approach 2:
### Bisimulation mechanism: 

### Specification language for both Koka++ and BPF Bytecoce:

  - We need a specification language at the Koka++ level (source level)
    - Formalizing Koka++
    - Formalizing the type system and specification language for Koka++
    - ```
      P_koka++ |- ty ->
      P_koka++ |= s ->
      exists st', Sem(P_koka++), st --> ok st' 
      ```
      The above theorem ensures safety of Koka++ language, let it be called as **safe(P_koka++)**.

### Semantics and Proof language: 
- We need a language at the BPF bytecode level to specify the semantics and syntax.
- A notion of specifications at bytecode level specifying what is meant by **safe(P_BPFBC)**
    - Will be like what is explained in approach 1.
      - Define the type system at BPF bytecode level
      - Define the safety condition generator at the BPF bytecode level
- 
  ```
   safe(P_koka++) ->
   safe(P_BPFBC)
  ```

- Write the verifier/type-system/safety-checker in Coq which act like a push button. 
  - **Verifier(P_BPFBC) = true/false** and **Verifier(P_koka++) = true/false**
  - Prove the correctness of the verifier once and forall
    ```
    Verifier(P_koka++)= true ->
    safe(P_koka++)
    ```
    ```
    Verifier(P_BPFBC)= true ->
    safe(P_BPFBC)
    ```

### Advantages of approach 2 as compared to approach 1
- This guarantees stronger tool support at the source level, which might help the programmer to write and debug eBPF programs more neatly as compared to debugging at bytecode level.
- Stronger guarantees than existing approach at compile time.
- Support for verifying the helper functions
- Formally verified type system and safety checker for its correctness and soundness
- End-to-end guarantees from source to bytecode level.

## Useful references for bytecode formalization:

- [BPF virtual machine in Rust](https://github.com/qmonnet/rbpf)
- [Exoverifier](https://github.com/uw-unsat/exoverifier)
- [BPF and XDP Reference Guide BPF Architecture: Cilium](https://docs.cilium.io/en/stable/bpf/architecture/#instruction-set)
- [BPF standard documentation](https://github.com/ietf-wg-bpf/ebpf-docs)
- [Jitterbug](https://github.com/uw-unsat/jitterbug)
- [BPF grammar linux](https://www.kernel.org/doc/html/next/bpf/instruction-set.html)
- [Memory management in Rust](https://medium.com/geekculture/understanding-memory-management-in-rust-a341cfce9807)


## Would Koka to C with hints approach differ from Exoverifier and Jitterbug, and if so, how?
Answer is yes in the following ways:

  - This approach provides a stronger tool support for verification (more support at compile time) at high-level language (Koka) as compared to
    Exoverifier/Jitterbug which works on BPF bytecode level. It is hard for programmer to debug the code at lower-level as compared to at higher- 
    level.
  - Exoverifier/Jitterbug boils down to formally verifying the current verifier and removing the bugs, ensuring completeness/soundness for the      
    verifier through utilizing the formal specifications and proofs written in Lean (though Jitterbug carries out the verification till the     
    assembly). It mainly aims in making the current verifier bug free and complete but does not enhance the capabilities of the verifier. For 
    example, ensuring verification for "helper functions". The current eBPF verifier does not verify the helper function. If there are BPF calls 
    (helper functions) used in the user-space code, the verifier totally bypasses it if the rest of the program is safe. Using the strong type-system 
    in Koka, we can also aim to ensure typing and safety properties for these helper functions.
  - The hints generated at C-level can make the verification at the C-level doable (not sure at this point how this works, need to read more in this 
    direction). Frama-C seems quite interesting to me. I will read more about it. But also, why don't we aim to prove that the properties at source- 
    level is satisfied at byte-code level instead of at C-level? I assume the overall goal will be to preserve the high-level guarantee till the low- 
    level, so why not target the bytecode level instead of C. As there is no guarantee of preservation from the compiler that translates from C to 
    bytecode, we will need to ensure these properties at bytecode level.
  - Side-channel protections are also a major difference as Exoverifier, Jitterbug or Serval do not provide these protections. (a separate paper)

## Koka approach vs Rust approach?
  - Koka can reason about termination because of its strong type system and the type declarations in Koka is limited to finite inductive types. Rust 
    does not provide termination guarantees.
  - Rust provides memory aquire and release features like acquire and drop. The ownership works using these rules in Rust:
      - Each value in Rust has an owner.
      - There can be only one owner at a time.
      - When the owner goes out of scope, the value will be dropped using the drop function which is implicit in case of primitive datatypes. But in 
        the case of custom data types, the drop functions need to be manually defined and are automatically called by compiler when the object goes 
        out of scope.
        
    However, for eBPF programs calling the user-defined destructors is not safe at Kernel-level. Because if it is not correctly/safely implemented
    then it might crash the kernel or do unwanted stuff at the kernel-level memory. Goal will be to do memory management in a safer way using Koka.
  - Stack protection at compile time will be achieved in Koka in the similar manner as done in Rust.
  - Side-channel protection not supported in Rust for eBPF, maybe we can support this using Koka approach (a separate paper).

