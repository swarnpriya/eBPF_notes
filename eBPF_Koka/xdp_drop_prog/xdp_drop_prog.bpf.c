#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>
#include <linux/if_ether.h>
#include <arpa/inet.h>

#define ETH_P_IPV4	0x0800

SEC("xdp")
int xdp_drop_prog(struct xdp_md *ctx)
{
    void *data_end = (void *)(long)ctx->data_end;
    void *data = (void *)(long)ctx->data;
    struct ethhdr *eth = data;
    __u16 h_proto;

    if (data + sizeof(struct ethhdr) > data_end)
        return XDP_DROP;

    h_proto = eth->h_proto;
    // works for <65535 but not for h_proto as it will be a dynamic value
    for (int i = 0; i < h_proto; i++) {
        bpf_printk("The value of h_proto is %d", h_proto);
    }
    if (h_proto == htons(ETH_P_IPV4))
        bpf_printk("There is an ipv4 packet");
        return XDP_PASS;

    return XDP_DROP;
}

char _license[] SEC("license") = "GPL";