# Helper Functions
- eBPF programs are written in the user space to augment or change some kernel functionalities. 
- To access any resources or functionalities at the kernel level, the program needs to use the **helper functions**. Some examples are:
    - **bpf_get_current_pi_tgid()** : Retrieves the current user space process ID and thread ID. 
    - **bpf_printk** : Write a string to text.

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
    This structure defines the constraints for arguments and return values of the helper functions. 
- The verifier keeps track of the register states like the type and the value it holds. This might help to catch the error when the correct type of arguments are not passed to the helper functions. For example, in the usage of above helper function "bpf_map_lookup" if someone tries to pass a pointer to a structure as an argument instead of a pointer to a map, it will not work when we load the program at the kernel level. *There is no issue from the compiler point of view as there is no type system ensuring the correctness of the type.*
- Though while loading the program at the kernel level, the verifier was able to catch the error. But the drawback of state explosion still persists. 