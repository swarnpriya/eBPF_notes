# eBPF program
- The program written in eBPF that counts the network packets.

```
#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

int counter = 0;

SEC("xdp")
int packet_count(void *ctx) {
    bpf_printk("%d", counter);
    counter++;
    return XDP_PASS;
}

char LICENSE[] SEC("license") = "Dual BSD/GPL";
```

## How to run and print the output?
- Go to the directory eBPF_Koka/packet_count and do "make"
    - "make" produces the object file "packet_count.bpf.o"
- Inspecting the object file:

  **<span style="color:green">$ file packet_count.bpf.o</span>**
  
  Output: 
  ```packet_count.bpf.o: ELF 64-bit LSB relocatable, eBPF, version 1 (SYSV), with     debug_info, not stripped```
- Inspecting the object file:
  
  **<span style="color:green">$ llvm-objdump -S packet_count.bpf.o</span>**

  Output:
    ```
    packet_count.bpf.o: file format elf64-bpf

    Disassembly of section xdp:

    0000000000000000 <packet_count>:
    ; bpf_printk("%d", counter);
       0: 18 06 00 00 00 00 00 00 00 00 00 00 00 00 00 00 r6 = 0 ll
       2: 61 63 00 00 00 00 00 00 r3 = *(u32 *)(r6 + 0)
       3: 18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 r1 = 0 ll
       5: b7 02 00 00 03 00 00 00 r2 = 3
       6: 85 00 00 00 06 00 00 00 call 6
    ; counter++;
       7: 61 61 00 00 00 00 00 00 r1 = *(u32 *)(r6 + 0)
       8: 07 01 00 00 01 00 00 00 r1 += 1
       9: 63 16 00 00 00 00 00 00 *(u32 *)(r6 + 0) = r1
    ; return XDP_PASS;
      10: b7 00 00 00 02 00 00 00 r0 = 2
      11: 95 00 00 00 00 00 00 00 exit      
    ```
- Loading the program into the kernel:
  
  **<span style="color:green"> bpftool prog load packet_count.bpf.o /sys/fs/bpf/packet_count </span>**
  
  Output:
  
  No output response to this command indicates success.

  To confirm, do 
  **<span style="color:green">$ ls /sys/fs/bpf</span>**
  
  Output: 
  ```packet_count```

- Inspecting the loaded program:
  
  **<span style="color:green">$ bpftool prog list</span>**
  
  Output:
    ```
    ...
    228: cgroup_device  tag 03b4eaae2f14641a  gpl
            loaded_at 2024-02-12T16:51:07-0500  uid 1000
            xlated 296B  jited 163B  memlock 4096B  map_ids 84
    238: xdp  name packet_count  tag 644ee9a75611c6d0  gpl
            loaded_at 2024-02-12T16:55:51-0500  uid 0
            xlated 96B  jited 64B  memlock 4096B  map_ids 87,88
            btf_id 307
    ```

- The translated Bytecode:

  **<span style="color:green">$ bpftool prog dump xlated name packet_count</span>**

  Output:
    ```
     238: xdp  name packet_count  tag 644ee9a75611c6d0  gpl
     int packet_count(void * ctx):
     ; bpf_printk("%d", counter);
        0: (18) r6 = map[id:87][0]+0
        2: (61) r3 = *(u32 *)(r6 +0)
        3: (18) r1 = map[id:88][0]+0
        5: (b7) r2 = 3
        6: (85) call bpf_trace_printk#-108416
    ; counter++;
        7: (61) r1 = *(u32 *)(r6 +0)
        8: (07) r1 += 1
        9: (63) *(u32 *)(r6 +0) = r1
    ; return XDP_PASS;
      10: (b7) r0 = 2
      11: (95) exit
    ```
- The JIT-Compiled Machine Code

  **<span style="color:green">$ bpftool prog dump jited name packet_count</span>**

  Output:
    ```
    int packet_count(void * ctx):
    bpf_prog_644ee9a75611c6d0_packet_count:
    ; bpf_printk("%d", counter);
        0: nopl (%rax,%rax)
        5: nop
        7: pushq %rbp
        8: movq %rsp, %rbp
        b: pushq %rbx
        c: movabsq $-79770420068352, %rbx
        16: movl (%rbx), %edx
        19: movabsq $-109408656120560, %rdi
        23: movl $3, %esi
        28: callq 0xffffffffc9c462cc
    ; counter++;
        2d: movl (%rbx), %edi
        30: addq $1, %rdi
        34: movl %edi, (%rbx)
    ; return XDP_PASS;
        37: movl $2, %eax
        3c: popq %rbx
        3d: leave
        3e: retq
        3f: int3
    ```

- Attaching to an Event:
  - **<span style="color:green">$ route</span>** : Generates the network interface name
  - **<span style="color:green">$ bpftool net attach xdp id 238 dev wlp2s0</span>**
  - At this point, the packet_count eBPF program should be producing the count everytime a network packet is received.
  - **<span style="color:green">$ cat /sys/kernel/debug/tracing/tracepipe</span>** 
    ```
        irq/158-iwlwifi-486     [007] ..s21 21068.249939: bpf_trace_printk: 189
        irq/158-iwlwifi-486     [007] ..s21 21069.467443: bpf_trace_printk: 190
        irq/158-iwlwifi-486     [007] ..s21 21072.185747: bpf_trace_printk: 191
        irq/158-iwlwifi-486     [007] ..s21 21073.348452: bpf_trace_printk: 192
        irq/158-iwlwifi-486     [007] ..s21 21074.233170: bpf_trace_printk: 193
        irq/158-iwlwifi-486     [007] ..s21 21075.359938: bpf_trace_printk: 194
        irq/158-iwlwifi-486     [007] ..s21 21077.714974: bpf_trace_printk: 195
        irq/158-iwlwifi-486     [007] ..s21 21078.490720: bpf_trace_printk: 196
        irq/158-iwlwifi-486     [007] ..s21 21082.425205: bpf_trace_printk: 197
        irq/158-iwlwifi-486     [007] ..s21 21088.364773: bpf_trace_printk: 198
        irq/158-iwlwifi-486     [007] ..s21 21088.730954: bpf_trace_printk: 199
        irq/158-iwlwifi-486     [007] ..s21 21089.246760: bpf_trace_printk: 200
    ```


# Notes:
- Packet processing is a very common application of eBPF. 
