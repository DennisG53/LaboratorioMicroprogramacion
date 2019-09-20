.MODEL small

.DATA
nombre DB 'Dennis Alberto Garcia Mendoza$'
carnet DB '1016417$'
mensaje DB 'El simbolo escogido es:”$'

.STACK

.CODE
Programa:

MOV AX, @Data 
MOV DS, AX

;Se imprime el nombre
MOV DX, OFFSET nombre
MOV AH, 09h		;indicamos que se imprimirá una cadena
INT 21h			;ejecuta la interrupcion para imprimir

;Se imprime el carnet
MOV DX, OFFSET carnet
MOV AH, 09h
INT 21h			

;Se imprime el mensaje 
MOV DX, OFFSET mensaje
MOV AH, 09h
INT 21h

;Se imprime el caracter
mov AH,0eh 		;para imprimir el caracter
mov AL,26		;caracter en ascii (valor en hexadecimal)
int 21h			;ejecuta la interrupcion

;Finaliza el programa
MOV AH, 4ch		;para finalizar
INT 21h  		;ejecuta la interrupcion
END Programa 