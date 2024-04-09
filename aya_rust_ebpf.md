# What is Aya?
- A library that supports writing the whole eBPF project (eBPF program and the user space for loading/connecting/unloading) completely in ```Rust```.
- It is built with a focus on operability and developer experience. 
- It only relies on ```libc``` crate to execute syscalls. It requires no dependencies to ```libbpf```
  (a library in c to provide functionality of loading, unloading etc. eBPF program to the kernel) or ```clang```.
- Aims in providing easy development of eBPF programs.
- Rust compiler produces BPF bytecode.

# Comparison as compared to current eBPF development scenario in C
- Aya as written in Rust provides stronger type safety as compared to C
    + Example:
      ```
      #include <linux/bpf.h>
      #include <bpf/bpf_helpers.h>
      SEC("xdp")
      int incorrect_xdp(struct __sk_buff *skb) {
        return XDP_PASS;
      }
      ```

      This program compiles fine with the clang compiler with target as BPF. Why? Because there is no type error with respect to the type checking rules of a clang compiler.
      But the verifier will not pass this program as the context (passed as argument) is not the correct context with respect to this program. Why? Because the program has to deal with
      network packets, hence the context xdp_md should be used instead of sk_buff.

      The Aya framework catches this error using the type system of Rust. (**Type safety of Rust does the job of verifier here**)

