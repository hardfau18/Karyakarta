use core::panic::PanicInfo;
use crate::println;

pub const UART1:*mut u8 = 0x09000000 as *mut u8;

#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
    println!("{}", info);
    crate::cpu::wait_forever();
}

#[no_mangle]
fn _start_rust() {
    crate::kern_init();
}
