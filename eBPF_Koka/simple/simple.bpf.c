int simple() {
    return 0;
}

// clang -target bpf -Wall -O2 -c simple.bpf.c -o simple.bpf.o

/* Error while loading */
/* libbpf: failed to guess program type from ELF section '.text'
libbpf: supported section(type) names are: socket sk_reuseport/migrate 
sk_reuseport kprobe+ uprobe+ uprobe.s+ kretprobe+ uretprobe+ uretprobe.s+ 
kprobe.multi+ kretprobe.multi+ uprobe.multi+ uretprobe.multi+ uprobe.multi.s+ 
uretprobe.multi.s+ ksyscall+ kretsyscall+ usdt+ usdt.s+ tc/ingress tc/egress 
tcx/ingress tcx/egress tc classifier action netkit/primary netkit/peer 
tracepoint+ tp+ raw_tracepoint+ raw_tp+ raw_tracepoint.w+ raw_tp.w+ 
tp_btf+ fentry+ fmod_ret+ fexit+ fentry.s+ fmod_ret.s+ fexit.s+ freplace+ 
lsm+ lsm.s+ lsm_cgroup+ iter+ iter.s+ syscall xdp.frags/devmap xdp/devmap 
xdp.frags/cpumap xdp/cpumap xdp.frags xdp perf_event lwt_in lwt_out 
lwt_xmit lwt_seg6local sockops sk_skb/stream_parser sk_skb/stream_verdict 
sk_skb/verdict sk_skb sk_msg lirc_mode2 flow_dissector cgroup_skb/ingress 
cgroup_skb/egress cgroup/skb cgroup/sock_create cgroup/sock_release 
cgroup/sock cgroup/post_bind4 cgroup/post_bind6 cgroup/bind4 cgroup/bind6 
cgroup/connect4 cgroup/connect6 cgroup/connect_unix cgroup/sendmsg4 
cgroup/sendmsg6 cgroup/sendmsg_unix cgroup/recvmsg4 cgroup/recvmsg6 
cgroup/recvmsg_unix cgroup/getpeername4 cgroup/getpeername6 
cgroup/getpeername_unix cgroup/getsockname4 cgroup/getsockname6 
cgroup/getsockname_unix cgroup/sysctl cgroup/getsockopt cgroup/setsockopt 
cgroup/dev struct_ops+ struct_ops.s+ sk_lookup netfilter*/