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
}