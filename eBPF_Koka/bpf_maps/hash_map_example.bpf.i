# 1 "hash_map_example.bpf.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 361 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "hash_map_example.bpf.c" 2
# 1 "/usr/include/linux/bpf.h" 1 3 4
# 11 "/usr/include/linux/bpf.h" 3 4
# 1 "/usr/include/linux/types.h" 1 3 4




# 1 "/usr/include/x86_64-linux-gnu/asm/types.h" 1 3 4
# 1 "/usr/include/asm-generic/types.h" 1 3 4






# 1 "/usr/include/asm-generic/int-ll64.h" 1 3 4
# 12 "/usr/include/asm-generic/int-ll64.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/asm/bitsperlong.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/asm/bitsperlong.h" 3 4
# 1 "/usr/include/asm-generic/bitsperlong.h" 1 3 4
# 12 "/usr/include/x86_64-linux-gnu/asm/bitsperlong.h" 2 3 4
# 13 "/usr/include/asm-generic/int-ll64.h" 2 3 4







typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;


__extension__ typedef __signed__ long long __s64;
__extension__ typedef unsigned long long __u64;
# 8 "/usr/include/asm-generic/types.h" 2 3 4
# 2 "/usr/include/x86_64-linux-gnu/asm/types.h" 2 3 4
# 6 "/usr/include/linux/types.h" 2 3 4



# 1 "/usr/include/linux/posix_types.h" 1 3 4




# 1 "/usr/include/linux/stddef.h" 1 3 4
# 6 "/usr/include/linux/posix_types.h" 2 3 4
# 25 "/usr/include/linux/posix_types.h" 3 4
typedef struct {
 unsigned long fds_bits[1024 / (8 * sizeof(long))];
} __kernel_fd_set;


typedef void (*__kernel_sighandler_t)(int);


typedef int __kernel_key_t;
typedef int __kernel_mqd_t;

# 1 "/usr/include/x86_64-linux-gnu/asm/posix_types.h" 1 3 4






# 1 "/usr/include/x86_64-linux-gnu/asm/posix_types_64.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/asm/posix_types_64.h" 3 4
typedef unsigned short __kernel_old_uid_t;
typedef unsigned short __kernel_old_gid_t;


typedef unsigned long __kernel_old_dev_t;


# 1 "/usr/include/asm-generic/posix_types.h" 1 3 4
# 15 "/usr/include/asm-generic/posix_types.h" 3 4
typedef long __kernel_long_t;
typedef unsigned long __kernel_ulong_t;



typedef __kernel_ulong_t __kernel_ino_t;



typedef unsigned int __kernel_mode_t;



typedef int __kernel_pid_t;



typedef int __kernel_ipc_pid_t;



typedef unsigned int __kernel_uid_t;
typedef unsigned int __kernel_gid_t;



typedef __kernel_long_t __kernel_suseconds_t;



typedef int __kernel_daddr_t;



typedef unsigned int __kernel_uid32_t;
typedef unsigned int __kernel_gid32_t;
# 72 "/usr/include/asm-generic/posix_types.h" 3 4
typedef __kernel_ulong_t __kernel_size_t;
typedef __kernel_long_t __kernel_ssize_t;
typedef __kernel_long_t __kernel_ptrdiff_t;




typedef struct {
 int val[2];
} __kernel_fsid_t;





typedef __kernel_long_t __kernel_off_t;
typedef long long __kernel_loff_t;
typedef __kernel_long_t __kernel_old_time_t;
typedef __kernel_long_t __kernel_time_t;
typedef long long __kernel_time64_t;
typedef __kernel_long_t __kernel_clock_t;
typedef int __kernel_timer_t;
typedef int __kernel_clockid_t;
typedef char * __kernel_caddr_t;
typedef unsigned short __kernel_uid16_t;
typedef unsigned short __kernel_gid16_t;
# 19 "/usr/include/x86_64-linux-gnu/asm/posix_types_64.h" 2 3 4
# 8 "/usr/include/x86_64-linux-gnu/asm/posix_types.h" 2 3 4
# 37 "/usr/include/linux/posix_types.h" 2 3 4
# 10 "/usr/include/linux/types.h" 2 3 4
# 24 "/usr/include/linux/types.h" 3 4
typedef __u16 __le16;
typedef __u16 __be16;
typedef __u32 __le32;
typedef __u32 __be32;
typedef __u64 __le64;
typedef __u64 __be64;

typedef __u16 __sum16;
typedef __u32 __wsum;
# 47 "/usr/include/linux/types.h" 3 4
typedef unsigned __poll_t;
# 12 "/usr/include/linux/bpf.h" 2 3 4
# 1 "/usr/include/linux/bpf_common.h" 1 3 4
# 13 "/usr/include/linux/bpf.h" 2 3 4
# 53 "/usr/include/linux/bpf.h" 3 4
enum {
 BPF_REG_0 = 0,
 BPF_REG_1,
 BPF_REG_2,
 BPF_REG_3,
 BPF_REG_4,
 BPF_REG_5,
 BPF_REG_6,
 BPF_REG_7,
 BPF_REG_8,
 BPF_REG_9,
 BPF_REG_10,
 __MAX_BPF_REG,
};




struct bpf_insn {
 __u8 code;
 __u8 dst_reg:4;
 __u8 src_reg:4;
 __s16 off;
 __s32 imm;
};


struct bpf_lpm_trie_key {
 __u32 prefixlen;
 __u8 data[0];
};

struct bpf_cgroup_storage_key {
 __u64 cgroup_inode_id;
 __u32 attach_type;
};

union bpf_iter_link_info {
 struct {
  __u32 map_fd;
 } map;
};
# 838 "/usr/include/linux/bpf.h" 3 4
enum bpf_cmd {
 BPF_MAP_CREATE,
 BPF_MAP_LOOKUP_ELEM,
 BPF_MAP_UPDATE_ELEM,
 BPF_MAP_DELETE_ELEM,
 BPF_MAP_GET_NEXT_KEY,
 BPF_PROG_LOAD,
 BPF_OBJ_PIN,
 BPF_OBJ_GET,
 BPF_PROG_ATTACH,
 BPF_PROG_DETACH,
 BPF_PROG_TEST_RUN,
 BPF_PROG_RUN = BPF_PROG_TEST_RUN,
 BPF_PROG_GET_NEXT_ID,
 BPF_MAP_GET_NEXT_ID,
 BPF_PROG_GET_FD_BY_ID,
 BPF_MAP_GET_FD_BY_ID,
 BPF_OBJ_GET_INFO_BY_FD,
 BPF_PROG_QUERY,
 BPF_RAW_TRACEPOINT_OPEN,
 BPF_BTF_LOAD,
 BPF_BTF_GET_FD_BY_ID,
 BPF_TASK_FD_QUERY,
 BPF_MAP_LOOKUP_AND_DELETE_ELEM,
 BPF_MAP_FREEZE,
 BPF_BTF_GET_NEXT_ID,
 BPF_MAP_LOOKUP_BATCH,
 BPF_MAP_LOOKUP_AND_DELETE_BATCH,
 BPF_MAP_UPDATE_BATCH,
 BPF_MAP_DELETE_BATCH,
 BPF_LINK_CREATE,
 BPF_LINK_UPDATE,
 BPF_LINK_GET_FD_BY_ID,
 BPF_LINK_GET_NEXT_ID,
 BPF_ENABLE_STATS,
 BPF_ITER_CREATE,
 BPF_LINK_DETACH,
 BPF_PROG_BIND_MAP,
};

enum bpf_map_type {
 BPF_MAP_TYPE_UNSPEC,
 BPF_MAP_TYPE_HASH,
 BPF_MAP_TYPE_ARRAY,
 BPF_MAP_TYPE_PROG_ARRAY,
 BPF_MAP_TYPE_PERF_EVENT_ARRAY,
 BPF_MAP_TYPE_PERCPU_HASH,
 BPF_MAP_TYPE_PERCPU_ARRAY,
 BPF_MAP_TYPE_STACK_TRACE,
 BPF_MAP_TYPE_CGROUP_ARRAY,
 BPF_MAP_TYPE_LRU_HASH,
 BPF_MAP_TYPE_LRU_PERCPU_HASH,
 BPF_MAP_TYPE_LPM_TRIE,
 BPF_MAP_TYPE_ARRAY_OF_MAPS,
 BPF_MAP_TYPE_HASH_OF_MAPS,
 BPF_MAP_TYPE_DEVMAP,
 BPF_MAP_TYPE_SOCKMAP,
 BPF_MAP_TYPE_CPUMAP,
 BPF_MAP_TYPE_XSKMAP,
 BPF_MAP_TYPE_SOCKHASH,
 BPF_MAP_TYPE_CGROUP_STORAGE,
 BPF_MAP_TYPE_REUSEPORT_SOCKARRAY,
 BPF_MAP_TYPE_PERCPU_CGROUP_STORAGE,
 BPF_MAP_TYPE_QUEUE,
 BPF_MAP_TYPE_STACK,
 BPF_MAP_TYPE_SK_STORAGE,
 BPF_MAP_TYPE_DEVMAP_HASH,
 BPF_MAP_TYPE_STRUCT_OPS,
 BPF_MAP_TYPE_RINGBUF,
 BPF_MAP_TYPE_INODE_STORAGE,
 BPF_MAP_TYPE_TASK_STORAGE,
};
# 919 "/usr/include/linux/bpf.h" 3 4
enum bpf_prog_type {
 BPF_PROG_TYPE_UNSPEC,
 BPF_PROG_TYPE_SOCKET_FILTER,
 BPF_PROG_TYPE_KPROBE,
 BPF_PROG_TYPE_SCHED_CLS,
 BPF_PROG_TYPE_SCHED_ACT,
 BPF_PROG_TYPE_TRACEPOINT,
 BPF_PROG_TYPE_XDP,
 BPF_PROG_TYPE_PERF_EVENT,
 BPF_PROG_TYPE_CGROUP_SKB,
 BPF_PROG_TYPE_CGROUP_SOCK,
 BPF_PROG_TYPE_LWT_IN,
 BPF_PROG_TYPE_LWT_OUT,
 BPF_PROG_TYPE_LWT_XMIT,
 BPF_PROG_TYPE_SOCK_OPS,
 BPF_PROG_TYPE_SK_SKB,
 BPF_PROG_TYPE_CGROUP_DEVICE,
 BPF_PROG_TYPE_SK_MSG,
 BPF_PROG_TYPE_RAW_TRACEPOINT,
 BPF_PROG_TYPE_CGROUP_SOCK_ADDR,
 BPF_PROG_TYPE_LWT_SEG6LOCAL,
 BPF_PROG_TYPE_LIRC_MODE2,
 BPF_PROG_TYPE_SK_REUSEPORT,
 BPF_PROG_TYPE_FLOW_DISSECTOR,
 BPF_PROG_TYPE_CGROUP_SYSCTL,
 BPF_PROG_TYPE_RAW_TRACEPOINT_WRITABLE,
 BPF_PROG_TYPE_CGROUP_SOCKOPT,
 BPF_PROG_TYPE_TRACING,
 BPF_PROG_TYPE_STRUCT_OPS,
 BPF_PROG_TYPE_EXT,
 BPF_PROG_TYPE_LSM,
 BPF_PROG_TYPE_SK_LOOKUP,
 BPF_PROG_TYPE_SYSCALL,
};

