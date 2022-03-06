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

loop:
	wfe
	b loop

msg: .string "Os is started. hold tight!!!"
console:.word 0x09000000