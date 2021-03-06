DATA SEGMENT 
    LNAME       DB 30 DUP(0)
    ADDRESS     DB 30 DUP(0)
    CITY        DB 15 DUP(0)
    CODE_LIST   DB 1, 7, 8, 3, 2
    CODE_LENGTH DW $ - CODE_LIST;(3)
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX
	
    ;LEA AX, LNAME
    MOV AX, DATA
    MOV DS, AX
    
    MOV AX, OFFSET LNAME        ;(1)
    MOV SI, WORD PTR CODE_LIST  ;(2)
    MOV BX, CODE_LENGTH

    MOV AH, 04CH
    INT 21H	
CODE ENDS
    END START