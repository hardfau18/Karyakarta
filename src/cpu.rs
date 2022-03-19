core::arch::global_asm!(include_str!("_arch/qemu.s"));

#[inline(always)]
pub fn wait_forever() -> ! {
    loop {
        // SAFETY: just infinite loop
        unsafe {
            core::arch::asm!("WFE", options(nomem, nostack));
        }
    }
}
