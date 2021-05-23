;Main
	org 100h

	section .text
        
    mov BP, num ; BP = puntero a num
	mov CL, eld

	call func

	int 20h


	section .data
	num db 01,04,07,09,12,13,16,17,20,24 ; arreglo 10 numeros
	eld equ 2d 

func:
	XOR SI, SI ; SI=0
	XOR DI, DI ; DI=0

for:
    xor AX, AX
    mov AL, [BP+SI] 
	inc SI
    mov CH, AL 
	div CL  
    cmp AH, 0
	JE par
	JA impar
	
par:
mov DI, BX
	mov byte[300h+DI], CH
	INC DI
	mov BX, DI
	cmp SI, 10
	JE end
	jmp for

impar:
MOV DI, DX
	mov byte[320h+DI], CH
	INC DI
	MOV DX, DI
	cmp SI, 10
	JE end
	jmp for

end:
	ret