#### Compiling
make options
1. `make run` : This will build and run the disk image inside qemu
2. `make bin` : This will generate disk image.

#### Run options:
- `GDB=1` will start qemu and listens for gdb connection on `127.0.0.1:1234` and stops at first instruction.
    `arm-none-eabi-gdb build/boot.elf` will connect to that server and stop at entry fucntion.

    NOTE: To automatically connect and stop at entry you need to allow `.gdbinit` script to run. 
    you can do this by `echo "add-auto-load-safe-path $PWD/.gdbinit" >> ~/.gdbinit`
- `DEBUG=1` will log every instruction to `build/log` file.

example: `make run DEBUG=1`


