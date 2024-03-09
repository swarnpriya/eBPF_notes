# Helper Functions
- eBPF programs are written in the user space to augment or change some kernel functionalities. 
- To access any resources or functionalities at the kernel level, the program needs to use the **helper functions**. Some examples are:
    - **bpf_map_lookup_elem** : Perform a lookup in map for an entry associated to key.
    - **bpf_get_current_pi_tgid()** : Retrieves the current user space process ID and thread ID. 
    - **bpf_printk** : Write a string to text.
    - **bpf_xdp_adjust_head** : Adjust (move) xdp_md-> data by delta bytes. This helper can be used to prepare the packet for pushing/popping headers.
      A call to this function is suspectible to change the underlying packet buffer. Therefore, at load time,all checks on pointers previously done by 
      the verifier are invalidated and must be performed again, if the helper is used in combination with direct packet access.
- Helper functions are used by the eBPF programs to interact with the system, or with the context in which they work. Some examples are:
    - To print debug messages
    - To interact with eBPF maps
    - To manipulate network packets
- A helper function cannot have more than 5 arguments.

# Helper Function Arguments
- Each helper function has a **bpf_func_proto** structure. For example
    ```
    const struct bpf_func_proto bpf_map_lookup_elem_proto = {
        .func = bpf_map_lookup_elem,
        .gpl_only = false,  /* Checks the GPL license if set to true */
        .pkt_access = true,
        .ret_type = RET_PTR_TO_MAP_VALUE_OR_NULL,
        .arg1_type = ARG_CONST_MAP_PTR,
        .arg2_type = ARG_PTR_TO_MAP_KEY,
    }
    ```
    ```
           void *bpf_map_lookup_elem(struct bpf_map *map, const void *key)
    ```
    This structure defines the constraints for arguments and return values of the helper functions. 
- The verifier keeps track of the register states like the type and the value it holds. This might help to catch the error when the correct type of arguments are not passed to the helper functions. For example, in the usage of above helper function "bpf_map_lookup" if someone tries to pass a pointer to a structure as an argument instead of a pointer to a map, it will not work when we load the program at the kernel level. *There is no issue from the compiler point of view as there is no type system ensuring the correctness of the type.*
  
## Where the verifier falls short?
  - State explosion still persists.
  - The verifier checks the type of arguments and return value, but does not guarantees the funcitonal correctness of the functions.
 
## References:
(1) [Description of various helper functions](https://man7.org/linux/man-pages/man7/bpf-helpers.7.html) 
(2) [bpf.h](https://elixir.bootlin.com/linux/latest/source/include/linux/bpf.h)
