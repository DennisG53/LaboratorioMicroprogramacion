.MODEL small
.STACK
.DATA
    num1 db ?
    num2 db ?
    contador db 0
    contador2 db 0
    res db ?
    resd db ?
    resta db ?
    numdecena db ?
    residuo db ?
    imprimeproducto db 'Producto: $'
    imprimecociente db 'Cociente: $'
    imprimeresiduo db 'Residuo: $'
.CODE

programa:
    MOV AX,@DATA
    MOV DS,AX
    XOR AX, AX    
    
    ;Se multiplica para obtener 10
    MOV AL,5
    MOV BL,2
    MUL BL
    MOV numdecena, AL
    
    ;Se lee num1
    XOR AX,AX
    MOv AH, 01h
    INT 21h
    MOV num1,AL
    SUB num1,30h ;Se resta para obtener valor decimal
    
    ;Se lee num2
    XOR AX,AX
    MOv AH, 01h
    INT 21h
    MOV num2,AL
    SUB num2,30h ;Se resta para obtener valor decimal
    
    ;Se imprime salto de linea
    MOV DL, 10
    MOV AH, 02
    INT 21h
    MOV DL, 13
    INT 21H   

    ;Para la multiplicacion
    bucle:
    XOR AX, AX          ;Limpia la basura
    MOV AL,num1
    ADD AL,res          ;Suma
    MOV res, AL 
    XOR AX, AX          
    MOV AL,contador     
    ADD AL,1            ;Se aumenta el contador en 1
    MOV contador, AL 
    XOR AX, AX          
    MOV AL,num2
    SUB AL,contador     ;Se opera la resta

    ;Almacena resultados en variables
    MOV resta, AL  
    ;En base al resultado se realiza el jump
    CMP resta,0
    JE  imprimirprod
    JMP bucle
    
    imprimirprod:
    XOR AX, AX          
    MOV AL, res
    DIV numdecena   ;Se divide entre 10 para separar los numeros

    MOV resd, al 
    MOV res, ah
    ADD res,30h
    ADD resd,30h
    ;Para imprimir el producto
    XOR AX, AX
    MOV AH, 09
    LEA DX, imprimeproducto
    INT 21h
    ;Se imprime la decena
    XOR AX, AX
    MOV AH, 02
    MOV DL, resd
    INT 21h
    ;Se imprime la unidad
    XOR AX, AX
    MOV AH, 02
    MOV DL, res
    INT 21h


    ;Para la division
    XOR AX, AX          
    MOV AL,num1
    ADD AL,residuo      
    MOV residuo, AL     ;Se almacena el residuo
    bucle_div:
    XOR AX, AX          
    MOV AL,residuo
    SUB AL,num2         ;Se hace la resta
    MOV residuo, AL  
    CMP residuo,0
    JL  imprimir_div    ;Salto si es menor que 0
    XOR AX, AX          
    MOV AL,contador2
    ADD AL,1            ;Aumenta el contador2 en 1
    MOV contador2, AL
    JMP bucle_div

    imprimir_div:
    ;Salto de linea
    MOV DL, 10
    MOV AH, 02
    INT 21h
    MOV DL, 13
    INT 21H 

    ADD contador2,30h   ;Cociente
    ADD residuo,30h     ;Residuo
    
    ;Para imprimir el cociente
    XOR AX, AX
    MOV AH, 09
    LEA DX, imprimecociente
    INT 21h
    ;Imprime el cociente
    XOR AX, AX
    MOV AH, 02
    MOV DL, contador2
    INT 21h
    ;Salto de linea
    MOV DL, 10
    MOV AH, 02
    INT 21h
    MOV DL, 13
    INT 21H 

    ;Para imprimir el residuo
    XOR AX, AX
    MOV AH, 09
    LEA DX, imprimeresiduo
    INT 21h

    ;Imprime el residuo
    XOR AX, AX          
    MOV AL,residuo
    ADD AL,num2
    MOV residuo, AL
    XOR AX, AX
    MOV AH, 02
    MOV DL, residuo
    INT 21h
    
    ;Finalizar
    finalizar:
    MOV AH,4ch
    INT 21h

end programa