enum bpf_attach_type {
 BPF_CGROUP_INET_INGRESS,
 BPF_CGROUP_INET_EGRESS,
 BPF_CGROUP_INET_SOCK_CREATE,
 BPF_CGROUP_SOCK_OPS,
 BPF_SK_SKB_STREAM_PARSER,
 BPF_SK_SKB_STREAM_VERDICT,
 BPF_CGROUP_DEVICE,
 BPF_SK_MSG_VERDICT,
 BPF_CGROUP_INET4_BIND,
 BPF_CGROUP_INET6_BIND,
 BPF_CGROUP_INET4_CONNECT,
 BPF_CGROUP_INET6_CONNECT,
 BPF_CGROUP_INET4_POST_BIND,
 BPF_CGROUP_INET6_POST_BIND,
 BPF_CGROUP_UDP4_SENDMSG,
 BPF_CGROUP_UDP6_SENDMSG,
 BPF_LIRC_MODE2,
 BPF_FLOW_DISSECTOR,
 BPF_CGROUP_SYSCTL,
 BPF_CGROUP_UDP4_RECVMSG,
 BPF_CGROUP_UDP6_RECVMSG,
 BPF_CGROUP_GETSOCKOPT,
 BPF_CGROUP_SETSOCKOPT,
 BPF_TRACE_RAW_TP,
 BPF_TRACE_FENTRY,
 BPF_TRACE_FEXIT,
 BPF_MODIFY_RETURN,
 BPF_LSM_MAC,
 BPF_TRACE_ITER,
 BPF_CGROUP_INET4_GETPEERNAME,
 BPF_CGROUP_INET6_GETPEERNAME,
 BPF_CGROUP_INET4_GETSOCKNAME,
 BPF_CGROUP_INET6_GETSOCKNAME,
 BPF_XDP_DEVMAP,
 BPF_CGROUP_INET_SOCK_RELEASE,
 BPF_XDP_CPUMAP,
 BPF_SK_LOOKUP,
 BPF_XDP,
 BPF_SK_SKB_VERDICT,
 BPF_SK_REUSEPORT_SELECT,
 BPF_SK_REUSEPORT_SELECT_OR_MIGRATE,
 BPF_PERF_EVENT,
 __MAX_BPF_ATTACH_TYPE
};



enum bpf_link_type {
 BPF_LINK_TYPE_UNSPEC = 0,
 BPF_LINK_TYPE_RAW_TRACEPOINT = 1,
 BPF_LINK_TYPE_TRACING = 2,
 BPF_LINK_TYPE_CGROUP = 3,
 BPF_LINK_TYPE_ITER = 4,
 BPF_LINK_TYPE_NETNS = 5,
 BPF_LINK_TYPE_XDP = 6,
 BPF_LINK_TYPE_PERF_EVENT = 7,

 MAX_BPF_LINK_TYPE,
};
# 1168 "/usr/include/linux/bpf.h" 3 4
enum {
 BPF_ANY = 0,
 BPF_NOEXIST = 1,
 BPF_EXIST = 2,
 BPF_F_LOCK = 4,
};


enum {
 BPF_F_NO_PREALLOC = (1U << 0),






 BPF_F_NO_COMMON_LRU = (1U << 1),

 BPF_F_NUMA_NODE = (1U << 2),


 BPF_F_RDONLY = (1U << 3),
 BPF_F_WRONLY = (1U << 4),


 BPF_F_STACK_BUILD_ID = (1U << 5),


 BPF_F_ZERO_SEED = (1U << 6),


 BPF_F_RDONLY_PROG = (1U << 7),
 BPF_F_WRONLY_PROG = (1U << 8),


 BPF_F_CLONE = (1U << 9),


 BPF_F_MMAPABLE = (1U << 10),


 BPF_F_PRESERVE_ELEMS = (1U << 11),


 BPF_F_INNER_MAP = (1U << 12),
};
# 1229 "/usr/include/linux/bpf.h" 3 4
enum bpf_stats_type {

 BPF_STATS_RUN_TIME = 0,
};

enum bpf_stack_build_id_status {

 BPF_STACK_BUILD_ID_EMPTY = 0,

 BPF_STACK_BUILD_ID_VALID = 1,

 BPF_STACK_BUILD_ID_IP = 2,
};


struct bpf_stack_build_id {
 __s32 status;
 unsigned char build_id[20];
 union {
  __u64 offset;
  __u64 ip;
 };
};



union bpf_attr {
 struct {
  __u32 map_type;
  __u32 key_size;
  __u32 value_size;
  __u32 max_entries;
  __u32 map_flags;


  __u32 inner_map_fd;
  __u32 numa_node;


  char map_name[16U];
  __u32 map_ifindex;
  __u32 btf_fd;
  __u32 btf_key_type_id;
  __u32 btf_value_type_id;
  __u32 btf_vmlinux_value_type_id;



 };

 struct {
  __u32 map_fd;
  __u64 __attribute__((aligned(8))) key;
  union {
   __u64 __attribute__((aligned(8))) value;
   __u64 __attribute__((aligned(8))) next_key;
  };
  __u64 flags;
 };

 struct {
  __u64 __attribute__((aligned(8))) in_batch;


  __u64 __attribute__((aligned(8))) out_batch;
  __u64 __attribute__((aligned(8))) keys;
  __u64 __attribute__((aligned(8))) values;
  __u32 count;




  __u32 map_fd;
  __u64 elem_flags;
  __u64 flags;
 } batch;

 struct {
  __u32 prog_type;
  __u32 insn_cnt;
  __u64 __attribute__((aligned(8))) insns;
  __u64 __attribute__((aligned(8))) license;
  __u32 log_level;
  __u32 log_size;
  __u64 __attribute__((aligned(8))) log_buf;
  __u32 kern_version;
  __u32 prog_flags;
  char prog_name[16U];
  __u32 prog_ifindex;




  __u32 expected_attach_type;
  __u32 prog_btf_fd;
  __u32 func_info_rec_size;
  __u64 __attribute__((aligned(8))) func_info;
  __u32 func_info_cnt;
  __u32 line_info_rec_size;
  __u64 __attribute__((aligned(8))) line_info;
  __u32 line_info_cnt;
  __u32 attach_btf_id;
  union {

   __u32 attach_prog_fd;

   __u32 attach_btf_obj_fd;
  };
  __u32 :32;
  __u64 __attribute__((aligned(8))) fd_array;
 };

 struct {
  __u64 __attribute__((aligned(8))) pathname;
  __u32 bpf_fd;
  __u32 file_flags;
 };

 struct {
  __u32 target_fd;
  __u32 attach_bpf_fd;
  __u32 attach_type;
  __u32 attach_flags;
  __u32 replace_bpf_fd;



 };

 struct {
  __u32 prog_fd;
  __u32 retval;
  __u32 data_size_in;
  __u32 data_size_out;



  __u64 __attribute__((aligned(8))) data_in;
  __u64 __attribute__((aligned(8))) data_out;
  __u32 repeat;
  __u32 duration;
  __u32 ctx_size_in;
  __u32 ctx_size_out;



  __u64 __attribute__((aligned(8))) ctx_in;
  __u64 __attribute__((aligned(8))) ctx_out;
  __u32 flags;
  __u32 cpu;
 } test;

 struct {
  union {
   __u32 start_id;
   __u32 prog_id;
   __u32 map_id;
   __u32 btf_id;
   __u32 link_id;
  };
  __u32 next_id;
  __u32 open_flags;
 };

 struct {
  __u32 bpf_fd;
  __u32 info_len;
  __u64 __attribute__((aligned(8))) info;
 } info;

 struct {
  __u32 target_fd;
  __u32 attach_type;
  __u32 query_flags;
  __u32 attach_flags;
  __u64 __attribute__((aligned(8))) prog_ids;
  __u32 prog_cnt;
 } query;

 struct {
  __u64 name;
  __u32 prog_fd;
 } raw_tracepoint;

 struct {
  __u64 __attribute__((aligned(8))) btf;
  __u64 __attribute__((aligned(8))) btf_log_buf;
  __u32 btf_size;
  __u32 btf_log_size;
  __u32 btf_log_level;
 };

 struct {
  __u32 pid;
  __u32 fd;
  __u32 flags;
  __u32 buf_len;
  __u64 __attribute__((aligned(8))) buf;




  __u32 prog_id;
  __u32 fd_type;
  __u64 probe_offset;
  __u64 probe_addr;
 } task_fd_query;

 struct {
  __u32 prog_fd;
  union {
   __u32 target_fd;
   __u32 target_ifindex;
  };
  __u32 attach_type;
  __u32 flags;
  union {
   __u32 target_btf_id;
   struct {
    __u64 __attribute__((aligned(8))) iter_info;
    __u32 iter_info_len;
   };
   struct {




    __u64 bpf_cookie;
   } perf_event;
  };
 } link_create;

 struct {
  __u32 link_fd;

  __u32 new_prog_fd;
  __u32 flags;


  __u32 old_prog_fd;
 } link_update;

 struct {
  __u32 link_fd;
 } link_detach;

 struct {
  __u32 type;
 } enable_stats;

 struct {
  __u32 link_fd;
  __u32 flags;
 } iter_create;

