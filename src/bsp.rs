use core::panic::PanicInfo;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    crate::cpu::wait_forever();
}

#[no_mangle]
fn _init_rust() {
    crate::kern_init();
}
