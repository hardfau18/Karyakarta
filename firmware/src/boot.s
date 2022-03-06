.arm

// entry function of the code
.global IVT
IVT:
Reset:
    ldr r1, =start_addr
    ldr r1, [r1]
    Bx r1

start_addr: .word 0x40100000
