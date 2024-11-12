org 100h
mov ax, 1234h
mov bx, 5678h
mul bx
mov bx, ax
mov cx, 0000h
mov cx, dx
mov ah, dh
shr ah, 4
add ah, 30h
cmp ah, 39h
jle print_high_nibble_dx
add ah, 7
print_high_nibble_dx:
mov dl, ah
mov ah, 02h
int 21h
mov ah, dh
and ah, 0fh
add ah, 30h
cmp ah, 39h
jle print_low_nibble_dx
add ah, 7
print_low_nibble_dx:
mov dl, ah
mov ah, 02h
int 21h
mov ah, cl
shr ah, 4
add ah, 30h
cmp ah, 39h
jle print_high_nibble_dl
add ah, 7
print_high_nibble_dl:
mov dl, ah
mov ah, 02h
int 21h
mov ah, cl
and ah, 0fh
add ah, 30h
cmp ah, 39h
jle print_low_nibble_dl
add ah, 7
print_low_nibble_dl:
mov dl, ah
mov ah, 02h
int 21h
mov ah, bh
shr ah, 4
add ah, 30h
cmp ah, 39h
jle print_high_nibble_bx
add ah, 7
print_high_nibble_bx:
mov dl, ah
mov ah, 02h
int 21h
mov ah, bh
and ah, 0fh
add ah, 30h
cmp ah, 39h
jle print_low_nibble_bx
add ah, 7
print_low_nibble_bx:
mov dl, ah
mov ah, 02h
int 21h
mov ah, bl
shr ah, 4
add ah, 30h
cmp ah, 39h
jle print_high_nibble_bl
add ah, 7
print_high_nibble_bl:
mov dl, ah
mov ah, 02h
int 21h
mov ah, bl
and ah, 0fh
add ah, 30h
cmp ah, 39h
jle print_low_nibble_bl
add ah, 7
print_low_nibble_bl:
mov dl, ah
mov ah, 02h
int 21h
mov ah, 4Ch
int 21h