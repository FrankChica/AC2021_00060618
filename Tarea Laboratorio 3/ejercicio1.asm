	org 100h

	section .text

	XOR AX, AX
	XOr Bx, BX
	MOV byte[200H], 0d
	MOV byte[201H], 0d
	MOV byte[202H], 0d
	MOV byte[203H], 6d
	MOV byte[204H], 0d
	MOV byte[205H], 6d
	MOV byte[206H], 1d
	MOV byte[207H], 8d
	MOV AL, 0d
	MOV DI, 0d
	MOV BX, 8D
	jmp iterar
	
    iterar:
	CMP DI, 8d
	JE exit
    ADD AL, [200h + DI]
	add DI, 1d

	jmp iterar
    exit:

    DIV BX ;Division
	MOV byte[20AH], AL
        
	int 20H