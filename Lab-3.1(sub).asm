org 100h

    num1    db  18h 
    num2    db  13h 

start:
    mov     al, [num1]  
    sub     al, [num2] 
    
    mov     bl, al     
    
    mov     ah, al      
    and     ah, 0F0h    
    shr     ah, 4      
    add     ah, 30h     
    cmp     ah, 39h    
    jle     print_high  
    add     ah, 7       

print_high:
    mov     dl, ah      
    mov     ah, 02h     
    int     21h                                             
    
    mov     ah, bl     
    
    and     ah, 0Fh    
    add     ah, 30h    
    cmp     ah, 39h    
    jle     print_low  
    add     ah, 7      

print_low:
    mov     dl, ah      
    mov     ah, 02h     
    int     21h         
    
    
    mov     ah, 0       
    int     16h       
    mov     ax, 4C00h   
    int     21h         