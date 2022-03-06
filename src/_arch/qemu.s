.syntax unified
.section .text._start

.global _start

_start:
	
    ldr r1, =console
    ldr r1, [r1]        // get the uart value
    ldr r2, =msg
print_msg:
    ldrB r3, [r2], #1       // get character in r2 and increment r2
    strB r3, [r1]
    cmp r3, #0              // if the character is 0 (null) then loop infinitely
    BNE print_msg
    ldr r1, =bss_section_start
    ldr r2, =bss_section_end
reset_bss:
    cmp r1, r2
    Beq setup_stack
    str r3, [r1], #4        //store 0 in bss section and increment r1 by 4. It is ok since bss section is 16 byte aligned
setup_stack:
    ldr r1, =stack_top
    mov sp, r1
    b _start_rust

loop:
	wfe
	b loop

msg: .string "Os is started. hold tight!!!"
console:.word 0x09000000
