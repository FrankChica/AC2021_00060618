org 100h

    section .text
    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX

    MOV SI, 0
    MOV DI, 0d

    MOV DH, 10 ; fila en la que se mostrará el cursor inicialmente
    MOV DL, 20 ; columna en la que se mostrará el cursor inicialmente

    call modotexto

    ITERAR:
        call movercursor
        MOV CL, [cadena+SI] ;Colocar en CL el caracter actual de la cadena
        call escribircaracter
        INC SI 
        INC DL 
        INC DI 
        CMP DI, 10d 
        JB ITERAR ; si DI es menor a 10, entonces que siga iterando.
        call sup
        jmp IT2

    IT2:
        call movercursor
        MOV CL, [cadena+SI] ;Colocar en CL el caracter actual de la cadena
        call escribircaracter
        INC SI 
        INC DL 
        INC DI 
        CMP DI, 8d 
        JB IT2 ; si DI es menor a 8, entonces que siga iterando.
        call sup
        jmp IT3

    IT3:
        call movercursor
        MOV CL, [cadena+SI] ;Colocar en CL el caracter actual de la cadena
        call escribircaracter
        INC SI 
        INC DL 
        INC DI 
        CMP DI, 10d 
        JB IT3 ; si DI es menor a 10, entonces que siga iterando.
        call sup
        jmp IT4

        IT4:
        call movercursor
        MOV CL, [cadena+SI] ;Colocar en CL el caracter actual de la cadena
        call escribircaracter
        INC SI 
        INC DL 
        INC DI 
        CMP DI, 5d 
        JB IT4 ; si DI es menor a 5, entonces que siga iterando.
        jmp esperartecla 

        sup:
        mov di, 0d ; regresando di a valor inicial
        ADD DH, 2 ; suma 2 a la fila del cursor
        mov DL, 20 ; regresamos columna a 20
        RET

    modotexto: 
        MOV AH, 0h ; activa modo texto
        MOV AL, 03h ; modo gráfico deseado
        INT 10h
        RET

    movercursor:
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV BH, 0h 
        INT 10h
        RET

    escribircaracter:
        MOV AH, 0Ah ; escribe caracter en pantalla según posición del cursor
        MOV AL, CL 
        MOV BH, 0h ; número de página
        MOV CX, 1h ; número de veces a escribir el caracter
        INT 10h
        RET

    esperartecla:
        MOV AH, 00h 
        INT 16h
    exit:
        int 20h



    section .data

    cadena DB 'Francisco Orlando Rodriguez Chica'