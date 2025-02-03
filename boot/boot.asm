
%define boot_loc    (0x7c00)    ; location that BOOT0 is loaded to by BIOS
%define boot_sign   (0xaa55)    ; signature needed at the end of 512 bytes

    [bits 16]
    [org boot_loc]

start:
    cli ; disable interrupts

    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax

    mov sp, boot_loc

    sti ; enable interrupts

spin:
    jmp spin

times 510 - ($ - $$) db 0   ; pad the remainder of the boot sector
dw boot_sign                ; boot sector signature
