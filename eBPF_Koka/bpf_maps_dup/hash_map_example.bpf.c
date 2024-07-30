#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>
#include <stdint.h>
#include <stdlib.h>
#include <memory.h>

// How many times each different user has run programs.

struct {
    __uint(type, BPF_MAP_TYPE_HASH);
    __uint(max_entries, 5000000);
    __type(key, uint64_t);
    __type(value, uint64_t);
} counter_table SEC(".maps");

uint64_t uid;

SEC("ksyscall/execve")

int hello(void *ctx) {
    uint64_t counter = 0;
    uint64_t *p;

    /*
    int *ptr = (int *) malloc(sizeof(int));
    if(ptr) {
        *ptr = 5;
        free(ptr);
    } */
    

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
