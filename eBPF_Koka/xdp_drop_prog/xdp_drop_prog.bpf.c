#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>
#include <linux/if_ether.h>
#include <arpa/inet.h>

#define ETH_P_IPV4	0x0800

static int do_check(__u32 index, struct xdp_md *search_ctx) {
    bpf_printk("The value of h_proto is %d", index);
    return 0;
}

SEC("xdp")
int xdp_drop_prog(struct xdp_md *ctx)
{
    void *data_end = (void *)(long)ctx->data_end;
    void *data = (void *)(long)ctx->data;
    struct ethhdr *eth = data;
    __u16 h_proto;

    int arr[1024] = {1,};
    int sum = 0;
    for (int i =0; i < 1024; i++) {
        arr[i] = i + (int) h_proto;
        sum += arr[i];
    }

    if (data + sizeof(struct ethhdr) > data_end)
        return XDP_DROP;

    h_proto = eth->h_proto;
    // works for <65535 but not for h_proto as it will be a dynamic value
    // But verifier was not smart enough to compute from the type of h_proto that the max permutation canbe 65535
    //for (int i = 0; i < h_proto; i++) {
    //    bpf_printk("The value of h_proto is %d", h_proto);
    //}
    // 8 million
    bpf_loop(100000000, do_check, &ctx, 0);
    if (h_proto == htons(ETH_P_IPV4))
        bpf_printk("There is an ipv4 packet and sum is %d\n", sum);
        return XDP_PASS;

    return XDP_DROP;
}

char _license[] SEC("license") = "GPL";

/* Error message from the verifier after running for 100 hours:
    “BPF program is too large. Processed 1000001 insn
    processed 1000001 insns (limit 1000000) max_states_per_insn 4 total_states 76923 peak_states 7 mark_read 2
    -- END PROG LOAD LOG --
    libbpf: prog 'xdp_drop_prog': failed to load: -7
    libbpf: failed to load object 'xdp_drop_prog.bpf.o'
    Error: failed to load object file”
*/