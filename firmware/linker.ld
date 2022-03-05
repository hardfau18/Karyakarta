ENTRY(entry)

SECTIONS{
    . = 0x0000;    /* qemu loads kernel at 0x40010000, TODO: add your own firmware and load the bootloader*/
    .text   : {*(.text)}
    .data   : {*(.data)}
    .bss    : {*(.bss)}
}
