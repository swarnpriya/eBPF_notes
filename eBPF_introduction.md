# Introduction 

- eBPF is a technology used with origins in Linux kernel that can run sandboxed programs in privileged contexts such as operating system kernel.
- It can be used to safely and efficiently extend the kernel's capabilities without requiring to change the kernel source code.
- It allows the sandboxed programs to run within the operating system. The application developers can run eBPF programs to add extra functionality to the operating system at runtime.
  The operating system then provides the security and efficiency as if natively compiled with Just-In-Time compiler and verification engines. 
- eBPF programs can be written by developers that can be dynamically loaded at runtime to change the kernel's functionality.
- eBPF programs can be considered as a restricted subset of C programs.
- One very simple use case of eBPF is: that a program written in user space using eBPF can help filter the network packet received.
- Use of eBPF as compared to directly modifying the Linux kernel: A kernel developer can for sure make changes in the kernel code to add new functionality or to change the existing functionality. But the issue is not just about coding the changes, it should be accepted by the Linux community as it is a general-purpose operating system used by trillions of people for various purposes.




Here is a pictorial representation describing the difference between the user and the kernel space. 
![user-kernel](https://github.com/swarnpriya/eBPF_notes/blob/main/images/user_kernel_syscall.png)
The Linux kernel is a layer between the software and the hardware. The developers write an application that runs in the user space and is not allowed to access the hardware directly. Instead, the application makes a request using the system call interface to request the kernel to act on its behalf.
