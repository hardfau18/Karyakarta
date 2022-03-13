#![no_std]
#![no_main]

mod bsp;
mod cpu;
mod tty;
use core::fmt::Write;

fn kern_init() {
    writeln!(tty::TTY.lock(), "formatted num {}", 23).unwrap();
    tty::TTY.lock().write("blah blah\n".as_bytes());
    println!("blahline");
    panic!("This will be the end");
}
