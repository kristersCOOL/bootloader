; This is a full bootloader in Assembly x86.
; It loads the operating system from the disk and executes it.

; Bootloader Entry Point
start:
    ; Set up the segment registers
    xor ax, ax
    mov ds, ax
    mov es, ax

    ; Load the operating system from the disk
    mov ah, 0x02 ; BIOS function to read disk sectors
    mov al, 1    ; Number of sectors to read
    mov ch, 0    ; Cylinder number
    mov cl, 2    ; Sector number
    mov dh, 0    ; Head number
    mov dl, 0    ; Drive number
    mov bx, 0x7E00 ; Destination address to load the operating system
    int 0x13     ; BIOS interrupt to read disk sectors

    ; Jump to the loaded operating system
    jmp 0x7E00:0

; Padding and Disk Signature
times 510-($-$$) db 0
dw 0xAA55 ; Boot signature
