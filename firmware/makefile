BUILD_DIR	=${CURDIR}/build/
BIN_DIR		?=${BUILD_DIR}
BIN_FLAGS	=-O binary
LD_FLAGS	=-T linker.ld  --fatal-warnings
AS_FLAGS	=--fatal-warnings


.PHONY: clean bin run

bin: ${BIN_DIR}/boot.bin
	@echo ============all done==================


clean:
	rm -rf ${BUILD_DIR}

${BIN_DIR}/boot.bin: ${BUILD_DIR}/boot.elf | ${BIN_DIR}/
	@arm-none-eabi-objcopy ${BIN_FLAGS} $< $@

${BUILD_DIR}/boot.elf: ${BUILD_DIR}/boot.o | ${BUILD_DIR}
	@arm-none-eabi-ld ${LD_FLAGS} -o $@ $<

${BUILD_DIR}/boot.o: src/boot.s | ${BUILD_DIR}
	@arm-none-eabi-as ${AS_FLAGS} $< -o $@

%/:
	@mkdir -p $@
