#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

int counter = 0;

SEC("xdp")
void error_packet_count(void *ctx) {
    bpf_printk("%d", counter);
    counter++;
    return;
}

char LICENSE[] SEC("license") = "Dual BSD/GPL";
