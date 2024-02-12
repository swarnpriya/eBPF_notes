# eBPF Virtual Machine
- The eBPF virtual machine is a software implementation of a computer. 
- It takes in a program in the form of eBPF bytecode instructions, and these need to be converted to the machine code. 
- eBPF bytecode consists of a set of instructions and those instructions act on (virtual) eBPF registers. 
- The eBPF instruction set and register model were designed to map neatly to common CPU architectures.

## eBPF Registers:
- The eBPF virtual machine used 10 general purpose registers, numbered 0 to 9. 
- Register 10 is used as stack frame pointer (i.e. it can only be read and never written).
- As the execution of BPF program progresses, values get stored in these registers to keep track of the state. 
- Before calling a function from eBPF code, the arguments to that function are placed in Register 1 through Register 5. The return value from the function is stored in Register 0. 


## eBPF Instructions:
```
struct bpf_insn {
    _u8 code;              /* opcode */
    _u8 dst_reg:4;         /* dest register */
    _u8 src_reg:4;         /* source register */
    _s16 off;              /* signed offset */
    _s32 imm;              /* immediate constant */
}
```
Each instruction has an opcode, which defines what operation the instructon is to perform. 

- When loaded into the kernel, the bytecode of an eBPF program is represented by a series of theses bpf_insn.
- The eBPF verifier performs a range of checks on these bpf_insn to ensure various properties like memory safety, safe acquisition and release, termination, freedom from crashes, etc. 

## Loading the program in kernel
- The bpftool is used to load a program into the kernel
- The bpftool utility can list all the programs that are loaded into the kernel. (bpftool prog list)
- Each program loaded into the kernel is assigned an id. This id is used to retrieve more information about the program.
- There are several fields associated with the loaded program:
  - id : identifier for the program. This can be used to retrieve more information about the program 
  - type : it defines the trigerred event that the eBPF program is associated with. For example, if someone wants to inspects the network packets, then the type will be "xdp". 
  - name : the name of the program. 
  - tag : it is another kind of identifier for the program which is computed usins the secure hashing algorithm. It is SHA sum of the program's nstructions.
  - gpl_compatible : license used by the kernel to check the authenticity
  - loaded_at : the timestamp when the program was loaded into the kernel
  - uid : used id which loaded the program 
  - bytes_xlated : the number of bytes which represents the translated bytecode.
  - jited: true or false. true means the program is JIT compiled to machine code and false indicates that it is not. 
  - bytes_jited : the number of bytes which represents the translated machine code
  - bytes_memlock : tells us this program reserves ... bytes of memory that won't be paged out
  - map_ids : the map id associated with the program. There might be the case that in some program there is no map usage but these map_ids might contain some data which indicates information related to global variables
  - btf_id : indicates that there is a block of BTF information for this program

  ## Attaching the loaded program to an event
  - In the loaded program there is a field called "type" which indicates the information about the event it must link to. 
  - The program type has to match the type of event it is being attached to.
  