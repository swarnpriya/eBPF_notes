#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

int counter = 0;

SEC("xdp")
float packet_count(void *ctx) {
    bpf_printk("%d", counter);
    counter++;
    return 2.0;
}

char LICENSE[] SEC("license") = "Dual BSD/GPL";

/* This program can be loaded in the kernel, but the bytecode translation takes care of inserting 
   decimal number for 2.0. The clang compiler is not able to catch it */
