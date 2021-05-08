	org 100h

	section .text

    XOR BL, BL
	XOR AX, AX
	MOV AX, 1d
	mov BL, 5d
	jmp iterar

	iterar:
	CMP AX, 120d
	JE exit
	MUL BL
	Sub BL, 1d
	jmp iterar
	exit:

    mov word[20BH], AX

	int 20h

