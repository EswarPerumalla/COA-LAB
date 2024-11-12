ORG 100h
NUM1 DW 1234h
NUM2 DW 5678h
START:
MOV AX, NUM1
sub AX, NUM2
MOV BX, AX
MOV AH, BH
SHR AH, 4
ADD AH, 30h
CMP AH, 39h
JLE PRINT_HIGH_NIBBLE
ADD AH, 7
PRINT_HIGH_NIBBLE:
MOV DL, AH
MOV AH, 02h
INT 21h
MOV AH, BH

AND AH, 0Fh
ADD AH, 30h
CMP AH, 39h
JLE PRINT_LOW_NIBBLE
ADD AH, 7
PRINT_LOW_NIBBLE:
MOV DL, AH
MOV AH, 02h
INT 21h
MOV AH, BL
SHR AH, 4
ADD AH, 30h
CMP AH, 39h
JLE PRINT_HIGH_NIBBLE2
ADD AH, 7
PRINT_HIGH_NIBBLE2:
MOV DL, AH
MOV AH, 02h
INT 21h
MOV AH, BL
AND AH, 0Fh
ADD AH, 30h
CMP AH, 39h
JLE PRINT_LOW_NIBBLE2
ADD AH, 7
PRINT_LOW_NIBBLE2:
MOV DL, AH
MOV AH, 02h
INT 21h
MOV AH, 4Ch
INT 21h

print_high:
    mov     dl, ah      ; Move the high nibble ASCII character to DL
    mov     ah, 02h     ; DOS function to display a character
    int     21h         ; Call DOS interrupt to print the character
    
    ; Convert the low nibble of the result to ASCII
    mov     ah, bl      ; Copy the result back from BL to AH
    and     ah, 0Fh     ; Mask out the high nibble, keep only the low nibble
    add     ah, 30h     ; Convert to ASCII (0-9)
    cmp     ah, 39h     ; Compare with '9'
    jle     print_low   ; If <= '9', jump to print_low
    add     ah, 7       ; If > '9', convert to ASCII A-F by adding 7

print_low:
    mov     dl, ah      ; Move the low nibble ASCII character to DL
    mov     ah, 02h     ; DOS function to display a character
    int     21h         ; Call DOS interrupt to print the character
    
    ; Wait for a key press
    mov     ah, 0       ; Function 0 of INT 16h waits for a keypress
    int     16h         ; Wait for a keypress
    
    ; Exit the program
    mov     ax, 4C00h   ; DOS function to terminate the program
    int     21h         ; Call DOS interrupt to terminate the program