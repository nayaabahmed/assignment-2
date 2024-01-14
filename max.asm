jmp start
array: db 1,5,9,11,15
max: dw 0
maximum:
mov bx,ax
add ax,1
cmp bx,ax
jle next
mov [max],bx
next:
dec cx
loop maximum
mov ax,[max]
ret 
start:
mov ax,array
push ax
mov cx,5
push cx
call maximum
mov ax,15
mov ax,4ch
int 21h