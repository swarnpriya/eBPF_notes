# Maps
- Maps provide a way for eBPF programs to communicate with each other (kernel space) and also with the user space programs.
- When both user space and kernel space access the same maps, they both need an understanding about the key and value structures in the memory. This can work if both the user space and kernel space programs accessing the maps are written in C and they share the header. Or there must be some means to transfer the information about map structure in a consistent manner to both user space and kernel space. 

## Defining maps in eBPF programs
- When we want to use maps in eBPF programs, we need to define them in our program.

### Legacy way of defining maps:
- Map definitions were done defining a ```struct bpf_map_def``` with an elf ```section __attribute__``` ```SEC("maps")```, which contains various fields like type of map, size of key and value, maximum entries allowed in a map, and flags showcasing some specific properties. These map declaration should reside 
```
struct bpf_map_def {
      unsigned int type;
      unsigned int key_size;
      unsigned int value_size;
      unsigned int max_entries;
      unsigned int map_flags;
};

struct bpf_map_def SEC("maps") my_map = {
      .type        = BPF_MAP_TYPE_XXX,
      .key_size    = sizeof(u32),
      .value_size  = sizeof(u64),
      .max_entries = 42,
      .map_flags   = 0
};
```
