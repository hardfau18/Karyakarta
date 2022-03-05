TARGET 		?=qemu
MODE		?=debug

QEMU_ARGS	=--nographic --serial mon:stdio -machine virt -cpu cortex-a7 -m 100m
BIOS_DIR 	?=firmware
TARGET_DIR	=${CURDIR}/target/${TARGET}/${MODE}
OS_TARGET 	?=${TARGET_DIR}/karyakarta
OS_BIN 		?=${OS_TARGET}.bin
BIOS_BIN 	?=${TARGET_DIR}/boot.bin


ifeq (${MODE}, release)
	CARGO_ARGS += --release
endif

# enable assembly debugging if DEBUG flag is set
ifdef DEBUG
	QEMU_ARGS += -d in_asm -D ${BUILD_DIR}/log
endif

# listens on port 1234 for gdb connections
ifdef GDB
	QEMU_ARGS += -S -s
	AS_FLAGS += -g
endif
############### Rules ##############################

.PHONY: all clean run os bios ${OS_TARGET}

all: os bios

os:${OS_BIN}

bios: ${BIOS_BIN}

clean:
	@cargo clean
	@make -C ${BIOS_DIR} clean --no-print-directory

run: ${OS_BIN} ${BIOS_BIN}
	@echo ===== running qemu image ======
	@qemu-system-arm ${QEMU_ARGS} -kernel ${OS_BIN}
	# @qemu-system-arm -bios ${BIOS_BIN} ${QEMU_ARGS} -kernel ${OS_BIN}

${OS_BIN}: ${OS_TARGET}
	@echo "Generating os ${OS_BIN}"
	@rust-objcopy $< $@ -O binary

${OS_TARGET}:
	@cargo build ${CARGO_ARGS}

${BIOS_BIN}:
	@echo "building bios: ${BIOS_BIN}"
	@make -C ${BIOS_DIR} BIN_DIR=${TARGET_DIR} --no-print-directory bin