 struct {
  __u32 prog_fd;
  __u32 map_fd;
  __u32 flags;
 } prog_bind_map;

} __attribute__((aligned(8)));
# 5069 "/usr/include/linux/bpf.h" 3 4
enum bpf_func_id {
 BPF_FUNC_unspec, BPF_FUNC_map_lookup_elem, BPF_FUNC_map_update_elem, BPF_FUNC_map_delete_elem, BPF_FUNC_probe_read, BPF_FUNC_ktime_get_ns, BPF_FUNC_trace_printk, BPF_FUNC_get_prandom_u32, BPF_FUNC_get_smp_processor_id, BPF_FUNC_skb_store_bytes, BPF_FUNC_l3_csum_replace, BPF_FUNC_l4_csum_replace, BPF_FUNC_tail_call, BPF_FUNC_clone_redirect, BPF_FUNC_get_current_pid_tgid, BPF_FUNC_get_current_uid_gid, BPF_FUNC_get_current_comm, BPF_FUNC_get_cgroup_classid, BPF_FUNC_skb_vlan_push, BPF_FUNC_skb_vlan_pop, BPF_FUNC_skb_get_tunnel_key, BPF_FUNC_skb_set_tunnel_key, BPF_FUNC_perf_event_read, BPF_FUNC_redirect, BPF_FUNC_get_route_realm, BPF_FUNC_perf_event_output, BPF_FUNC_skb_load_bytes, BPF_FUNC_get_stackid, BPF_FUNC_csum_diff, BPF_FUNC_skb_get_tunnel_opt, BPF_FUNC_skb_set_tunnel_opt, BPF_FUNC_skb_change_proto, BPF_FUNC_skb_change_type, BPF_FUNC_skb_under_cgroup, BPF_FUNC_get_hash_recalc, BPF_FUNC_get_current_task, BPF_FUNC_probe_write_user, BPF_FUNC_current_task_under_cgroup, BPF_FUNC_skb_change_tail, BPF_FUNC_skb_pull_data, BPF_FUNC_csum_update, BPF_FUNC_set_hash_invalid, BPF_FUNC_get_numa_node_id, BPF_FUNC_skb_change_head, BPF_FUNC_xdp_adjust_head, BPF_FUNC_probe_read_str, BPF_FUNC_get_socket_cookie, BPF_FUNC_get_socket_uid, BPF_FUNC_set_hash, BPF_FUNC_setsockopt, BPF_FUNC_skb_adjust_room, BPF_FUNC_redirect_map, BPF_FUNC_sk_redirect_map, BPF_FUNC_sock_map_update, BPF_FUNC_xdp_adjust_meta, BPF_FUNC_perf_event_read_value, BPF_FUNC_perf_prog_read_value, BPF_FUNC_getsockopt, BPF_FUNC_override_return, BPF_FUNC_sock_ops_cb_flags_set, BPF_FUNC_msg_redirect_map, BPF_FUNC_msg_apply_bytes, BPF_FUNC_msg_cork_bytes, BPF_FUNC_msg_pull_data, BPF_FUNC_bind, BPF_FUNC_xdp_adjust_tail, BPF_FUNC_skb_get_xfrm_state, BPF_FUNC_get_stack, BPF_FUNC_skb_load_bytes_relative, BPF_FUNC_fib_lookup, BPF_FUNC_sock_hash_update, BPF_FUNC_msg_redirect_hash, BPF_FUNC_sk_redirect_hash, BPF_FUNC_lwt_push_encap, BPF_FUNC_lwt_seg6_store_bytes, BPF_FUNC_lwt_seg6_adjust_srh, BPF_FUNC_lwt_seg6_action, BPF_FUNC_rc_repeat, BPF_FUNC_rc_keydown, BPF_FUNC_skb_cgroup_id, BPF_FUNC_get_current_cgroup_id, BPF_FUNC_get_local_storage, BPF_FUNC_sk_select_reuseport, BPF_FUNC_skb_ancestor_cgroup_id, BPF_FUNC_sk_lookup_tcp, BPF_FUNC_sk_lookup_udp, BPF_FUNC_sk_release, BPF_FUNC_map_push_elem, BPF_FUNC_map_pop_elem, BPF_FUNC_map_peek_elem, BPF_FUNC_msg_push_data, BPF_FUNC_msg_pop_data, BPF_FUNC_rc_pointer_rel, BPF_FUNC_spin_lock, BPF_FUNC_spin_unlock, BPF_FUNC_sk_fullsock, BPF_FUNC_tcp_sock, BPF_FUNC_skb_ecn_set_ce, BPF_FUNC_get_listener_sock, BPF_FUNC_skc_lookup_tcp, BPF_FUNC_tcp_check_syncookie, BPF_FUNC_sysctl_get_name, BPF_FUNC_sysctl_get_current_value, BPF_FUNC_sysctl_get_new_value, BPF_FUNC_sysctl_set_new_value, BPF_FUNC_strtol, BPF_FUNC_strtoul, BPF_FUNC_sk_storage_get, BPF_FUNC_sk_storage_delete, BPF_FUNC_send_signal, BPF_FUNC_tcp_gen_syncookie, BPF_FUNC_skb_output, BPF_FUNC_probe_read_user, BPF_FUNC_probe_read_kernel, BPF_FUNC_probe_read_user_str, BPF_FUNC_probe_read_kernel_str, BPF_FUNC_tcp_send_ack, BPF_FUNC_send_signal_thread, BPF_FUNC_jiffies64, BPF_FUNC_read_branch_records, BPF_FUNC_get_ns_current_pid_tgid, BPF_FUNC_xdp_output, BPF_FUNC_get_netns_cookie, BPF_FUNC_get_current_ancestor_cgroup_id, BPF_FUNC_sk_assign, BPF_FUNC_ktime_get_boot_ns, BPF_FUNC_seq_printf, BPF_FUNC_seq_write, BPF_FUNC_sk_cgroup_id, BPF_FUNC_sk_ancestor_cgroup_id, BPF_FUNC_ringbuf_output, BPF_FUNC_ringbuf_reserve, BPF_FUNC_ringbuf_submit, BPF_FUNC_ringbuf_discard, BPF_FUNC_ringbuf_query, BPF_FUNC_csum_level, BPF_FUNC_skc_to_tcp6_sock, BPF_FUNC_skc_to_tcp_sock, BPF_FUNC_skc_to_tcp_timewait_sock, BPF_FUNC_skc_to_tcp_request_sock, BPF_FUNC_skc_to_udp6_sock, BPF_FUNC_get_task_stack, BPF_FUNC_load_hdr_opt, BPF_FUNC_store_hdr_opt, BPF_FUNC_reserve_hdr_opt, BPF_FUNC_inode_storage_get, BPF_FUNC_inode_storage_delete, BPF_FUNC_d_path, BPF_FUNC_copy_from_user, BPF_FUNC_snprintf_btf, BPF_FUNC_seq_printf_btf, BPF_FUNC_skb_cgroup_classid, BPF_FUNC_redirect_neigh, BPF_FUNC_per_cpu_ptr, BPF_FUNC_this_cpu_ptr, BPF_FUNC_redirect_peer, BPF_FUNC_task_storage_get, BPF_FUNC_task_storage_delete, BPF_FUNC_get_current_task_btf, BPF_FUNC_bprm_opts_set, BPF_FUNC_ktime_get_coarse_ns, BPF_FUNC_ima_inode_hash, BPF_FUNC_sock_from_file, BPF_FUNC_check_mtu, BPF_FUNC_for_each_map_elem, BPF_FUNC_snprintf, BPF_FUNC_sys_bpf, BPF_FUNC_btf_find_by_name_kind, BPF_FUNC_sys_close, BPF_FUNC_timer_init, BPF_FUNC_timer_set_callback, BPF_FUNC_timer_start, BPF_FUNC_timer_cancel, BPF_FUNC_get_func_ip, BPF_FUNC_get_attach_cookie, BPF_FUNC_task_pt_regs,
 __BPF_FUNC_MAX_ID,
};





enum {
 BPF_F_RECOMPUTE_CSUM = (1ULL << 0),
 BPF_F_INVALIDATE_HASH = (1ULL << 1),
};




enum {
 BPF_F_HDR_FIELD_MASK = 0xfULL,
};


enum {
 BPF_F_PSEUDO_HDR = (1ULL << 4),
 BPF_F_MARK_MANGLED_0 = (1ULL << 5),
 BPF_F_MARK_ENFORCE = (1ULL << 6),
};


enum {
 BPF_F_INGRESS = (1ULL << 0),
};


enum {
 BPF_F_TUNINFO_IPV6 = (1ULL << 0),
};


enum {
 BPF_F_SKIP_FIELD_MASK = 0xffULL,
 BPF_F_USER_STACK = (1ULL << 8),

 BPF_F_FAST_STACK_CMP = (1ULL << 9),
 BPF_F_REUSE_STACKID = (1ULL << 10),

 BPF_F_USER_BUILD_ID = (1ULL << 11),
};


enum {
 BPF_F_ZERO_CSUM_TX = (1ULL << 1),
 BPF_F_DONT_FRAGMENT = (1ULL << 2),
 BPF_F_SEQ_NUMBER = (1ULL << 3),
};




enum {
 BPF_F_INDEX_MASK = 0xffffffffULL,
 BPF_F_CURRENT_CPU = BPF_F_INDEX_MASK,

 BPF_F_CTXLEN_MASK = (0xfffffULL << 32),
};


enum {
 BPF_F_CURRENT_NETNS = (-1L),
};


enum {
 BPF_CSUM_LEVEL_QUERY,
 BPF_CSUM_LEVEL_INC,
 BPF_CSUM_LEVEL_DEC,
 BPF_CSUM_LEVEL_RESET,
};


enum {
 BPF_F_ADJ_ROOM_FIXED_GSO = (1ULL << 0),
 BPF_F_ADJ_ROOM_ENCAP_L3_IPV4 = (1ULL << 1),
 BPF_F_ADJ_ROOM_ENCAP_L3_IPV6 = (1ULL << 2),
 BPF_F_ADJ_ROOM_ENCAP_L4_GRE = (1ULL << 3),
 BPF_F_ADJ_ROOM_ENCAP_L4_UDP = (1ULL << 4),
 BPF_F_ADJ_ROOM_NO_CSUM_RESET = (1ULL << 5),
 BPF_F_ADJ_ROOM_ENCAP_L2_ETH = (1ULL << 6),
};

enum {
 BPF_ADJ_ROOM_ENCAP_L2_MASK = 0xff,
 BPF_ADJ_ROOM_ENCAP_L2_SHIFT = 56,
};






enum {
 BPF_F_SYSCTL_BASE_NAME = (1ULL << 0),
};


enum {
 BPF_LOCAL_STORAGE_GET_F_CREATE = (1ULL << 0),



 BPF_SK_STORAGE_GET_F_CREATE = BPF_LOCAL_STORAGE_GET_F_CREATE,
};


enum {
 BPF_F_GET_BRANCH_RECORDS_SIZE = (1ULL << 0),
};




enum {
 BPF_RB_NO_WAKEUP = (1ULL << 0),
 BPF_RB_FORCE_WAKEUP = (1ULL << 1),
};


enum {
 BPF_RB_AVAIL_DATA = 0,
 BPF_RB_RING_SIZE = 1,
 BPF_RB_CONS_POS = 2,
 BPF_RB_PROD_POS = 3,
};


enum {
 BPF_RINGBUF_BUSY_BIT = (1U << 31),
 BPF_RINGBUF_DISCARD_BIT = (1U << 30),
 BPF_RINGBUF_HDR_SZ = 8,
};


enum {
 BPF_SK_LOOKUP_F_REPLACE = (1ULL << 0),
 BPF_SK_LOOKUP_F_NO_REUSEPORT = (1ULL << 1),
};


