.MODEL small
.STACK
.DATA
    num1 DB ?
    num2 DB ?
    resultado DB ?
    leernum1 DB 'Ingrese el Numero 1: $'
    leernum2 DB 'Ingrese el Numero 2: $'
    imprimeiguales DB 'Los numeros son iguales.$'
    imprime1mayor2 DB 'Numero 1 es mayor que Numero 2$'
    imprime2mayor1 DB 'Numero 2 es mayor que Numero 1$'
.CODE

programa:
    MOV AX, @DATA
    MOV DS,AX

    ;Se lee numero 1
    MOV DX, Offset leernum1
    MOV AH, 09h
    INT 21h
    
    XOR AX, AX
    MOV AH, 01h
    INT 21h
    MOV num1, AL
    SUB num1, 30h
    
    ;Salto de linea
    MOV DL,10
    MOV AH,02h
    INT 21h
    
    ;Se lee numero 2
    MOV DX, Offset leernum2
    MOV AH, 09h
    INT 21h
    
    XOR AX, AX
    MOV AH, 01h
    INT 21h
    MOV num2, AL
    SUB num2, 30h
    
    ;Salto de linea
    MOV DL,10
    MOV AH,02h
    INT 21h
    
    ;Se opera la resta entre ambos numeros
    MOV AL, num1
    SUB AL, num2
    MOV resultado, AL
    
    ;Se compara el resultado y se definen los jumps
    CMP resultado, 0
    JZ numerosiguales
    JG primeromayor
    JL segundomayor

    primeromayor:
    MOV DX, Offset imprime1mayor2
    MOV AH, 09h
    INT 21h
    JMP finalizar

    segundomayor:
    MOV DX, Offset imprime2mayor1
    MOV AH, 09h
    INT 21h
	JMP finalizar
	
    numerosiguales:
    MOV DX, Offset imprimeiguales
    MOV AH, 09h
    INT 21h
    
    ;finalizar
    finalizar:
    MOV AH, 4Ch
    INT 21h
    
end programa