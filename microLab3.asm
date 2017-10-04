.model small
.data
.stack 64
num1 db 0
num2 db 0
sumar db 0
restar db 0
multiplicacion db 0
division db 0
residuo db 0


msg3 db 10,13, 'n1 menor a n2 $'
msg4 db 10,13, 'n1 mayor a n2 $'
msg5 db 10,13, 'son iguales $'
msg6 db 10,13, 'Cociente= $'
msg7 db 10,13, 'sobrante= $'


.code 

	mov ax, @data
	mov ds, ax

	mov ah, 01h
	int 21h
	sub al, 30h
	mov num1, al
	
	mov ah, 01h
	int 21h
	sub al, 30h
	mov num2, al
	
	mov al, num1
	add al, num2 
	mov sumar, al

	mov al, num1
	sub al, num2
	mov restar, al

	mov al, num1
	mul num2
	mov multiplicacion, al

	mov al, num1
	div num2
	mov division, al
	mov residuo, ah
	
	mov al, num1
	cmp al, num2
	je l20
	jg l21
	jl l22
	
	l22:
	
	mov ah, 09
	lea dx, msg3
	int 21h
	jmp l23
	
	l21:
	
	mov ah, 09
	lea dx, msg4
	int 21h
	jmp l23
	
	l20:
	
	mov ah, 09
	lea dx, msg5
	int 21h
	jmp l23
	
	l23:
	
	mov ah, 09
	lea dx, msg6
	int 21h
	mov dl, division
	add dl, 30h
	mov ah, 02
	int 21h
	
	mov ah, 09
	lea dx, msg7
	int 21h
	mov dl, residuo
	add dl, 30h
	mov ah, 02
	int 21h
	
	mov ah, 4ch
	int 21h
.stack	
 End