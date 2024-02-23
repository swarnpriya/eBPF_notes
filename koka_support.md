# eBPF in Koka
## Datatype support needed in Koka:
- Primitive datatypes:
  - Maps
    - Plan A
      - Vector datatype exists in Koka
      - One way is we can build a Map datatype using a vector datatype, but it will require building a collision resistance hash function.
      - This requires no compiler change but not so desirable way in terms of how other datatypes are defined in Koka.
    - Plan B
      - Add map datatype and extend the koka compiler
  - Arrays
- eBPF specific data types:
  - XDP_type:
    - XDP_ABORTED 
    - XDP_DROP
    - XDP_PASS
    - XDP_TX
    - XDP_REDIRECT
  These types are used in writing programs related to network packets.
  For example, if using the eBPF program we want to ensure to discard some packets based on the conditions we provide in our user-space program.
  In that case, the program after aborting a packet will return the value XDP_ABORTED of type XDP_type.
  - ...

### Why map is important for eBPF programs?
- The eBPF program sends the print messages to "/sys/kernel/debug/tracing/tacepipe". 
  A single trace pipe location is fine for a simple “Hello World” example or basic debugging purposes.
  There is very little flexibility in the format of the output, and it only supports the output of strings.
- If we had multiple eBPF programs running simultaneously, they would all write trace output to the same trace pipe,
  which could get very confusing for a human operator.
- The solution is **BPF maps** :
  - A data structure that can be accessed from the user space and eBPF programs.
  - Examples:
    - sockmaps, devmaps: Holds information about sockets and network devices and can be used by network-related eBPF programs.
    - program arraymaps: Holds sets of indexed eBPF programs used to implement tail calls.
    - ....

## Features support needed in Koka:
- Model the helper functions
  - bpf_printk: A very simple helper function to print the string, but its semantics states that it always prints to "/sys/kernel/debug/tracing/tacepipe".
    We need to ensure this in Koka and extend the compiler to translate it to the corresponding C function. 
- SEC("..."):
  - Every eBPF program has a section that sends hints to the compiler to place a symbol in a specific section of the resulting eBPF object binary.
  - SEC name determines its program type, affecting the way the program is verified by the kernel and defining what the program is allowed to do.
  - For example, in the eBPF program related to network packets, the SEC name should be "XDP".
  - Add the "SEC" feature in Koka and extend the compiler to translate it to the C "SEC".
- Modeling various contexts/structures related to specific features:
  - "xdp" programs utilize the "xdp_md" data structure to inquire about the basic properties of the packet.
    For example, what is the base address, what amount of memory the packet should take, and so on?
  - Add the types in Koka and extend the compiler to translate it to the corresponding C type.

## Extend the Koka compiler to compile all the new datatypes and features
- Write the koka part
- Write the C part 
- Extend the compiler to add the translation from koka to C

## What do we need to do on the Koka side?: 
- The supports mentioned above are needed to write a simple "hello world" and a network counting" program.
- The compiler needs to be extended to support the translation of these datatypes and functions from Koka to C.
- The eBPF program written in C can be loaded, hooked with events, and executed in the kernel using the bpftool from the command line.
  But there are some implementations in C that model this bpftool work entirely in C. We can also support this in Koka but that will be a later part.

## Plan: 
- Need to understand Koka on how to add new functions and datatypes. Somewhat I am becoming more comfortable in this part and can figure it out.
- Need to understand the Koka compiler to extend it. (Hard part)
  It is not very straightforward to understand because it is not a compiler from high-level to assembly (like a traditional compiler design).
  It is very much like a translator and involves a lot of concepts like boxing/unboxing, borrowing while translating the types, and so on.
- Understand more eBPF parts as I move forward.

## Questions to figure out?
- What benefits/advantages we will gain over implementations in Rust or Go if we do it in Koka?
  I understand that a strong type system will help in providing stronger guarantees at compile time but in what way this approach will be better than the existing one?
  - Need to learn a bit about features of Rust and what they could provide for eBPF programs at static and runtime to make a clear distinction that
    Koka programs can do better than Rust programs in terms of verification.
  - I don't have a very clear picture of it as of now. Maybe Tim has a better understanding and it would be nice to note it somewhere as a draft. 
- If we are successful in adding helper functions, eBPF types, etc in Koka and translating it to C
  then can we still guarantee the properties of the source level at the compilation level? How to answer this question?
  - Write paper-based proofs for preservation.
  - Add mechanized proofs to ensure it.
- How much effort and time it will take for me to make all these changes in Koka and its compiler?
  - This we can only figure out more after adding support for at least a few datatypes and features.
 
## Koka vs Rust
- Koka compiler uses "Optimized Reference Counting: Perceus" for memory management and does not utilize garbage collection or manual memory management mechanism.
  Rust uses manual memory management? This figure (taken from Koka manual) is misleading. I think Rust also uses reference counting memory management but may be not as efficient as in Koka. 
  ![memorymanage](https://github.com/swarnpriya/eBPF_notes/blob/main/koka%3Arust%3Ac%3Ac.png)
- Koka provides strong compile-time guarantees in order to enable efficient reference-counting at run-time.
  - Reference counting tracks the references to an object.
  - Makes the memory management much more automatic.
  - Reference counting algorithm in Koka supports:
    - Precise: An object is freed as soon as no more references remain.
      - Ownership of references is passed down into each function
      - Memory usage is halfed:

        For example, in a code like
        ```
        fun foo() {
          val xs = list(1, 1000)
          val ys = map(xs, inc)
          print(ys)
          drop(xs)
          drop(ys)
        }
        ```
        This code retains the xs till later stage, until ```print``` happens (maintaing two spot in memory for xs and ys).
        But in Koka, the reference of ```xs``` is passed onto map and reference of ```ys``` is passed to ```print```.
        ```
        fun foo() {
          val xs = list(1, 1000)
          val ys = map(xs, inc)
          print(ys)
        }
        ```
        There is no ```drop``` needed in foo function as freeing all the local variables will be taken care by the function map and print.
        map and print function drop the list elements as they go. The list ```xs``` is deallocated while the new list ```ys``` is being allocated. 




  
