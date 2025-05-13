#include <bpf/bpf.h>
#include <linux/bpf.h>
#include <stdint.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>

int main() {
    // Step 1: Create BPF hash map equivalent to:
    // struct { __uint(type, BPF_MAP_TYPE_HASH); __uint(max_entries, 5000000); __type(key, uint64_t); __type(value, uint64_t); } counter_table SEC(".maps");

    int map_fd = bpf_create_map(
        BPF_MAP_TYPE_HASH,       // type
        sizeof(uint64_t),        // key size
        sizeof(uint64_t),        // value size
        5000000,                 // max entries
        0                        // flags
    );

    if (map_fd < 0) {
        perror("bpf_create_map failed");
        return 1;
    }

    // Step 2: Simulate UID fetch (in kernel, this would be bpf_get_current_uid_gid() & 0xFFFFFFFF)
    uint64_t uid = (uint64_t)getuid();  // or hardcode for test

    // Step 3: Lookup existing value in the map
    uint64_t counter = 0;
    uint64_t *lookup_result = bpf_map_lookup_elem(map_fd, &uid);
    if (lookup_result) {
        counter = *lookup_result;
    }

    // Step 4: Increment and update the counter
    counter++;

    if (bpf_map_update_elem(map_fd, &uid, &counter, 0) != 0) {
        perror("bpf_map_update_elem failed");
        return 1;
    }

    printf("Updated counter for UID %lu to %lu\n", uid, counter);
    return 0;
}
