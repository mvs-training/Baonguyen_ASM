.model small
.stack 100h
.data
.code
    main proc 
    mov ax,@data
    mov ds,ax 
    
    ;in dau nhac
        mov ah,2
        mov dl,'?'
        int 21h
     ; xoa bien dem cx
        xor cx,cx
        ;doc 1 ky tu
        mov ah,1
        int 21h
        
        ;trong khi character khong phai la cr
        while:
            cmp al,0dh
            je end_while
            ;cat al vao stack tang bien dem
            push ax; day ax vao stack
            inc
             cx ;tang cx
            ;doc 1 ky tu
            int 21h
            jmp while
            end_while:
                ;xuong dong moi
                mov ah,2
                mov dl,0dh
                int 21h
                mov dl,0ah
                int 21h
                jcxz exit ;thoat neu cx=0
                ;lap cx lan
                top:
                ;lay ky tu tu stack
                pop dx
                ;xuat no
                int 21h
                loop top;lap neu cx>0
                ;end for
                exit:
                mov ah,4ch
                int 21h
                main endp
    end main
    
    mov ah,4ch
    int 21h
    main endp
    end main
    
    