enum bpf_adj_room_mode {
 BPF_ADJ_ROOM_NET,
 BPF_ADJ_ROOM_MAC,
};


enum bpf_hdr_start_off {
 BPF_HDR_START_MAC,
 BPF_HDR_START_NET,
};


enum bpf_lwt_encap_mode {
 BPF_LWT_ENCAP_SEG6,
 BPF_LWT_ENCAP_SEG6_INLINE,
 BPF_LWT_ENCAP_IP,
};


enum {
 BPF_F_BPRM_SECUREEXEC = (1ULL << 0),
};


enum {
 BPF_F_BROADCAST = (1ULL << 3),
 BPF_F_EXCLUDE_INGRESS = (1ULL << 4),
};
# 5255 "/usr/include/linux/bpf.h" 3 4
struct __sk_buff {
 __u32 len;
 __u32 pkt_type;
 __u32 mark;
 __u32 queue_mapping;
 __u32 protocol;
 __u32 vlan_present;
 __u32 vlan_tci;
 __u32 vlan_proto;
 __u32 priority;
 __u32 ingress_ifindex;
 __u32 ifindex;
 __u32 tc_index;
 __u32 cb[5];
 __u32 hash;
 __u32 tc_classid;
 __u32 data;
 __u32 data_end;
 __u32 napi_id;


 __u32 family;
 __u32 remote_ip4;
 __u32 local_ip4;
 __u32 remote_ip6[4];
 __u32 local_ip6[4];
 __u32 remote_port;
 __u32 local_port;


 __u32 data_meta;
 union { struct bpf_flow_keys * flow_keys; __u64 :64; } __attribute__((aligned(8)));
 __u64 tstamp;
 __u32 wire_len;
 __u32 gso_segs;
 union { struct bpf_sock * sk; __u64 :64; } __attribute__((aligned(8)));
 __u32 gso_size;
};

struct bpf_tunnel_key {
 __u32 tunnel_id;
 union {
  __u32 remote_ipv4;
  __u32 remote_ipv6[4];
 };
 __u8 tunnel_tos;
 __u8 tunnel_ttl;
 __u16 tunnel_ext;
 __u32 tunnel_label;
};




struct bpf_xfrm_state {
 __u32 reqid;
 __u32 spi;
 __u16 family;
 __u16 ext;
 union {
  __u32 remote_ipv4;
  __u32 remote_ipv6[4];
 };
};
# 5327 "/usr/include/linux/bpf.h" 3 4
enum bpf_ret_code {
 BPF_OK = 0,

 BPF_DROP = 2,

 BPF_REDIRECT = 7,
# 5341 "/usr/include/linux/bpf.h" 3 4
 BPF_LWT_REROUTE = 128,
};

struct bpf_sock {
 __u32 bound_dev_if;
 __u32 family;
 __u32 type;
 __u32 protocol;
 __u32 mark;
 __u32 priority;

 __u32 src_ip4;
 __u32 src_ip6[4];
 __u32 src_port;
 __be16 dst_port;
 __u16 :16;
 __u32 dst_ip4;
 __u32 dst_ip6[4];
 __u32 state;
 __s32 rx_queue_mapping;
};

struct bpf_tcp_sock {
 __u32 snd_cwnd;
 __u32 srtt_us;
 __u32 rtt_min;
 __u32 snd_ssthresh;
 __u32 rcv_nxt;
 __u32 snd_nxt;
 __u32 snd_una;
 __u32 mss_cache;
 __u32 ecn_flags;
 __u32 rate_delivered;
 __u32 rate_interval_us;
 __u32 packets_out;
 __u32 retrans_out;
 __u32 total_retrans;
 __u32 segs_in;


 __u32 data_segs_in;


 __u32 segs_out;


 __u32 data_segs_out;


 __u32 lost_out;
 __u32 sacked_out;
 __u64 bytes_received;



 __u64 bytes_acked;



 __u32 dsack_dups;


 __u32 delivered;
 __u32 delivered_ce;
 __u32 icsk_retransmits;
};

struct bpf_sock_tuple {
 union {
  struct {
   __be32 saddr;
   __be32 daddr;
   __be16 sport;
   __be16 dport;
  } ipv4;
  struct {
   __be32 saddr[4];
   __be32 daddr[4];
   __be16 sport;
   __be16 dport;
  } ipv6;
 };
};

struct bpf_xdp_sock {
 __u32 queue_id;
};
# 5436 "/usr/include/linux/bpf.h" 3 4
enum xdp_action {
 XDP_ABORTED = 0,
 XDP_DROP,
 XDP_PASS,
 XDP_TX,
 XDP_REDIRECT,
};




struct xdp_md {
 __u32 data;
 __u32 data_end;
 __u32 data_meta;

 __u32 ingress_ifindex;
 __u32 rx_queue_index;

 __u32 egress_ifindex;
};






struct bpf_devmap_val {
 __u32 ifindex;
 union {
  int fd;
  __u32 id;
 } bpf_prog;
};






struct bpf_cpumap_val {
 __u32 qsize;
 union {
  int fd;
  __u32 id;
 } bpf_prog;
};

enum sk_action {
 SK_DROP = 0,
 SK_PASS,
};




struct sk_msg_md {
 union { void * data; __u64 :64; } __attribute__((aligned(8)));
 union { void * data_end; __u64 :64; } __attribute__((aligned(8)));

 __u32 family;
 __u32 remote_ip4;
 __u32 local_ip4;
 __u32 remote_ip6[4];
 __u32 local_ip6[4];
 __u32 remote_port;
 __u32 local_port;
 __u32 size;

 union { struct bpf_sock * sk; __u64 :64; } __attribute__((aligned(8)));
};

struct sk_reuseport_md {




 union { void * data; __u64 :64; } __attribute__((aligned(8)));

 union { void * data_end; __u64 :64; } __attribute__((aligned(8)));






 __u32 len;




 __u32 eth_protocol;
 __u32 ip_protocol;
 __u32 bind_inany;
 __u32 hash;
# 5543 "/usr/include/linux/bpf.h" 3 4
 union { struct bpf_sock * sk; __u64 :64; } __attribute__((aligned(8)));
 union { struct bpf_sock * migrating_sk; __u64 :64; } __attribute__((aligned(8)));
};



struct bpf_prog_info {
 __u32 type;
 __u32 id;
 __u8 tag[8];
 __u32 jited_prog_len;
 __u32 xlated_prog_len;
 __u64 __attribute__((aligned(8))) jited_prog_insns;
 __u64 __attribute__((aligned(8))) xlated_prog_insns;
 __u64 load_time;
 __u32 created_by_uid;
 __u32 nr_map_ids;
 __u64 __attribute__((aligned(8))) map_ids;
 char name[16U];
 __u32 ifindex;
 __u32 gpl_compatible:1;
 __u32 :31;
 __u64 netns_dev;
 __u64 netns_ino;
 __u32 nr_jited_ksyms;
 __u32 nr_jited_func_lens;
 __u64 __attribute__((aligned(8))) jited_ksyms;
 __u64 __attribute__((aligned(8))) jited_func_lens;
 __u32 btf_id;
 __u32 func_info_rec_size;
 __u64 __attribute__((aligned(8))) func_info;
 __u32 nr_func_info;
 __u32 nr_line_info;
 __u64 __attribute__((aligned(8))) line_info;
 __u64 __attribute__((aligned(8))) jited_line_info;
 __u32 nr_jited_line_info;
 __u32 line_info_rec_size;
 __u32 jited_line_info_rec_size;
 __u32 nr_prog_tags;
 __u64 __attribute__((aligned(8))) prog_tags;
 __u64 run_time_ns;
 __u64 run_cnt;
 __u64 recursion_misses;
} __attribute__((aligned(8)));

struct bpf_map_info {
 __u32 type;
 __u32 id;
 __u32 key_size;
 __u32 value_size;
 __u32 max_entries;
 __u32 map_flags;
 char name[16U];
 __u32 ifindex;
 __u32 btf_vmlinux_value_type_id;
 __u64 netns_dev;
 __u64 netns_ino;
 __u32 btf_id;
 __u32 btf_key_type_id;
 __u32 btf_value_type_id;
} __attribute__((aligned(8)));

struct bpf_btf_info {
 __u64 __attribute__((aligned(8))) btf;
 __u32 btf_size;
 __u32 id;
 __u64 __attribute__((aligned(8))) name;
 __u32 name_len;
 __u32 kernel_btf;
} __attribute__((aligned(8)));

struct bpf_link_info {
 __u32 type;
 __u32 id;
 __u32 prog_id;
 union {
  struct {
   __u64 __attribute__((aligned(8))) tp_name;
   __u32 tp_name_len;
  } raw_tracepoint;
  struct {
   __u32 attach_type;
   __u32 target_obj_id;
   __u32 target_btf_id;
  } tracing;
  struct {
   __u64 cgroup_id;
   __u32 attach_type;
  } cgroup;
  struct {
   __u64 __attribute__((aligned(8))) target_name;
   __u32 target_name_len;
   union {
    struct {
     __u32 map_id;
    } map;
   };
  } iter;
  struct {
   __u32 netns_ino;
   __u32 attach_type;
  } netns;
  struct {
   __u32 ifindex;
  } xdp;
 };
} __attribute__((aligned(8)));





struct bpf_sock_addr {
 __u32 user_family;
 __u32 user_ip4;


 __u32 user_ip6[4];


 __u32 user_port;


 __u32 family;
 __u32 type;
 __u32 protocol;
 __u32 msg_src_ip4;


 __u32 msg_src_ip6[4];


 union { struct bpf_sock * sk; __u64 :64; } __attribute__((aligned(8)));
};







struct bpf_sock_ops {
 __u32 op;
 union {
  __u32 args[4];
  __u32 reply;
  __u32 replylong[4];
 };
 __u32 family;
 __u32 remote_ip4;
 __u32 local_ip4;
 __u32 remote_ip6[4];
 __u32 local_ip6[4];
 __u32 remote_port;
 __u32 local_port;
 __u32 is_fullsock;



 __u32 snd_cwnd;
 __u32 srtt_us;
 __u32 bpf_sock_ops_cb_flags;
 __u32 state;
 __u32 rtt_min;
 __u32 snd_ssthresh;
 __u32 rcv_nxt;
 __u32 snd_nxt;
 __u32 snd_una;
 __u32 mss_cache;
 __u32 ecn_flags;
 __u32 rate_delivered;
 __u32 rate_interval_us;
 __u32 packets_out;
 __u32 retrans_out;
 __u32 total_retrans;
 __u32 segs_in;
 __u32 data_segs_in;
 __u32 segs_out;
 __u32 data_segs_out;
 __u32 lost_out;
 __u32 sacked_out;
 __u32 sk_txhash;
 __u64 bytes_received;
 __u64 bytes_acked;
 union { struct bpf_sock * sk; __u64 :64; } __attribute__((aligned(8)));
# 5742 "/usr/include/linux/bpf.h" 3 4
 union { void * skb_data; __u64 :64; } __attribute__((aligned(8)));
 union { void * skb_data_end; __u64 :64; } __attribute__((aligned(8)));
 __u32 skb_len;



