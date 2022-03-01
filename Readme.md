## Karyakarta

A baremetal operating system written for educational purpose. It is intended for Beaglebone Black.
For running it in qemu it uses `virt` machine and `cortex-A7` cpu.
It is written in Rust.

##### Requirements 
1. `qemu-system-arm` for emulating
2. `arm-none-eabi-binutils` for building boot_loader
3. `rust`

### Running
To run it in qemu go to `bootloader/` and run `make run`. check [this](bootloader/Readme.md) for emulating.

#### Some other Resources
- For beginner to get started writing simple x86 os check [this book](https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf)
- This [site: osdev](https://wiki.osdev.org/) gives all the necessory information for writing an operating system
- If you want to follow some tutorial [This repository](https://github.com/cfenollosa/os-tutorial) describes everything step by step
- For writing simple operating system in rust, Check this [blog post](https://os.phil-opp.com/). It also describes how to write no_std rust
- If you are new to embedded rust you should check this [embedded-rust](https://docs.rust-embedded.org/discovery/) book.
