.arm

// entry function of the code
.global entry
entry:
    // setup stack with stack address later given in linker.ld script
    ldr sp, =stack_top
    // no need of BL since it will never return
    ldr r1, =console
    ldr r1, [r1]        // get the uart value
    ldr r2, =msg
print_msg:
    ldrB r3, [r2], #1       // get character in r2 and increment r2
    strB r3, [r1]
    cmp r3, #0              // if the character is 0 (null) then loop infinitely
    BNE print_msg

// loop infinitely
loop:
    B loop

msg: .string "Booting your OS"
console:.word 0x09000000

.org 0x1FE
// bootsector flag
.short 0xaa55