# The XDP program in Rust:
  ## Example 1:
      In C:
      ```
      #include <linux/bpf.h>
      #include <bpf/bpf_helpers.h>
      
      SEC("xdp")
      int xdp_hello(void *ctx) {
          bpf_printk("recieved a packet");
          return XDP_PASS;
      }
      
      char LICENSE[] SEC("license") = "Dual BSD/GPL";
      ```
      In Rust:
      ```
      #![no_std] // 
      #![no_main] // 
      
      use aya_ebpf::{bindings::xdp_action, macros::xdp, programs::XdpContext};
      use aya_log_ebpf::info;
      
      #[xdp] // (* Section Attributes *)
      pub fn xdp_hello(ctx: XdpContext) -> u32 {
          // (* Our main entry point defers to another function and performs error handling,
                returning XDP_ABORTED, which will drop the packet. *)
          match unsafe { try_xdp_hello(ctx) } {
              Ok(ret) => ret,
              Err(_) => xdp_action::XDP_ABORTED,
          }
      }
      
      unsafe fn try_xdp_hello(ctx: XdpContext) -> Result<u32, u32> {
          // (* Write a log entry every time a packet is received. *)
          info!(&ctx, "received a packet");
          // (* This function returns a Result that permits all traffic. *)
          Ok(xdp_action::XDP_PASS)
      }
      
      #[panic_handler] // (* The #[panic_handler] is required to keep the compiler happy, although it is never used since we cannot panic.*)
      fn panic(_info: &core::panic::PanicInfo) -> ! {
          unsafe { core::hint::unreachable_unchecked() }
      }
      ```
  
  ## Example 2: The example pass all IPv4 packets
  In C: Only passes the IPV4 packets and drops rest (Similar kind of program as in Rust but not exactly same)
  ```
  #include <linux/bpf.h>
  #include <bpf/bpf_helpers.h>
  #include <linux/if_ether.h>
  #include <arpa/inet.h>
  
  
  SEC("xdp_drop")
  int xdp_drop_prog(struct xdp_md *ctx)
  {
      void *data_end = (void *)(long)ctx->data_end;
      void *data = (void *)(long)ctx->data;
      struct ethhdr *eth = data;
      __u16 h_proto;
  
      if (data + sizeof(struct ethhdr) > data_end)
          return XDP_DROP;
  
      h_proto = eth->h_proto;
  
      if (h_proto == htons(ETH_P_IPV4))
          return XDP_PASS;
  
      return XDP_DROP;
  }
  
  char _license[] SEC("license") = "GPL";
  ```
  In Rust: 
  Log the source IP address of incoming packets. So we'll need to:
  
  (1) Read the Ethernet header to determine if we're dealing with an IPv4 packet, else terminate parsing.
  
  (2) Read the source IP Address from the IPv4 header.
  ```
  #![no_std]
  #![no_main]
  
  use aya_ebpf::{bindings::xdp_action, macros::xdp, programs::XdpContext};
  use aya_log_ebpf::info;
  
  use core::mem;
  use network_types::{
      eth::{EthHdr, EtherType},
      ip::{IpProto, Ipv4Hdr},
      tcp::TcpHdr,
      udp::UdpHdr,
  };
  
  #[panic_handler]
  fn panic(_info: &core::panic::PanicInfo) -> ! {
      unsafe { core::hint::unreachable_unchecked() }
  }
  
  #[xdp]
  pub fn xdp_firewall(ctx: XdpContext) -> u32 {
      match try_xdp_firewall(ctx) {
          Ok(ret) => ret,
          Err(_) => xdp_action::XDP_ABORTED,
      }
  }
  
  #[inline(always)] // (* Here ptr_at is defined to ensure that packet access is always bound checked. *)
  fn ptr_at<T>(ctx: &XdpContext, offset: usize) -> Result<*const T, ()> {
      let start = ctx.data();
      let end = ctx.data_end();
      let len = mem::size_of::<T>();
  
      if start + offset + len > end {
          return Err(());
      }
  
      Ok((start + offset) as *const T)
  }
  
  fn try_xdp_firewall(ctx: XdpContext) -> Result<u32, ()> {
      let ethhdr: *const EthHdr = ptr_at(&ctx, 0)?; // (* Use ptr_at to read our ethernet header. *)
      match unsafe { (*ethhdr).ether_type } {
          EtherType::Ipv4 => {}
          _ => return Ok(xdp_action::XDP_PASS),
      }
  
      let ipv4hdr: *const Ipv4Hdr = ptr_at(&ctx, EthHdr::LEN)?;
      let source_addr = u32::from_be(unsafe { (*ipv4hdr).src_addr });
  
      let source_port = match unsafe { (*ipv4hdr).proto } {
          IpProto::Tcp => {
              let tcphdr: *const TcpHdr =
                  ptr_at(&ctx, EthHdr::LEN + Ipv4Hdr::LEN)?;
              u16::from_be(unsafe { (*tcphdr).source })
          }
          IpProto::Udp => {
              let udphdr: *const UdpHdr =
                  ptr_at(&ctx, EthHdr::LEN + Ipv4Hdr::LEN)?;
              u16::from_be(unsafe { (*udphdr).source })
          }
          _ => return Err(()),
      };
  
      // (* Here we log IP and port.*)
      info!(&ctx, "SRC IP: {:i}, SRC PORT: {}", source_addr, source_port);
  
      Ok(xdp_action::XDP_PASS)
  }

  ```
