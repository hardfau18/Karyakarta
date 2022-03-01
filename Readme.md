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

