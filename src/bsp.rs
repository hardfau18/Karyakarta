use core::panic::PanicInfo;

pub const UART1:*mut u8 = 0x09000000 as *mut u8;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    crate::cpu::wait_forever();
}

#[no_mangle]
fn _start_rust() {
    crate::kern_init();
}