 __u32 skb_tcp_flags;
# 5758 "/usr/include/linux/bpf.h" 3 4
};


enum {
 BPF_SOCK_OPS_RTO_CB_FLAG = (1<<0),
 BPF_SOCK_OPS_RETRANS_CB_FLAG = (1<<1),
 BPF_SOCK_OPS_STATE_CB_FLAG = (1<<2),
 BPF_SOCK_OPS_RTT_CB_FLAG = (1<<3),
# 5784 "/usr/include/linux/bpf.h" 3 4
 BPF_SOCK_OPS_PARSE_ALL_HDR_OPT_CB_FLAG = (1<<4),
# 5793 "/usr/include/linux/bpf.h" 3 4
 BPF_SOCK_OPS_PARSE_UNKNOWN_HDR_OPT_CB_FLAG = (1<<5),
# 5808 "/usr/include/linux/bpf.h" 3 4
 BPF_SOCK_OPS_WRITE_HDR_OPT_CB_FLAG = (1<<6),

 BPF_SOCK_OPS_ALL_CB_FLAGS = 0x7F,
};




enum {
 BPF_SOCK_OPS_VOID,
 BPF_SOCK_OPS_TIMEOUT_INIT,


 BPF_SOCK_OPS_RWND_INIT,



 BPF_SOCK_OPS_TCP_CONNECT_CB,


 BPF_SOCK_OPS_ACTIVE_ESTABLISHED_CB,



 BPF_SOCK_OPS_PASSIVE_ESTABLISHED_CB,



 BPF_SOCK_OPS_NEEDS_ECN,


 BPF_SOCK_OPS_BASE_RTT,






 BPF_SOCK_OPS_RTO_CB,




 BPF_SOCK_OPS_RETRANS_CB,





 BPF_SOCK_OPS_STATE_CB,



 BPF_SOCK_OPS_TCP_LISTEN_CB,


 BPF_SOCK_OPS_RTT_CB,

 BPF_SOCK_OPS_PARSE_HDR_OPT_CB,
# 5880 "/usr/include/linux/bpf.h" 3 4
 BPF_SOCK_OPS_HDR_OPT_LEN_CB,
# 5897 "/usr/include/linux/bpf.h" 3 4
 BPF_SOCK_OPS_WRITE_HDR_OPT_CB,
# 5923 "/usr/include/linux/bpf.h" 3 4
};






enum {
 BPF_TCP_ESTABLISHED = 1,
 BPF_TCP_SYN_SENT,
 BPF_TCP_SYN_RECV,
 BPF_TCP_FIN_WAIT1,
 BPF_TCP_FIN_WAIT2,
 BPF_TCP_TIME_WAIT,
 BPF_TCP_CLOSE,
 BPF_TCP_CLOSE_WAIT,
 BPF_TCP_LAST_ACK,
 BPF_TCP_LISTEN,
 BPF_TCP_CLOSING,
 BPF_TCP_NEW_SYN_RECV,

 BPF_TCP_MAX_STATES
};

enum {
 TCP_BPF_IW = 1001,
 TCP_BPF_SNDCWND_CLAMP = 1002,
 TCP_BPF_DELACK_MAX = 1003,
 TCP_BPF_RTO_MIN = 1004,
# 5984 "/usr/include/linux/bpf.h" 3 4
 TCP_BPF_SYN = 1005,
 TCP_BPF_SYN_IP = 1006,
 TCP_BPF_SYN_MAC = 1007,
};

enum {
 BPF_LOAD_HDR_OPT_TCP_SYN = (1ULL << 0),
};




enum {
 BPF_WRITE_HDR_TCP_CURRENT_MSS = 1,






 BPF_WRITE_HDR_TCP_SYNACK_COOKIE = 2,


};

struct bpf_perf_event_value {
 __u64 counter;
 __u64 enabled;
 __u64 running;
};

enum {
 BPF_DEVCG_ACC_MKNOD = (1ULL << 0),
 BPF_DEVCG_ACC_READ = (1ULL << 1),
 BPF_DEVCG_ACC_WRITE = (1ULL << 2),
};

enum {
 BPF_DEVCG_DEV_BLOCK = (1ULL << 0),
 BPF_DEVCG_DEV_CHAR = (1ULL << 1),
};

struct bpf_cgroup_dev_ctx {

 __u32 access_type;
 __u32 major;
 __u32 minor;
};

struct bpf_raw_tracepoint_args {
 __u64 args[0];
};




enum {
 BPF_FIB_LOOKUP_DIRECT = (1U << 0),
 BPF_FIB_LOOKUP_OUTPUT = (1U << 1),
};

enum {
 BPF_FIB_LKUP_RET_SUCCESS,
 BPF_FIB_LKUP_RET_BLACKHOLE,
 BPF_FIB_LKUP_RET_UNREACHABLE,
 BPF_FIB_LKUP_RET_PROHIBIT,
 BPF_FIB_LKUP_RET_NOT_FWDED,
 BPF_FIB_LKUP_RET_FWD_DISABLED,
 BPF_FIB_LKUP_RET_UNSUPP_LWT,
 BPF_FIB_LKUP_RET_NO_NEIGH,
 BPF_FIB_LKUP_RET_FRAG_NEEDED,
};

struct bpf_fib_lookup {



 __u8 family;


 __u8 l4_protocol;
 __be16 sport;
 __be16 dport;

 union {

  __u16 tot_len;


  __u16 mtu_result;
 };



 __u32 ifindex;

 union {

  __u8 tos;
  __be32 flowinfo;


  __u32 rt_metric;
 };

 union {
  __be32 ipv4_src;
  __u32 ipv6_src[4];
 };





 union {
  __be32 ipv4_dst;
  __u32 ipv6_dst[4];
 };


 __be16 h_vlan_proto;
 __be16 h_vlan_TCI;
 __u8 smac[6];
 __u8 dmac[6];
};

struct bpf_redir_neigh {

 __u32 nh_family;

 union {
  __be32 ipv4_nh;
  __u32 ipv6_nh[4];
 };
};


enum bpf_check_mtu_flags {
 BPF_MTU_CHK_SEGS = (1U << 0),
};

enum bpf_check_mtu_ret {
 BPF_MTU_CHK_RET_SUCCESS,
 BPF_MTU_CHK_RET_FRAG_NEEDED,
 BPF_MTU_CHK_RET_SEGS_TOOBIG,
};

enum bpf_task_fd_type {
 BPF_FD_TYPE_RAW_TRACEPOINT,
 BPF_FD_TYPE_TRACEPOINT,
 BPF_FD_TYPE_KPROBE,
 BPF_FD_TYPE_KRETPROBE,
 BPF_FD_TYPE_UPROBE,
 BPF_FD_TYPE_URETPROBE,
};

enum {
 BPF_FLOW_DISSECTOR_F_PARSE_1ST_FRAG = (1U << 0),
 BPF_FLOW_DISSECTOR_F_STOP_AT_FLOW_LABEL = (1U << 1),
 BPF_FLOW_DISSECTOR_F_STOP_AT_ENCAP = (1U << 2),
};

struct bpf_flow_keys {
 __u16 nhoff;
 __u16 thoff;
 __u16 addr_proto;
 __u8 is_frag;
 __u8 is_first_frag;
 __u8 is_encap;
 __u8 ip_proto;
 __be16 n_proto;
 __be16 sport;
 __be16 dport;
 union {
  struct {
   __be32 ipv4_src;
   __be32 ipv4_dst;
  };
  struct {
   __u32 ipv6_src[4];
   __u32 ipv6_dst[4];
  };
 };
 __u32 flags;
 __be32 flow_label;
};

struct bpf_func_info {
 __u32 insn_off;
 __u32 type_id;
};




struct bpf_line_info {
 __u32 insn_off;
 __u32 file_name_off;
 __u32 line_off;
 __u32 line_col;
};

struct bpf_spin_lock {
 __u32 val;
};

struct bpf_timer {
 __u64 :64;
 __u64 :64;
} __attribute__((aligned(8)));

struct bpf_sysctl {
 __u32 write;


 __u32 file_pos;


};

struct bpf_sockopt {
 union { struct bpf_sock * sk; __u64 :64; } __attribute__((aligned(8)));
 union { void * optval; __u64 :64; } __attribute__((aligned(8)));
 union { void * optval_end; __u64 :64; } __attribute__((aligned(8)));

 __s32 level;
 __s32 optname;
 __s32 optlen;
 __s32 retval;
};

struct bpf_pidns_info {
 __u32 pid;
 __u32 tgid;
};


struct bpf_sk_lookup {
 union {
  union { struct bpf_sock * sk; __u64 :64; } __attribute__((aligned(8)));
  __u64 cookie;
 };

 __u32 family;
 __u32 protocol;
 __u32 remote_ip4;
 __u32 remote_ip6[4];
 __be16 remote_port;
 __u16 :16;
 __u32 local_ip4;
 __u32 local_ip6[4];
 __u32 local_port;
};
# 6246 "/usr/include/linux/bpf.h" 3 4
struct btf_ptr {
 void *ptr;
 __u32 type_id;
 __u32 flags;
};
# 6261 "/usr/include/linux/bpf.h" 3 4
enum {
 BTF_F_COMPACT = (1ULL << 0),
 BTF_F_NONAME = (1ULL << 1),
 BTF_F_PTR_RAW = (1ULL << 2),
 BTF_F_ZERO = (1ULL << 3),
};
# 2 "hash_map_example.bpf.c" 2
# 1 "/usr/include/bpf/bpf_helpers.h" 1 3 4
# 11 "/usr/include/bpf/bpf_helpers.h" 3 4
# 1 "/usr/include/bpf/bpf_helper_defs.h" 1 3 4



