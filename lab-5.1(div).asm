org 100h

start:
    
    mov ax, cs
    mov ds, ax

    mov al, [dividend]  
    mov bl, [divisor]   

    xor ah, ah          

    div bl              

    mov [quotient], al  
    mov [remainder], ah 
    mov dx, offset msg_quotient
    mov ah, 09h         
    int 21h             

    mov al, [quotient]
    add al, 30h         
    mov dl, al
    mov ah, 02h         
    int 21h             

    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h

    mov dx, offset msg_remainder
    mov ah, 09h         
    int 21h             

    mov al, [remainder]
    add al, 30h         
    mov dl, al
    mov ah, 02h         
    int 21h             

    mov ah, 4Ch
    int 21h

dividend  db 12         
divisor   db 04          
quotient  db 0          
remainder db 0

msg_quotient db "Quotient: $"
msg_remainder db "Remainder: $"