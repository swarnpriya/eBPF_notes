#include <linux/bpf.h>
// #include <bpf/libbpf.h>
#include <bpf/bpf_helpers.h>
#include <stdint.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/syscall.h>

/*
static inline int sys_bpf(enum bpf_cmd cmd, union bpf_attr *attr,
			  unsigned int size)
{
	return syscall(__NR_bpf, cmd, attr, size);
}

int bpf_create_map(enum bpf_map_type map_type,
		   unsigned int key_size,
		   unsigned int value_size,
		   unsigned int max_entries)
{
	union bpf_attr attr = {
	  .map_type    = map_type,
	  .key_size    = key_size,
	  .value_size  = value_size,
	  .max_entries = max_entries
	};

	return sys_bpf(BPF_MAP_CREATE, &attr, sizeof(attr));
}*/

SEC("ksyscall/execve")

int hello(void *ctx) {
    int counter_table, key, value;
    counter_table = bpf_map_create(BPF_MAP_TYPE_HASH, sizeof(key), sizeof(value), 10240);
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



