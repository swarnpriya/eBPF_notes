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
  In C:
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
  In Rust: log the source IP address of incoming packets. So we'll need to:
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
    

# Points to note:
- It provides more guarantees about type safety as compared to Clang compiler as it checks more properties that the current eBPF verifier checks.
- A lot of the code that they write is categorized as ```unsafe```, as it requires reading directly from kernel memory.
