# Memory Access Verification 
- The eBPF verifier performs a number of checks on the eBPF program to ensure correctness and reliability. One of them is memory access check.
- Memory access verification ensures that the eBPF program only access the memory it is suppose to have access to. For example, when processing a network packet, an XDP program is only permitted to access the memory locations that make up that network packet. 
```
SEC("xdp")
int xdp_load_balancer(struct xdp_md *ctx) {
    void *data = (void *)(long)ctx->data;
    void *data_end = (void *)(long)ctx->data_end;
    bpf_printk("%x", data_end);
    return XDP_PASS;
}
```

The xdp_md structure passed as the context to the program describes the network packet that has been received. The ```ctx->data``` field within that structure is the location in memory where the packet starts and ```ctx->data_end``` is the last location in the packet. 

The job of the verifier is to ensure that the program doesn't exceed these bounds related to memory.

## Checking Pointers Before Dereferencing Them
- The eBPF verifier requires all pointers to be checked before they are dereferenced so that crash that occurs due to referencing a null pointer does not occur. 
