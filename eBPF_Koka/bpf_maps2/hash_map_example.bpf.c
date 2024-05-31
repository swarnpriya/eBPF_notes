#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>
#include <stdint.h>

// How many times each different user has run programs.
/*
struct bpf_map_def {
      unsigned int type;
      unsigned int key_size;
      unsigned int value_size;
      unsigned int max_entries;
      unsigned int map_flags;
};

struct bpf_map_def SEC("maps") counter_table = {
      .type        = BPF_MAP_TYPE_HASH,
      .key_size    = sizeof(uint64_t),
      .value_size  = sizeof(uint64_t),
      .max_entries = 10240,
      .map_flags   = 0
}; */

struct {
	int type;
	int max_entries;
	int *key;
	int *value;
} counter_table SEC(".maps") = {
	.type = BPF_MAP_TYPE_HASH,
	.max_entries = 10240,
};

SEC("ksyscall/execve")

int hello(void *ctx) {
    uint64_t uid;
    uint64_t counter = 0;
    uint64_t *p;

    uid = bpf_get_current_uid_gid() & 0xFFFFFFFF;   //returns a 64 bits integer containing the current GID and UID
                                                    //gets the user id that is running the process that trigegered this krpobe event. 
                                                    //user-id is held in lowest 32 bits of the 64-bit value that gets returned. (top 32 holds the group id)
    p = bpf_map_lookup_elem(&counter_table, (&uid)); //returns a pointer to the corresponding value in the hash table 
    if (p!= 0) {
        counter = *p;
    }

    counter++;
    bpf_map_update_elem(&counter_table, &uid, &counter, 0);
    return 0;
}

// https://lwn.net/ml/netdev/20190531202132.379386-7-andriin@fb.com/ 

/* 
libbpf: map 'counter_table': attr 'type': expected PTR, got int.
Error: failed to open object file
*/

/*
libbpf: map 'counter_table': attr 'type': expected ARRAY, got int.
Error: failed to open object file
*/