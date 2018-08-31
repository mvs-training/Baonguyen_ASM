.model small
.stack 100
.data
    tb1 db 'nhap vao 1 so nhi phan thu 1 :$'
    tb2 db 10,13,'nhap vao 1 so nhi phan thu 2 :$'    
    tb db 10,13,'hien thi ket qua  : $'
    tb3 db 10,13,'nhap sai so thap phan moi nhap lai $'    
    so1 dw 0
    so2 dw 0
.code
main Proc
    mov ax,@data
    mov ds,ax
lap:
    mov ah,9
    lea dx,tb1
    int 21h
    xor bx,bx
    ; nhap so nhi phan 
    mov ah,1
tiep1:
    int 21h
    cmp al, 13  ; so sanh voi enter
    je nhapso2 
    cmp al,49
    jg ra
    cmp al,47
    jl ra
    sub al,30h
    shl bx,1 ; dich sang ben trai 
    or bl,al
    mov so1,bx
    jmp tiep1
    
    
    ; nhap vao so nhi phan thu hai
nhapso2:
    mov ah,9
    lea dx,tb2
    int 21h
    xor bx,bx
    mov ah , 1
tiep2: 
    int 21h
    cmp al, 13  ; so sanh voi enter
    je ngung   
    cmp al,49
    jg ra
    cmp al,47
    jl ra
    sub al,30h
    shl bx,1 ; dich sang ben trai 
    or bl,al 
    mov so2,bx
    jmp tiep2
ra:
    mov ah,09
    lea dx,tb3
    int 21h
    jmp lap
ngung:
    mov cx,16  
    mov ah,09
    lea dx,tb
    int 21h
    
    mov ax,so1
    mov bx,so2
    add bx,ax
    mov ah,2 
    
hien: 
    xor dl,dl
    rol bx,1  ; xoay vong  de hien gia tri thu 1 ra man hinh dau tien
    adc dl,30h
    int 21h 
    loop hien
    mov ah,4ch
    int 21h
main endp
    end main
    
    