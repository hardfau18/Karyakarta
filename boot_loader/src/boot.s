.arm

// entry function of the code
.global entry
entry:
    // setup stack with stack address later given in linker.ld script
    ldr sp, =stack_top
    // no need of BL since it will never return
    B loop
// loop infinitely
loop:
    B loop

.org 0x1FE
// bootsector flag
.word 0xaa55

