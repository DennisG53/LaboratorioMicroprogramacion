.MODEL small
.STACK
.DATA
    num1 DB ?
    num2 DB ?
    Ssuma DB 'Total: $'
    Sresta DB 'Diferencia: $'
    Smulti DB 'Producto: $'
    Sdivi DB 'Cociente: $'
    Sresiduo DB 'Residuo: $'
    suma DB ?
    resta DB ?
    multi DB ?
    divi DB ?
    residuo DB ?
    resi DB 0
.CODE
programa:
    MOV AX, @DATA
    MOV DS,AX
    
    ; Se lee el primer numero
    XOR AX, AX      ; Se asegura que no quede basura
    MOV AH, 01h
    INT 21h
    MOV num1, AL
    SUB num1, 30h   ; Valor en decimal
    
    ;Este bloque se usa para saltar de linea
    MOV DL,10
    MOV AH,02
    INT 21h
    
    ; Se lee el segundo numero
    XOR AX, AX
    MOV AH, 01h
    INT 21h
    MOV num2, AL
    SUB num2, 30h
    
    MOV DL,10
    MOV AH,02
    INT 21h
    
    ; ======SUMA======
    MOV AL,num1
    ADD AL,num2
    MOV suma, AL
    
    ; Se imprime la cadena
    MOV DX, Offset Ssuma
    MOV AH, 09h
    INT 21h
    
    ; Para el residuo y decenas
    MOV AH,00
    MOV AL,suma
    MOV BL,10 ; Se usa el 10 para dividir y obtener decenas
    DIV BL
    ; Se mueve el residuo
    MOV resi,AH
    ; Para imprimir
    MOV DL,AL   ; Se mueve a DL
    ADD DL,48
    MOV AH,02h
    INT 21h
    ;se imprime resi (lo que queda en decimal)
    MOV DL,resi
    ADD DL,48
    MOV AH,02h
    INT 21h
    
    MOV DL,10
    MOV AH,02
    INT 21h

    ; ======RESTA======
    XOR AX, AX
    MOV AL,num1
    SUB AL,num2
    MOV resta, AL 
    ADD resta,30h
    
    ; Se imprime la cadena
    MOV DX, Offset Sresta
    MOV AH, 09h
    INT 21h

    MOV DL, resta
    MOV AH, 02h
    INT 21h
    
    MOV DL,10
    MOV AH,02
    INT 21h
    
    ; ======MULTIPLICACION======
    XOR AX, AX          
    MOV AL,num1
    MOV BL,num2
    MUL BL
    MOV multi, AL
    
    ; Se imprime la cadena
    MOV DX, Offset Smulti
    MOV AH, 09h
    INT 21h
    
    ; Mismo bloque que en la suma (porque solo la suma y multiplicacion tendran dos digitos)
    MOV AH,00
    MOV AL,multi
    MOV BL,10
    DIV BL
    
    MOV resi,AH

    MOV DL,AL
    ADD DL,48
    MOV AH,02h
    INT 21h
    
    MOV DL,resi
    ADD DL,48
    MOV AH,02h
    INT 21h
    
    MOV DL,10
    MOV AH,02
    INT 21h
    
    ; ======DIVISION======
    XOR AX, AX
    MOV AL, num1
    DIV num2
    MOV divi, al 
    MOV residuo, ah
    ADD divi, 30h
    ADD residuo, 30h
    
    ; Se imprime la cadena
    MOV DX, Offset Sdivi
    MOV AH, 09h
    INT 21h
    
    MOV DL, divi
    MOV AH, 02h
    INT 21h
    
    MOV DL,10
    MOV AH,02
    INT 21h
    
    ; Se imprime la cadena
    MOV DX, Offset Sresiduo
    MOV AH, 09h
    INT 21h
    
    MOV DL, residuo
    MOV AH, 02h
    INT 21h

    
    ; Finalizamos el programa
    MOV AH, 4Ch
    INT 21h
end programa