struct bpf_fib_lookup;
struct bpf_sk_lookup;
struct bpf_perf_event_data;
struct bpf_perf_event_value;
struct bpf_pidns_info;
struct bpf_redir_neigh;
struct bpf_sock;
struct bpf_sock_addr;
struct bpf_sock_ops;
struct bpf_sock_tuple;
struct bpf_spin_lock;
struct bpf_sysctl;
struct bpf_tcp_sock;
struct bpf_tunnel_key;
struct bpf_xfrm_state;
struct linux_binprm;
struct pt_regs;
struct sk_reuseport_md;
struct sockaddr;
struct tcphdr;
struct seq_file;
struct tcp6_sock;
struct tcp_sock;
struct tcp_timewait_sock;
struct tcp_request_sock;
struct udp6_sock;
struct unix_sock;
struct task_struct;
struct __sk_buff;
struct sk_msg_md;
struct xdp_md;
struct path;
struct btf_ptr;
struct inode;
struct socket;
struct file;
struct bpf_timer;
struct mptcp_sock;
struct bpf_dynptr;
struct iphdr;
struct ipv6hdr;
# 55 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static void *(*bpf_map_lookup_elem)(void *map, const void *key) = (void *) 1;
# 77 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_map_update_elem)(void *map, const void *key, const void *value, __u64 flags) = (void *) 2;
# 87 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_map_delete_elem)(void *map, const void *key) = (void *) 3;
# 101 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_probe_read)(void *dst, __u32 size, const void *unsafe_ptr) = (void *) 4;
# 113 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u64 (*bpf_ktime_get_ns)(void) = (void *) 5;
# 176 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_trace_printk)(const char *fmt, __u32 fmt_size, ...) = (void *) 6;
# 192 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u32 (*bpf_get_prandom_u32)(void) = (void *) 7;
# 205 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u32 (*bpf_get_smp_processor_id)(void) = (void *) 8;
# 226 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_skb_store_bytes)(struct __sk_buff *skb, __u32 offset, const void *from, __u32 len, __u64 flags) = (void *) 9;
# 255 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_l3_csum_replace)(struct __sk_buff *skb, __u32 offset, __u64 from, __u64 to, __u64 size) = (void *) 10;
# 291 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_l4_csum_replace)(struct __sk_buff *skb, __u32 offset, __u64 from, __u64 to, __u64 flags) = (void *) 11;
# 326 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_tail_call)(void *ctx, void *prog_array_map, __u32 index) = (void *) 12;
# 354 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_clone_redirect)(struct __sk_buff *skb, __u32 ifindex, __u64 flags) = (void *) 13;
# 367 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u64 (*bpf_get_current_pid_tgid)(void) = (void *) 14;
# 378 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u64 (*bpf_get_current_uid_gid)(void) = (void *) 15;
# 393 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_get_current_comm)(void *buf, __u32 size_of_buf) = (void *) 16;
# 423 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u32 (*bpf_get_cgroup_classid)(struct __sk_buff *skb) = (void *) 17;
# 443 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_skb_vlan_push)(struct __sk_buff *skb, __be16 vlan_proto, __u16 vlan_tci) = (void *) 18;
# 459 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_skb_vlan_pop)(struct __sk_buff *skb) = (void *) 19;
# 514 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_skb_get_tunnel_key)(struct __sk_buff *skb, struct bpf_tunnel_key *key, __u32 size, __u64 flags) = (void *) 20;
# 555 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_skb_set_tunnel_key)(struct __sk_buff *skb, struct bpf_tunnel_key *key, __u32 size, __u64 flags) = (void *) 21;
# 588 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u64 (*bpf_perf_event_read)(void *map, __u64 flags) = (void *) 22;
# 615 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_redirect)(__u32 ifindex, __u64 flags) = (void *) 23;
# 643 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u32 (*bpf_get_route_realm)(struct __sk_buff *skb) = (void *) 24;
# 692 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_perf_event_output)(void *ctx, void *map, __u64 flags, void *data, __u64 size) = (void *) 25;
# 713 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_skb_load_bytes)(const void *skb, __u32 offset, void *to, __u32 len) = (void *) 26;
# 759 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_get_stackid)(void *ctx, void *map, __u64 flags) = (void *) 27;
# 790 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __s64 (*bpf_csum_diff)(__be32 *from, __u32 from_size, __be32 *to, __u32 to_size, __wsum seed) = (void *) 28;
# 812 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_skb_get_tunnel_opt)(struct __sk_buff *skb, void *opt, __u32 size) = (void *) 29;
# 826 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_skb_set_tunnel_opt)(struct __sk_buff *skb, void *opt, __u32 size) = (void *) 30;
# 857 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_skb_change_proto)(struct __sk_buff *skb, __be16 proto, __u64 flags) = (void *) 31;
# 888 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_skb_change_type)(struct __sk_buff *skb, __u32 type) = (void *) 32;
# 903 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_skb_under_cgroup)(struct __sk_buff *skb, void *map, __u32 index) = (void *) 33;
# 923 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u32 (*bpf_get_hash_recalc)(struct __sk_buff *skb) = (void *) 34;
# 933 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u64 (*bpf_get_current_task)(void) = (void *) 35;
# 956 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_probe_write_user)(void *dst, const void *src, __u32 len) = (void *) 36;
# 972 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_current_task_under_cgroup)(void *map, __u32 index) = (void *) 37;
# 1000 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_skb_change_tail)(struct __sk_buff *skb, __u32 len, __u64 flags) = (void *) 38;
# 1041 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_skb_pull_data)(struct __sk_buff *skb, __u32 len) = (void *) 39;
# 1057 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __s64 (*bpf_csum_update)(struct __sk_buff *skb, __wsum csum) = (void *) 40;
# 1071 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static void (*bpf_set_hash_invalid)(struct __sk_buff *skb) = (void *) 41;
# 1086 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_get_numa_node_id)(void) = (void *) 42;
# 1111 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_skb_change_head)(struct __sk_buff *skb, __u32 len, __u64 flags) = (void *) 43;
# 1130 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_xdp_adjust_head)(struct xdp_md *xdp_md, int delta) = (void *) 44;
# 1147 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_probe_read_str)(void *dst, __u32 size, const void *unsafe_ptr) = (void *) 45;
# 1164 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u64 (*bpf_get_socket_cookie)(void *ctx) = (void *) 46;
# 1178 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u32 (*bpf_get_socket_uid)(struct __sk_buff *skb) = (void *) 47;
# 1189 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_set_hash)(struct __sk_buff *skb, __u32 hash) = (void *) 48;
# 1224 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_setsockopt)(void *bpf_socket, int level, int optname, void *optval, int optlen) = (void *) 49;
# 1280 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_skb_adjust_room)(struct __sk_buff *skb, __s32 len_diff, __u32 mode, __u64 flags) = (void *) 50;
# 1309 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_redirect_map)(void *map, __u32 key, __u64 flags) = (void *) 51;
# 1324 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_sk_redirect_map)(struct __sk_buff *skb, void *map, __u32 key, __u64 flags) = (void *) 52;
# 1347 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_sock_map_update)(struct bpf_sock_ops *skops, void *map, void *key, __u64 flags) = (void *) 53;
# 1380 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_xdp_adjust_meta)(struct xdp_md *xdp_md, int delta) = (void *) 54;
# 1434 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_perf_event_read_value)(void *map, __u64 flags, struct bpf_perf_event_value *buf, __u32 buf_size) = (void *) 55;
# 1449 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_perf_prog_read_value)(struct bpf_perf_event_data *ctx, struct bpf_perf_event_value *buf, __u32 buf_size) = (void *) 56;
# 1478 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_getsockopt)(void *bpf_socket, int level, int optname, void *optval, int optlen) = (void *) 57;
# 1507 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_override_return)(struct pt_regs *regs, __u64 rc) = (void *) 58;
# 1555 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_sock_ops_cb_flags_set)(struct bpf_sock_ops *bpf_sock, int argval) = (void *) 59;
# 1573 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_msg_redirect_map)(struct sk_msg_md *msg, void *map, __u32 key, __u64 flags) = (void *) 60;
# 1611 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_msg_apply_bytes)(struct sk_msg_md *msg, __u32 bytes) = (void *) 61;
# 1633 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_msg_cork_bytes)(struct sk_msg_md *msg, __u32 bytes) = (void *) 62;
# 1668 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_msg_pull_data)(struct sk_msg_md *msg, __u32 start, __u32 end, __u64 flags) = (void *) 63;
# 1690 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_bind)(struct bpf_sock_addr *ctx, struct sockaddr *addr, int addr_len) = (void *) 64;
# 1708 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_xdp_adjust_tail)(struct xdp_md *xdp_md, int delta) = (void *) 65;
# 1728 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_skb_get_xfrm_state)(struct __sk_buff *skb, __u32 index, struct bpf_xfrm_state *xfrm_state, __u32 size, __u64 flags) = (void *) 66;
# 1775 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_get_stack)(void *ctx, void *buf, __u32 size, __u64 flags) = (void *) 67;
# 1801 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_skb_load_bytes_relative)(const void *skb, __u32 offset, void *to, __u32 len, __u32 start_header) = (void *) 68;
# 1839 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_fib_lookup)(void *ctx, struct bpf_fib_lookup *params, int plen, __u32 flags) = (void *) 69;
# 1862 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_sock_hash_update)(struct bpf_sock_ops *skops, void *map, void *key, __u64 flags) = (void *) 70;
# 1880 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_msg_redirect_hash)(struct sk_msg_md *msg, void *map, void *key, __u64 flags) = (void *) 71;
# 1898 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_sk_redirect_hash)(struct __sk_buff *skb, void *map, void *key, __u64 flags) = (void *) 72;
# 1939 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_lwt_push_encap)(struct __sk_buff *skb, __u32 type, void *hdr, __u32 len) = (void *) 73;
# 1958 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_lwt_seg6_store_bytes)(struct __sk_buff *skb, __u32 offset, const void *from, __u32 len) = (void *) 74;
# 1978 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_lwt_seg6_adjust_srh)(struct __sk_buff *skb, __u32 offset, __s32 delta) = (void *) 75;
# 2011 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_lwt_seg6_action)(struct __sk_buff *skb, __u32 action, void *param, __u32 param_len) = (void *) 76;
# 2034 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_rc_repeat)(void *ctx) = (void *) 77;
# 2064 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_rc_keydown)(void *ctx, __u32 protocol, __u64 scancode, __u32 toggle) = (void *) 78;
# 2084 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u64 (*bpf_skb_cgroup_id)(struct __sk_buff *skb) = (void *) 79;
# 2096 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u64 (*bpf_get_current_cgroup_id)(void) = (void *) 80;
# 2118 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static void *(*bpf_get_local_storage)(void *map, __u64 flags) = (void *) 81;
# 2131 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_sk_select_reuseport)(struct sk_reuseport_md *reuse, void *map, void *key, __u64 flags) = (void *) 82;
# 2153 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u64 (*bpf_skb_ancestor_cgroup_id)(struct __sk_buff *skb, int ancestor_level) = (void *) 83;
# 2194 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static struct bpf_sock *(*bpf_sk_lookup_tcp)(void *ctx, struct bpf_sock_tuple *tuple, __u32 tuple_size, __u64 netns, __u64 flags) = (void *) 84;
# 2235 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static struct bpf_sock *(*bpf_sk_lookup_udp)(void *ctx, struct bpf_sock_tuple *tuple, __u32 tuple_size, __u64 netns, __u64 flags) = (void *) 85;
# 2247 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_sk_release)(void *sock) = (void *) 86;
# 2261 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_map_push_elem)(void *map, const void *value, __u64 flags) = (void *) 87;
# 2271 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_map_pop_elem)(void *map, void *value) = (void *) 88;
# 2281 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_map_peek_elem)(void *map, void *value) = (void *) 89;
# 2301 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_msg_push_data)(struct sk_msg_md *msg, __u32 start, __u32 len, __u64 flags) = (void *) 90;
# 2317 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_msg_pop_data)(struct sk_msg_md *msg, __u32 start, __u32 len, __u64 flags) = (void *) 91;
# 2335 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_rc_pointer_rel)(void *ctx, __s32 rel_x, __s32 rel_y) = (void *) 92;
# 2387 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_spin_lock)(struct bpf_spin_lock *lock) = (void *) 93;
# 2398 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_spin_unlock)(struct bpf_spin_lock *lock) = (void *) 94;
# 2410 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static struct bpf_sock *(*bpf_sk_fullsock)(struct bpf_sock *sk) = (void *) 95;
# 2422 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static struct bpf_tcp_sock *(*bpf_tcp_sock)(struct bpf_sock *sk) = (void *) 96;
# 2436 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_skb_ecn_set_ce)(struct __sk_buff *skb) = (void *) 97;
# 2448 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static struct bpf_sock *(*bpf_get_listener_sock)(struct bpf_sock *sk) = (void *) 98;
# 2471 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static struct bpf_sock *(*bpf_skc_lookup_tcp)(void *ctx, struct bpf_sock_tuple *tuple, __u32 tuple_size, __u64 netns, __u64 flags) = (void *) 99;
# 2491 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_tcp_check_syncookie)(void *sk, void *iph, __u32 iph_len, struct tcphdr *th, __u32 th_len) = (void *) 100;
# 2511 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_sysctl_get_name)(struct bpf_sysctl *ctx, char *buf, unsigned long buf_len, __u64 flags) = (void *) 101;
# 2534 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_sysctl_get_current_value)(struct bpf_sysctl *ctx, char *buf, unsigned long buf_len) = (void *) 102;
# 2555 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_sysctl_get_new_value)(struct bpf_sysctl *ctx, char *buf, unsigned long buf_len) = (void *) 103;
# 2576 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_sysctl_set_new_value)(struct bpf_sysctl *ctx, const char *buf, unsigned long buf_len) = (void *) 104;
# 2604 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_strtol)(const char *buf, unsigned long buf_len, __u64 flags, long *res) = (void *) 105;
# 2631 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_strtoul)(const char *buf, unsigned long buf_len, __u64 flags, unsigned long *res) = (void *) 106;
# 2666 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static void *(*bpf_sk_storage_get)(void *map, void *sk, void *value, __u64 flags) = (void *) 107;
# 2679 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_sk_storage_delete)(void *map, void *sk) = (void *) 108;
# 2698 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_send_signal)(__u32 sig) = (void *) 109;
# 2729 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __s64 (*bpf_tcp_gen_syncookie)(void *sk, void *iph, __u32 iph_len, struct tcphdr *th, __u32 th_len) = (void *) 110;
# 2757 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_skb_output)(void *ctx, void *map, __u64 flags, void *data, __u64 size) = (void *) 111;
# 2768 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_probe_read_user)(void *dst, __u32 size, const void *unsafe_ptr) = (void *) 112;
# 2779 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_probe_read_kernel)(void *dst, __u32 size, const void *unsafe_ptr) = (void *) 113;
# 2827 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_probe_read_user_str)(void *dst, __u32 size, const void *unsafe_ptr) = (void *) 114;
# 2839 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_probe_read_kernel_str)(void *dst, __u32 size, const void *unsafe_ptr) = (void *) 115;
# 2850 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_tcp_send_ack)(void *tp, __u32 rcv_nxt) = (void *) 116;
# 2868 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_send_signal_thread)(__u32 sig) = (void *) 117;
# 2878 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u64 (*bpf_jiffies64)(void) = (void *) 118;
# 2901 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_read_branch_records)(struct bpf_perf_event_data *ctx, void *buf, __u32 size, __u64 flags) = (void *) 119;
# 2917 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_get_ns_current_pid_tgid)(__u64 dev, __u64 ino, struct bpf_pidns_info *nsdata, __u32 size) = (void *) 120;
# 2945 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_xdp_output)(void *ctx, void *map, __u64 flags, void *data, __u64 size) = (void *) 121;
# 2962 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u64 (*bpf_get_netns_cookie)(void *ctx) = (void *) 122;
# 2984 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u64 (*bpf_get_current_ancestor_cgroup_id)(int ancestor_level) = (void *) 123;
# 3019 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_sk_assign)(void *ctx, void *sk, __u64 flags) = (void *) 124;
# 3031 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u64 (*bpf_ktime_get_boot_ns)(void) = (void *) 125;
# 3064 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_seq_printf)(struct seq_file *m, const char *fmt, __u32 fmt_size, const void *data, __u32 data_len) = (void *) 126;
# 3078 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_seq_write)(struct seq_file *m, const void *data, __u32 len) = (void *) 127;
# 3096 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u64 (*bpf_sk_cgroup_id)(void *sk) = (void *) 128;
# 3118 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u64 (*bpf_sk_ancestor_cgroup_id)(void *sk, int ancestor_level) = (void *) 129;
# 3139 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_ringbuf_output)(void *ringbuf, void *data, __u64 size, __u64 flags) = (void *) 130;
# 3151 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static void *(*bpf_ringbuf_reserve)(void *ringbuf, __u64 size, __u64 flags) = (void *) 131;
# 3169 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static void (*bpf_ringbuf_submit)(void *data, __u64 flags) = (void *) 132;
# 3187 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static void (*bpf_ringbuf_discard)(void *data, __u64 flags) = (void *) 133;
# 3208 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u64 (*bpf_ringbuf_query)(void *ringbuf, __u64 flags) = (void *) 134;
# 3244 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_csum_level)(struct __sk_buff *skb, __u64 level) = (void *) 135;
# 3254 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static struct tcp6_sock *(*bpf_skc_to_tcp6_sock)(void *sk) = (void *) 136;
# 3264 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static struct tcp_sock *(*bpf_skc_to_tcp_sock)(void *sk) = (void *) 137;
# 3274 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static struct tcp_timewait_sock *(*bpf_skc_to_tcp_timewait_sock)(void *sk) = (void *) 138;
# 3284 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static struct tcp_request_sock *(*bpf_skc_to_tcp_request_sock)(void *sk) = (void *) 139;
# 3294 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static struct udp6_sock *(*bpf_skc_to_udp6_sock)(void *sk) = (void *) 140;
# 3330 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_get_task_stack)(struct task_struct *task, void *buf, __u32 size, __u64 flags) = (void *) 141;
# 3397 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_load_hdr_opt)(struct bpf_sock_ops *skops, void *searchby_res, __u32 len, __u64 flags) = (void *) 142;
# 3434 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_store_hdr_opt)(struct bpf_sock_ops *skops, const void *from, __u32 len, __u64 flags) = (void *) 143;
# 3460 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_reserve_hdr_opt)(struct bpf_sock_ops *skops, __u32 len, __u64 flags) = (void *) 144;
# 3492 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static void *(*bpf_inode_storage_get)(void *map, void *inode, void *value, __u64 flags) = (void *) 145;
# 3504 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static int (*bpf_inode_storage_delete)(void *map, void *inode) = (void *) 146;
# 3520 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_d_path)(struct path *path, char *buf, __u32 sz) = (void *) 147;
# 3531 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_copy_from_user)(void *dst, __u32 size, const void *user_ptr) = (void *) 148;
# 3571 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_snprintf_btf)(char *str, __u32 str_size, struct btf_ptr *ptr, __u32 btf_ptr_size, __u64 flags) = (void *) 149;
# 3583 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_seq_printf_btf)(struct seq_file *m, struct btf_ptr *ptr, __u32 ptr_size, __u64 flags) = (void *) 150;
# 3596 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u64 (*bpf_skb_cgroup_classid)(struct __sk_buff *skb) = (void *) 151;
# 3621 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_redirect_neigh)(__u32 ifindex, struct bpf_redir_neigh *params, int plen, __u64 flags) = (void *) 152;
# 3642 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static void *(*bpf_per_cpu_ptr)(const void *percpu_ptr, __u32 cpu) = (void *) 153;
# 3658 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static void *(*bpf_this_cpu_ptr)(const void *percpu_ptr) = (void *) 154;
# 3678 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_redirect_peer)(__u32 ifindex, __u64 flags) = (void *) 155;
# 3710 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static void *(*bpf_task_storage_get)(void *map, struct task_struct *task, void *value, __u64 flags) = (void *) 156;
# 3722 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_task_storage_delete)(void *map, struct task_struct *task) = (void *) 157;
# 3734 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static struct task_struct *(*bpf_get_current_task_btf)(void) = (void *) 158;
# 3748 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_bprm_opts_set)(struct linux_binprm *bprm, __u64 flags) = (void *) 159;
# 3762 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u64 (*bpf_ktime_get_coarse_ns)(void) = (void *) 160;
# 3776 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_ima_inode_hash)(struct inode *inode, void *dst, __u32 size) = (void *) 161;
# 3788 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static struct socket *(*bpf_sock_from_file)(struct file *file) = (void *) 162;
# 3859 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_check_mtu)(void *ctx, __u32 ifindex, __u32 *mtu_len, __s32 len_diff, __u64 flags) = (void *) 163;
# 3892 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_for_each_map_elem)(void *map, void *callback_fn, void *callback_ctx, __u64 flags) = (void *) 164;
# 3924 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_snprintf)(char *str, __u32 str_size, const char *fmt, __u64 *data, __u32 data_len) = (void *) 165;
# 3934 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_sys_bpf)(__u32 cmd, void *attr, __u32 attr_size) = (void *) 166;
# 3944 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_btf_find_by_name_kind)(char *name, int name_sz, __u32 kind, int flags) = (void *) 167;
# 3954 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_sys_close)(__u32 fd) = (void *) 168;
# 3975 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_timer_init)(struct bpf_timer *timer, void *map, __u64 flags) = (void *) 169;
# 3990 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_timer_set_callback)(struct bpf_timer *timer, void *callback_fn) = (void *) 170;
# 4020 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_timer_start)(struct bpf_timer *timer, __u64 nsecs, __u64 flags) = (void *) 171;
# 4034 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_timer_cancel)(struct bpf_timer *timer) = (void *) 172;
# 4044 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u64 (*bpf_get_func_ip)(void *ctx) = (void *) 173;
# 4063 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u64 (*bpf_get_attach_cookie)(void *ctx) = (void *) 174;
# 4073 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_task_pt_regs)(struct task_struct *task) = (void *) 175;
# 4098 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_get_branch_snapshot)(void *entries, __u32 size, __u64 flags) = (void *) 176;
# 4112 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_trace_vprintk)(const char *fmt, __u32 fmt_size, const void *data, __u32 data_len) = (void *) 177;
# 4122 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static struct unix_sock *(*bpf_skc_to_unix_sock)(void *sk) = (void *) 178;
# 4141 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_kallsyms_lookup_name)(const char *name, int name_sz, int flags, __u64 *res) = (void *) 179;
# 4164 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_find_vma)(struct task_struct *task, __u64 addr, void *callback_fn, void *callback_ctx, __u64 flags) = (void *) 180;
# 4192 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_loop)(__u32 nr_loops, void *callback_fn, void *callback_ctx, __u64 flags) = (void *) 181;
# 4206 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_strncmp)(const char *s1, __u32 s1_sz, const char *s2) = (void *) 182;
# 4219 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_get_func_arg)(void *ctx, __u32 n, __u64 *value) = (void *) 183;
# 4232 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_get_func_ret)(void *ctx, __u64 *value) = (void *) 184;
# 4243 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_get_func_arg_cnt)(void *ctx) = (void *) 185;
# 4255 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static int (*bpf_get_retval)(void) = (void *) 186;
# 4267 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static int (*bpf_set_retval)(int retval) = (void *) 187;
# 4277 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u64 (*bpf_xdp_get_buff_len)(struct xdp_md *xdp_md) = (void *) 188;
# 4290 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_xdp_load_bytes)(struct xdp_md *xdp_md, __u32 offset, void *buf, __u32 len) = (void *) 189;
# 4301 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_xdp_store_bytes)(struct xdp_md *xdp_md, __u32 offset, void *buf, __u32 len) = (void *) 190;
# 4315 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_copy_from_user_task)(void *dst, __u32 size, const void *user_ptr, struct task_struct *tsk, __u64 flags) = (void *) 191;
# 4349 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_skb_set_tstamp)(struct __sk_buff *skb, __u64 tstamp, __u32 tstamp_type) = (void *) 192;
# 4363 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_ima_file_hash)(struct file *file, void *dst, __u32 size) = (void *) 193;
# 4378 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static void *(*bpf_kptr_xchg)(void *map_value, void *ptr) = (void *) 194;
# 4390 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static void *(*bpf_map_lookup_percpu_elem)(void *map, const void *key, __u32 cpu) = (void *) 195;
# 4400 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static struct mptcp_sock *(*bpf_skc_to_mptcp_sock)(void *sk) = (void *) 196;
# 4415 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_dynptr_from_mem)(void *data, __u32 size, __u64 flags, struct bpf_dynptr *ptr) = (void *) 197;
# 4430 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_ringbuf_reserve_dynptr)(void *ringbuf, __u32 size, __u64 flags, struct bpf_dynptr *ptr) = (void *) 198;
# 4445 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static void (*bpf_ringbuf_submit_dynptr)(struct bpf_dynptr *ptr, __u64 flags) = (void *) 199;
# 4459 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static void (*bpf_ringbuf_discard_dynptr)(struct bpf_dynptr *ptr, __u64 flags) = (void *) 200;
# 4473 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_dynptr_read)(void *dst, __u32 len, struct bpf_dynptr *src, __u32 offset, __u64 flags) = (void *) 201;
# 4487 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_dynptr_write)(struct bpf_dynptr *dst, __u32 offset, void *src, __u32 len, __u64 flags) = (void *) 202;
# 4502 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static void *(*bpf_dynptr_data)(struct bpf_dynptr *ptr, __u32 offset, __u32 len) = (void *) 203;
# 4526 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __s64 (*bpf_tcp_raw_gen_syncookie_ipv4)(struct iphdr *iph, struct tcphdr *th, __u32 th_len) = (void *) 204;
# 4552 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __s64 (*bpf_tcp_raw_gen_syncookie_ipv6)(struct ipv6hdr *iph, struct tcphdr *th, __u32 th_len) = (void *) 205;
# 4571 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_tcp_raw_check_syncookie_ipv4)(struct iphdr *iph, struct tcphdr *th) = (void *) 206;
# 4592 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static long (*bpf_tcp_raw_check_syncookie_ipv6)(struct ipv6hdr *iph, struct tcphdr *th) = (void *) 207;
# 4607 "/usr/include/bpf/bpf_helper_defs.h" 3 4
static __u64 (*bpf_ktime_get_tai_ns)(void) = (void *) 208;
# 12 "/usr/include/bpf/bpf_helpers.h" 2 3 4
# 163 "/usr/include/bpf/bpf_helpers.h" 3 4
enum libbpf_pin_type {
 LIBBPF_PIN_NONE,

