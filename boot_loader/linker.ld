ENTRY(entry)

SECTIONS{
    . = 0x40010000;    /* qemu loads kernel at 0x40010000, TODO: add your own firmware and load the bootloader*/
    .text   : {*(.text)}
    .data   : {*(.data)}
    .bss    : {*(.bss)}
    . = ALIGN(8);
    stack_top = . + 0x10000; /*4KB is enough for stack*/
}
