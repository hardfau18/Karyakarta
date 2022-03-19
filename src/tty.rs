use lazy_static::lazy_static;

lazy_static! {
    pub static ref TTY: spin::Mutex<Tty> = spin::Mutex::new(Tty {
        addr: volatile::Volatile::new(unsafe { &mut *crate::bsp::UART1 })
    });
}

#[derive(Debug)]
pub struct Tty {
    /// Serial Port address
    addr: volatile::Volatile<&'static mut u8>,
}

impl Tty {
    pub fn write(&mut self, bytes: &[u8]) {
        for &byte in bytes.iter() {
            self.addr.write(byte);
        }
    }
}

impl core::fmt::Write for Tty {
    fn write_str(&mut self, s: &str) -> core::fmt::Result {
        self.write(s.as_bytes());
        Ok(())
    }
}

#[macro_export]
macro_rules! println {
    () => (TTY.lock().write("\n"));
    ($($arg:tt)*)=>{ crate::print!("{} \n", format_args!($($arg)*))};
}
#[macro_export]
macro_rules! print{
    ($($arg:tt)*) => {
        use core::fmt::Write;
        $crate::tty::TTY.lock().write_fmt(format_args!($($arg)*)).unwrap()
    };
}
