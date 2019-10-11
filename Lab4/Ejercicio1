.MODEL small
.STACK
.DATA
    numero DB ?
    residuo DB ?
    par DB 'El numero ingresado es par.$'
    impar DB 'El numero ingresado es impar.$'
.CODE

programa:
    MOV AX, @DATA
    MOV DS,AX

    ;Se lee el numero
    XOR AX, AX
    MOV AH, 01h
    INT 21h
    MOV numero, AL
    SUB numero, 30h
    
    ;Salto de linea
    MOV DL,10
    MOV AH,02
    INT 21h
    
    ;Divide entre dos
    XOR AX, AX
    MOV AL, numero
    MOV CL, 2
    DIV CL
    ;Residuo queda en AH
    MOV residuo, AH
    
    ;Verifica el valor del residuo
    CMP residuo, 0
    JZ imprimepar
    JNZ imprimeimpar
    
    imprimepar:
    MOV DX, Offset par
    MOV AH, 09h
    INT 21h
    JMP finalizar

    imprimeimpar:
    MOV DX, Offset impar
    MOV AH, 09h
    INT 21h
    
    ;finalizar programa
    finalizar:
    MOV AH, 4Ch
    INT 21h
    
end programa