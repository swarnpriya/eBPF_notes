# Lifetime of BPF object

- BPF objects (BPF programs, maps, debug info) are accessed by the user-sapce via file-descriptots and each object has a reference counter.
- Example:
   -  The following bpf() syscall creates a hash table called config:
    ```
    bpf(BPF_MAP_CREATE, {map_type=BPF_MAP_TYPE_HASH, key_size=4, value_size=12, max_entries=10240... map_name="config", ...btf_fd=3, ...}, 128) = 5
    ```
    - The kernel allocates a ```struct bpf_map``` object.
    - The kernel inilializes the reference count of the above structure ```bpf_map``` as 1 and returns a file descriptor ```5``` to the user-sapce.
    - If the process exits or crashes right after, the FD is closes and the reference counter is decremented.