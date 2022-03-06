core::arch::global_asm!(include_str!("_arch/qemu.s"));

#[inline(always)]
pub fn wait_forever() -> ! {
    loop {
        cortex_a::asm::wfe();
    }
}
