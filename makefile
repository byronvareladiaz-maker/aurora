# ==========================================
# Toolchain Configurations
# ==========================================
ASM      = nasm
EMU      = qemu-system-x86_64

# File names
SRC      = boot.asm
TARGET   = boot.bin

# ==========================================
# Build Rules
# ==========================================

# Default target (running 'make' will compile the binary)
all: $(TARGET)

# Compile the assembly source code into a raw 512-byte binary
$(TARGET): $(SRC)
	$(ASM) -f bin $(SRC) -o $(TARGET)

# Compile and automatically boot the OS inside QEMU
run: $(TARGET)
	$(EMU) -drive format=raw,file=$(TARGET)

# Clean up the built binaries from your directory
clean:
	rm -f $(TARGET)

# Marks targets that aren't actual files
.PHONY: all run clean
