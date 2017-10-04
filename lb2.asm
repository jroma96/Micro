.model small
.data
.stack 64
num1 db 2
num2 db 2
division db 0
residuo db 0


msg5 db 10,13, 'Residuo= $'
msg6 db 10,13, 'Cociente= $'


.code 

	mov ax, @data
	mov ds, ax

	mov al, num1
	div num2
	mov division, al
	mov residuo, ah

	mov ah, 09
	lea dx, msg6
	int 21h
	mov dl, division
	add dl, 30h
	mov ah, 02
	int 21h
	
	mov ah, 09
	lea dx, msg5
	int 21h
	mov dl, residuo
	add dl, 30h
	mov ah, 02
	int 21h
	
	mov ah, 4ch
	int 21h
.stack	
 End