	org 100h

	section .text

	XOR AX, AX
	XOR BX, BX
	jmp proc

	proc:
	ADD AX, 0D ;sumas
	ADD AX, 0D
	ADD AX, 0D
	ADD AX, 6D
	ADD AX, 0D
	ADD AX, 6D
	ADD Ax, 1D
	ADD Ax, 8D
	MOV BX, 8D
    DIV BX ;Division
	MOV byte[20AH], AL
	exit:
        
	int 20H