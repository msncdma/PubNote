

###Kernel Page Table Isolation （ KPTI ）的修正完全隔离了内核内存和用户进程
```
CPU 在用户态的时候，只能够访问内存映射表的映射出的虚拟地址，然后再被映射到实际物理地址。这个内存映射表是由 CPU 直接访问的、操作系统在核心态管理的，利用 CPU 本身的硬件特性就实现了应用程序的可访问内存区域隔离。

而这个 bug 就是这个机制有漏洞，可以有办法绕过，更新微代码不能解决，就只能操作系统内核通过软件实现了，操作系统内核要自己再维护一层内存映射表作为中间层、通过软件来控制权限。
```

操作系统就是使用的 cpu 提供的功能来隔离不同程序及内核的，现在这个隔离出了问题，意味着不同程序可以访问内核数据
浮点运算 bug，关键字：Pentium FDIV bug
intel 那个 AMT 啥的？
 linux内核开发，linux用户权限，
 CPU 边信道攻击
 ```
 Kernel page-table isolation
 From Wikipedia, the free encyclopedia

 Kernel page-table isolation (KPTI, previously called KAISER) is a hardening technique in the Linux kernel to improve security by better isolating user space and kernel space memory.[1][2] KPTI was merged into Linux kernel version 4.15,[3][4] to be released in early 2018, and backported into Linux Kernel 4.14.10. Windows implemented an identical feature in version 17035 (RS4)[5].

 内核分页表隔离(KPTI，以前叫做 KAISER)是 Linux 内核中的一项加固技术，将用户空间(User Space)和内核空间(Kernel Space)的内存进行更好的隔离以增强安全。

 Background[edit]
 Prior to KPTI, whenever executing user space code (applications), Linux would also keep its entire kernel memory mapped in page tables, although protected from access. The advantage is that when the application makes a system call into the kernel or an interrupt is received, kernel page tables are always present, so most context switching-related overheads (TLB flush, page table swapping, etc) can be avoided.[1]

 In 2005, the Linux kernel adopted address space layout randomization (KASLR), which makes it more difficult to exploit kernel vulnerabilities,[6][7] which relies on kernel addresses remaining hidden from user space. Despite prohibiting access to these kernel mappings, it turns out there are several side-channel attacks in current Intel x86 processors (as of December 2017) that can leak the location of this memory, making it possible to work around KASLR.[2][8][9][10] AMD processors are not affected by these attacks and don't need KPTI to mitigate them.[11]

 背景
 在 KPTI 引入之前，每次执行用户空间代码（应用）时，Linux 虽然（对内核存储区域（ Kernel Memory ））进行了访问保护，但还是会继续将整个内核存储区域（ Kernel Memory ）映射在分页表（ page table ）中。这样做的好处是，应用程序（ Application ）在请求内核系统调用（ make a system call ）或者触发一个中断（ interrupt ）时，内核的分页表一直处于可用状态，这样绝大多数上下文切换相关的开销（ TLB Flush，page table swapping，等）可以避免。

 在 2005 年，Linux 内核引入了地址空间随机排布技术（ KASLR ），让内核地址对用户空间不可见，从而增加了发现内核漏洞的难度。虽然（已经）禁止了对这些内核映射的访问，但最后发现在现有的 Intel X86 处理器（到 2017 年 12 月为止）上可能会泄漏这些内存的位置，有一些旁路攻击（ side-channel attacks ）可以绕过 KASLR （这里是指通过 Kernel Page Table 里面的映射关系，能获取到 Kernel 内存区域的地址）。AMD 的处理器则不会受到这些攻击的影响因此无需使用 KPTI 进行改善。

 Implementation[edit]
 KPTI fixes these leaks by separating user space and kernel space page tables entirely. On recent x86 processors, a TLB flush can be avoided using the process context identifiers (PCID) feature, but even then it comes at a significant performance cost particularly in syscall-heavy and interrupt-heavy workloads. The overhead[clarification needed] was measured to be 0.28% according to KAISER's original authors,[2] but roughly 5% for most workloads by a Linux developer.[1]

 KPTI can be disabled with the "nopti" kernel boot option. Also provisions were created to disable KPTI if newer processors fix the information leaks.[3]

 实现
 KPTI 通过对用户空间和内核空间的分页表进行完全隔离来修复这项漏洞。在最新的 X86 处理器中，使用 PCID （进程上下文标识符）来避免产生 TLB flush，即使这样，仍然会带来显著降低性能，特别是频繁使用系统调用和频繁使用中断的应用程序。由此带来的开销根据 KAISER 的原作者测量约 0.28%；一位 Linux 开发人员的测量结果是大多数工况下有 5%。

 KPTI 可以通过 nopti 内核启动选项进行关闭。此外也做了未来如果新的处理器修复了此项漏洞，对 KPTI 进行关闭的准备。

 --------------------------------------------------------

 个人理解，问题可能是出在 Intel 处理器的 MMU 上，page table 的映射以及 address translation 是通过硬件实现的，可能是这一块出了问题，不得不用软件进行一些预处理。
 ```


 
