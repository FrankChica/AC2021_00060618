        org 100h

section .text

; Iniciales
        mov byte[200h], "F"
        mov byte[201h], "O"
        mov byte[202h], "R"     
        mov byte[203h], "C"

; Direccionamiento directo
        mov AX, [200h]

; Direccionamiento indirecto por registo
        mov BX, 201h
        mov CX, [BX]

; direccionamiento indirecto base mas indice
        mov BX, 202h
        mov DX, [BX+DI]

; Direccionamiento relativo por registro
        mov DI, [DI+203h]

        int 20h
