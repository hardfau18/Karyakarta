ENTRY(_start)

PHDRS
{
    segment_code PT_LOAD FLAGS(5);
}

SECTIONS{
    . = 0x40100000;
    .text : {
        KEEP(*(.text._start))
        } :segment_code
    .rodata : {
        *(.rodata*)
        }
    .bss(NOLOAD) : ALIGN(16){
        bss_section_start = .;
        *(.bss*)
        ALIGN(16);
        bss_section_end = .;
        }
    .data : {
        *(.data*)
        }
    stack_top  = 0x40000000+100M - 4;
}