## Example 3: 
   Program drops a list of IP addresses. 
   To lookup for IP addresses more efficiently, the Rust program uses HashMap. 
   
   (1) Program creates a HashMap that stores the IP addresses that will act as a blocklist.
   
   (2) Check the IP address from the packer against the HashMap to make a decision of passing or dropping
   
   (3) Add entries to blocklist from userspace.
   ```
    #![no_std]
    #![no_main]
    #![allow(nonstandard_style, dead_code)]
    
    use aya_ebpf::{
        bindings::xdp_action,
        macros::{map, xdp},
        maps::HashMap,
        programs::XdpContext,
    };
    use aya_log_ebpf::info;
    
    use core::mem;
    use network_types::{
        eth::{EthHdr, EtherType},
        ip::Ipv4Hdr,
    };
    
    #[panic_handler]
    fn panic(_info: &core::panic::PanicInfo) -> ! {
        unsafe { core::hint::unreachable_unchecked() }
    }
    
    #[map] // 
    static BLOCKLIST: HashMap<u32, u32> =
        HashMap::<u32, u32>::with_max_entries(1024, 0);
    
    #[xdp]
    pub fn xdp_firewall(ctx: XdpContext) -> u32 {
        match try_xdp_firewall(ctx) {
            Ok(ret) => ret,
            Err(_) => xdp_action::XDP_ABORTED,
        }
    }
    
    #[inline(always)]
    unsafe fn ptr_at<T>(ctx: &XdpContext, offset: usize) -> Result<*const T, ()> {
        let start = ctx.data();
        let end = ctx.data_end();
        let len = mem::size_of::<T>();
    
        if start + offset + len > end {
            return Err(());
        }
    
        let ptr = (start + offset) as *const T;
        Ok(&*ptr)
    }
    
    // 
    fn block_ip(address: u32) -> bool {
        unsafe { BLOCKLIST.get(&address).is_some() }
    }
    
    fn try_xdp_firewall(ctx: XdpContext) -> Result<u32, ()> {
        let ethhdr: *const EthHdr = unsafe { ptr_at(&ctx, 0)? };
        match unsafe { (*ethhdr).ether_type } {
            EtherType::Ipv4 => {}
            _ => return Ok(xdp_action::XDP_PASS),
        }
    
        let ipv4hdr: *const Ipv4Hdr = unsafe { ptr_at(&ctx, EthHdr::LEN)? };
        let source = u32::from_be(unsafe { (*ipv4hdr).src_addr });
    
        // 
        let action = if block_ip(source) {
            xdp_action::XDP_DROP
        } else {
            xdp_action::XDP_PASS
        };
        info!(&ctx, "SRC: {:i}, ACTION: {}", source, action);
    
        Ok(action)
    }
  ```
    

# Points to note:
- List of existing tools for eBPF development:
    + **libbpf**: Both eBPF program and user-space for loading/unloading/hooking are written in ```C```
    + **bcc**: eBPF program is written in ```C``` and the loader/hooker/unloader is written in  ```Python```
    + **libbpf-rs**: eBPF program is written in ```C``` and the loader/hooker/unloader is written in ```Rust```
    + **libbpf-go**: eBPF program is written in ```C``` and the loader/hooker/unloader is written in ```Go```
    + **Aya**: Both eBPF program and user-space for loading/unloading/hooking are written in ```Rust```
- Aya compilation chain: Rust -> LLVM-IR -> BPF Bytecode
- **Benefits/Limitations of writing eBPF features completely in Rust**
  * Memory Safety? ***Still relies on the eBPF verifier***
    + Rust memory model does not matter much for eBPF part because most of the time eBPF programs deal with kernel memory and userspace pointers which are treated as unsafe.
    + Memory safety of Aya relies on eBPF verifier.
    + A lot of the code that they write is categorized as ```unsafe```, as it requires reading directly from kernel memory.
  * Type Safety? ***Good(Better than C compiler)***
    + Aya provides more guarantees about type safety as compared to Clang compiler as it checks more properties (some of them are currently checked by the current eBPF verifier).
    + C is not as strongly typed as Rust.
  * Error handling in C is not very expressive. It usually assumes 0 means success. Whereas in Rust there is a result type (Ok or Error).
  * Aya uses some tricks to avoid using helper functions. For example, using Aya-log, they send debugging message to user-space through perf-buffer and hence no need to use bpf_printk.
  * Aya reimplement helper functions, such as uses Rust HashMap instead of calling BPF_map syscalls.
 
# Comparison with Koka work:
- Our goal is to get rid of the eBPF verifier completely so that we rely on koka++ type system and various program analysis that we perform. But in case of Aya, they still relies on verifier for memory 
  management.
- With respect to helper functions, Aya does a better job by reimplementing most of the functionalities of the helper function. We need to look more into it on how to guarantee more properties about helper 
  function in Koka.
- Error handling, we can also perform in similar manner in Koka as done in Rust-Aya.
- ... (More to be decided)
- Our overall goal is different than Aya project: We aim not only providing easy development of eBPF projects using Koka but also aim on completely not relying on eBPF verifier. 