 LIBBPF_PIN_BY_NAME,
};

enum libbpf_tristate {
 TRI_NO = 0,
 TRI_YES = 1,
 TRI_MODULE = 2,
};
# 3 "hash_map_example.bpf.c" 2
# 1 "/usr/lib/llvm-14/lib/clang/14.0.0/include/stdint.h" 1 3
# 52 "/usr/lib/llvm-14/lib/clang/14.0.0/include/stdint.h" 3
# 1 "/usr/include/stdint.h" 1 3 4
# 26 "/usr/include/stdint.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 1 3 4
# 33 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 392 "/usr/include/features.h" 3 4
# 1 "/usr/include/features-time64.h" 1 3 4
# 20 "/usr/include/features-time64.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 21 "/usr/include/features-time64.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/timesize.h" 1 3 4
# 19 "/usr/include/x86_64-linux-gnu/bits/timesize.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 20 "/usr/include/x86_64-linux-gnu/bits/timesize.h" 2 3 4
# 22 "/usr/include/features-time64.h" 2 3 4
# 393 "/usr/include/features.h" 2 3 4
# 464 "/usr/include/features.h" 3 4
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 465 "/usr/include/features.h" 2 3 4
# 486 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 1 3 4
# 559 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 560 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/long-double.h" 1 3 4
# 561 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 487 "/usr/include/features.h" 2 3 4
# 510 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 2 3 4
# 511 "/usr/include/features.h" 2 3 4
# 34 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 2 3 4
# 27 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/timesize.h" 1 3 4
# 19 "/usr/include/x86_64-linux-gnu/bits/timesize.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 20 "/usr/include/x86_64-linux-gnu/bits/timesize.h" 2 3 4
# 29 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;






