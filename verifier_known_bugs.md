# Known Verifier Bugs:

- [Finding Correctness Bugs in eBPF verifier with Structured and Sanitized Program](http://www.wingtecher.com/themes/WingTecherResearch/assets/papers/ebpf_eurosys24.pdf)
  - Example 1: 
 
    ```
    0: r1 = map_fd0
    1: call map_lookup_elem
    2: r8 = r0 ; R8=map_value(ks=4, vs=4096)
    3: r1 = map_fd1
    4: r2 = 8192
    5: call ringbuf_reserve
    6: r1 = r0
    7: r1 += 1 ; ALU on nullable pointer here
               ; Verifier believes r0 = 0 and r1 = 0
               ; However, r1 = 1 at runtime.
    8: r1 *= -1024
    9: r8 += r1
    10: r0 = *(u64 *)(r8 + 0) ; Out-of-bounds access here
    ```
- [Linux Kernel: eBPF verifier bug](https://github.com/google/security-research/security/advisories/GHSA-j87x-j6mh-mv8v)

- [bpf: Fix incorrect verifier pruning due to missing register precision taints](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=71b547f561247897a0a14f3082730156c0533fed)
