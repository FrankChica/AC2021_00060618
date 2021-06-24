	org 	100h

	section	.text

	; print msg1
	mov 	DX, msg1
	call EscribirCadena

	; input contraseña
	mov 	BP, contraseña
	call  	LeerCadena

	;print mensaje (bien o incorrecto)
	call comparar
	call EscribirCadena

	call	EsperarTecla

	int 	20h

	section	.data
msg1	db	"Ingresa una contrasenia: ", "$"
msg2    db  "BIENVENIDO$"
msg3    db  "INCORRECTO$"
msg4    db  "cntrs$"
contraseña 	times 	10  	db	" " 	

; FUNCIONES
EsperarTecla:
        mov     AH, 01h         
        int     21h
        ret

LeerCadena:
        xor     SI, SI          
while:  
        call    EsperarTecla    
        cmp     AL, 0x0D        ; comparar AL con caracter EnterKey
        je      exit            
        mov     [BP+SI], AL   	; guardar caracter en memoria
        inc     SI              
        jmp     while           
exit:
	mov 	byte [BP+SI], "$"	
        ret


comparar:
        xor SI, SI
		mov DX, msg2
Iterar:
        MOV BL, [contraseña+SI] 
        mov AL, [msg4+SI]
		inc SI
		cmp AL, BL ; Compara cada letra de la cadena
		jne nopase
		cmp SI, 5
		je fin
		jne Iterar
fin:
        ret

nopase:
	    xor DX, DX 
		mov DX, msg3 
		jmp fin

EscribirCadena:
	mov 	AH, 09h
	int 	21h
	ret