typedef __int8_t __int_least8_t;
typedef __uint8_t __uint_least8_t;
typedef __int16_t __int_least16_t;
typedef __uint16_t __uint_least16_t;
typedef __int32_t __int_least32_t;
typedef __uint32_t __uint_least32_t;
typedef __int64_t __int_least64_t;
typedef __uint64_t __uint_least64_t;



typedef long int __quad_t;
typedef unsigned long int __u_quad_t;







typedef long int __intmax_t;
typedef unsigned long int __uintmax_t;
# 141 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/typesizes.h" 1 3 4
# 142 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/time64.h" 1 3 4
# 143 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;
typedef long int __suseconds64_t;

typedef int __daddr_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;


typedef long int __fsword_t;

typedef long int __ssize_t;


typedef long int __syscall_slong_t;

typedef unsigned long int __syscall_ulong_t;



typedef __off64_t __loff_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;




typedef int __sig_atomic_t;
# 28 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wchar.h" 1 3 4
# 29 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 30 "/usr/include/stdint.h" 2 3 4




# 1 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h" 3 4
typedef __int8_t int8_t;
typedef __int16_t int16_t;
typedef __int32_t int32_t;
typedef __int64_t int64_t;
# 35 "/usr/include/stdint.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h" 3 4
typedef __uint8_t uint8_t;
typedef __uint16_t uint16_t;
typedef __uint32_t uint32_t;
typedef __uint64_t uint64_t;
# 38 "/usr/include/stdint.h" 2 3 4





typedef __int_least8_t int_least8_t;
typedef __int_least16_t int_least16_t;
typedef __int_least32_t int_least32_t;
typedef __int_least64_t int_least64_t;


typedef __uint_least8_t uint_least8_t;
typedef __uint_least16_t uint_least16_t;
typedef __uint_least32_t uint_least32_t;
typedef __uint_least64_t uint_least64_t;





typedef signed char int_fast8_t;

typedef long int int_fast16_t;
typedef long int int_fast32_t;
typedef long int int_fast64_t;
# 71 "/usr/include/stdint.h" 3 4
typedef unsigned char uint_fast8_t;

typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long int uint_fast64_t;
# 87 "/usr/include/stdint.h" 3 4
typedef long int intptr_t;


typedef unsigned long int uintptr_t;
# 101 "/usr/include/stdint.h" 3 4
typedef __intmax_t intmax_t;
typedef __uintmax_t uintmax_t;
# 53 "/usr/lib/llvm-14/lib/clang/14.0.0/include/stdint.h" 2 3
# 4 "hash_map_example.bpf.c" 2


/* int (*a)[3]; -- https://parrt.cs.usfca.edu/doc/how-to-read-C-declarations.html
/ The parentheses change the order just like in an expression. 
When you look right after a , you see the right parenthesis, 
which you cannot jump over until you look left. 
Hence, you would say a is a pointer to an array of 3 ints. */

/* -- Create a new ebpf struct that translates to ebpf c struct 
struct counter_table 
  type : ref (array of int of size 1)
  max_entries : ref (array of int of size 10240)
  key : ref (int64)
  value : ref (int64)
  */ // __attribute__((section(".maps"), used))
struct {
    int (*type)[BPF_MAP_TYPE_HASH];
    int (*max_entries)[10240];
    typeof(uint64_t) *key;
    typeof(uint64_t) *value;
} counter_table
# 12 "hash_map_example.bpf.c"
#pragma GCC diagnostic push
# 12 "hash_map_example.bpf.c"
#pragma GCC diagnostic ignored "-Wignored-attributes"
# 12 "hash_map_example.bpf.c"
                __attribute__((section(".maps"), used))
# 12 "hash_map_example.bpf.c"
#pragma GCC diagnostic pop
# 12 "hash_map_example.bpf.c"
                            ;

#pragma GCC diagnostic push
# 14 "hash_map_example.bpf.c"
#pragma GCC diagnostic ignored "-Wignored-attributes"
# 14 "hash_map_example.bpf.c"
 __attribute__((section("ksyscall/execve"), used))
# 14 "hash_map_example.bpf.c"
#pragma GCC diagnostic pop

int hello(void *ctx) {
    uint64_t uid;
    uint64_t counter = 0;
    uint64_t *p;

    uid = bpf_get_current_uid_gid() & 0xFFFFFFFF;


    p = bpf_map_lookup_elem(&counter_table, (&uid));
    if (p!= 0) {
        counter = *p;
    }

    counter++;
    bpf_map_update_elem(&counter_table, &uid, &counter, 0);
    return 0;
}
