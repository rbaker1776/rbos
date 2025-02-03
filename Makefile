BIN_DIR = bin
KERN_DIR = kern
BOOT_DIR = boot
BOOT_SRC_DIR = boot/src

NASM = nasm
ZIG = zig
QEMU = qemu-system-x86_64

BOOT_ASM = $(BOOT_DIR)/boot.asm
BOOT_BIN = $(BIN_DIR)/boot.bin

NASM_FLAGS = -f bin -o $(BOOT_BIN)

.PHONY: clean build run

# assemble the bootloader from boot.asm
$(BOOT_BIN): $(BOOT_ASM)
	$(NASM) $(NASM_FLAGS) $<

clean:
	rm -rf $(BIN_DIR)/*.bin

build: $(BOOT_BIN)

run:
	$(QEMU) -drive format=raw,file=$(BOOT_BIN)
