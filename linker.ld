
ENTRY(_start)

PHDRS
{
    segment_code PT_LOAD FLAGS(5);
}

SECTIONS{
    . = 0x40010000;
    .text : {
        KEEP(*(.text._start))
        } :segment_code
}
