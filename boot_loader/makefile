BUILD_DIR=${PWD}/build/
QEMU_ARGS=--nographic --serial mon:stdio -machine virt -cpu cortex-a7

# enable assembly debugging if DEBUG flag is set
ifdef DEBUG
	QEMU_ARGS += -d in_asm -D ${BUILD_DIR}/log
endif

# listens on port 1234 for gdb connections
ifdef GDB
	QEMU_ARGS += -S -s
endif

.PHONY: clean bin run

bin: ${BUILD_DIR}/boot.bin
	@echo ============all done==================

run: ${BUILD_DIR}/boot.bin
	qemu-system-arm -kernel $< ${QEMU_ARGS}

clean:
	@rm -rf ${BUILD_DIR}

bin: ${BUILD_DIR}/boot.bin

${BUILD_DIR}/boot.bin: ${BUILD_DIR}/boot.elf | ${BUILD_DIR}
	@arm-none-eabi-objcopy -O binary $< $@
${BUILD_DIR}/boot.elf: ${BUILD_DIR}/boot.o | ${BUILD_DIR}
	@arm-none-eabi-ld -e entry -o $@ $< --fatal-warnings

${BUILD_DIR}/boot.o: src/boot.s | ${BUILD_DIR}
	@arm-none-eabi-as $< -o $@ --fatal-warnings

${BUILD_DIR}:
	@mkdir $@
