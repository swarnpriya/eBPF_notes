# Introduction 

- eBPF is a technology used with origins in Linux kernel that can run sandboxed programs in privileged contexts such as operating system kernel.
- It can be used to safely and efficiently extend the kernel's capabilities without requiring to change the kernel source code.
- It allows the sandboxed programs to run within the operating system. The application developers can run eBPF programs to add extra functionality to the operating system at runtime.
  The operating system then provides the security and efficiency as if natively compiled with Just-In-Time compiler and verification engines. 
- eBPF programs can be written by developers that can be dynamically loaded at runtime to change the kernel's functionality.

Here is a pictorial representation describing the difference between the user and the kernel space. 
![user-kernel](https://github.com/swarnpriya/eBPF_notes/blob/main/images/user_kernel_syscall.png)
The Linux kernel is a layer between the software and the hardware. The developers write an application that runs in the user space and is not allowed to access the hardware directly. Instead, the application makes a request using the system call interface to request the kernel to act on its behalf.
