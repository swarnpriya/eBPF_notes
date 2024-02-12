# eBPF program
- The program written in eBPF that counts the network packets.

```
#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

int counter = 0;

SEC("xdp")
int packet_count(void *ctx) {
    bpf_printk("%d", counter);
    counter++;
    return XDP_PASS;
}

char LICENSE[] SEC("license") = "Dual BSD/GPL";
```

## How to run and print the output?

# Notes:
- Packet processing is a very common application of eBPF. 