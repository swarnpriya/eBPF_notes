# Summary of verification carried out for eBPF:
- eBPF are compiled to a restricted bytecode, upon which the eBPF verifier performs a range of verification using symbolic execution. 
  - Via symbolic execution, the verifier examines all the possible program paths and guarantee properties like 
    - Memory safety 
    - Freedom from crashes 
    - Proper resource aquisition and release
    - Termination 
    - ...
- Several drawbacks:
  - Not formally-verified 
  - State-explosion problem
  - Helper function's verification not supported

- Idea:
  - Write the kernel extension using the Rust programming language, because of its approach to safety - including but not limited to memory safety, undefined behavior, and resource ownership.
    - Use safe Rust to write eBPF programs and the Rust compiler takes the role of the verifier to ensure that the code is safe.
    - In addition to memory and integer safety, Rust programs also provide safe acquisiton and release.
  - A trusted userspace Rust toolchain to sign extensions and leverage secure key bootstrap mechanisms to validate signatures at load time.
  - A lightweight run-time mechanisms that complement Rust to achieve properties, such as program termination, that are not easy to do statically without severely impacting expressiveness.

- Summary:
  - No arbitrary memory access - Langauge safety
  - No arbitrary control-flow transfer - Language safety
  - Type safety - Language safety
  - Safe resource management - Runtime protection
  - Termination - Runtime protection
  - Stack protection - Runtime protection
