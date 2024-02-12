# BPF Maps 
- A map is a data structure that can be accessed from an eBPF program and from user space. 
- Maps can be used to share data among multiple eBPF programs or to communicate between a user space application and eBPF code running in the kernel. 
- Some examples where maps can be used:
    - An eBPF program storing state and this state can be later retrieved from the map to be used by other eBPF programs. Or even the same program can use this state stored in the map during its later run. 
    - An eBPF program can write results into a map. 
- Maps are key-value stores. 
- Maps can be used to represent different sturctures. For example, map types are defined as arrays, which always have a 4-byte index as the key type. Maps are hash tables that can use some arbitrary data type as key.
- Examples of eBPF map types: 
    - ```sockmaps```: Hold information about sockets.
    - ```devmaps```: Hold information about network devices and are used by network-related eBPF programs to redirect traffic. 
    - ```program array map```: Stores a set of indexed eBPF programs, and used to implement tail calls, where one program can call another.
    - ```map-of-maps type```: Store information about maps

    ## Example program:
    ```
    BPF_HASH(counter_table);

    int hello(void *ctx) {
        u64 uid;
        u64 counter = 0;
        u64 *p;

        uid = bpf_get_current_uid_gid() & 0xFFFFFFFF;
        p = counter_table.loopkup(&uid);
        if (p!=0) {
            counter = *p;
        }
        counter++;
        counter_table.update(&uid, &counter);
        return 0;
    }

    while True:
        sleep(2)
        s = ""
        for k,v in b["copunter_table"].items():
            s += f"ID {k.value}: {v.value}\t"
        print(s)
    ```

    - ```BPF_HASH()```: a BCC macro that defines a hash table map. 
    - ```bpf_get_current_uid_gid```: a helper function used to obtain the user ID that is running the process that triggered this kprobe event. 
    - ```counter_table.lookup```: looks for the uid in the counter_table and returns a pointer to the corresponding value in the hash table.
    - If ```counter_table.lookup``` finds an entry for the user-id "uid", then the counter is set to the current value in the hashtable (pointed to by p). If there is no entry in the ```counter_table``` then pointer will be 0, and the counter value will be left at 0.
    - Whatever the counter value is, it gets incremented by one. 
    - The value for the user id - uid is updated in the table. 
