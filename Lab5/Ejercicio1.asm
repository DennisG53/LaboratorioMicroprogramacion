.MODEL small
.STACK
.DATA
    num1 DB ?
    num2 DB ?
	resuni DB ?
    resdec DB ?
    decena DB 10d
.CODE
programa:
    MOV AX, @DATA
    MOV DS, AX
    
    XOR AX, AX			;Se limpia la basura
    MOV AH, 01h
    INT 21h
    MOV num1, AL		;Se lee num1
    INT 21h
    MOV num2, AL		;Se lee num2
    
    SUB num1, 30h		;Se resta para obtener los valores
    SUB num2, 30h
    
    MOV CL, num2		;Se almacena el num2 para las repeticiones
    
    multiplicar:
        ADD BL , num1	;Sumas sucesivas
        LOOP multiplicar

    XOR AX, AX          ;Se limpia la basura
    MOV AL, BL
    DIV decena			;Se divide entre 10
	
    MOV resdec,AL		;El resultado de la division va a decenas
    MOV resuni,AH		;El resultado del residuo va a las unidades
	
    ADD resdec,30h
    ADD resuni,30h

    MOV DL, 10
    MOV AH, 02			;Salto de linea
    INT 21h
    MOV DL, 13
    INT 21H

    XOR AX,AX
    MOV AH, 02
    MOV DL, resdec		;Se imprime la decena
    INT 21h
	
    XOR AX,AX
    MOV AH, 02
    MOV DL, resuni		;Se imprime la unidad
    INT 21h    

    finalizar:		    ;Finalizar
    MOV AH, 4Ch
    INT 21h
END programa 