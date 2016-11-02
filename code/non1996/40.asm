FINSUM MACRO PARA1, PARA2, SUM
    PUSH AX
    PUSH BX
    
    LOCAL LARGE
    LOCAL FINAL
    
    MOV AX, PARA1
    MOV BX, PARA2
    CMP AX, BX
    JG LARGE
    SHL BX, 1
    JMP FINAL
LARGE:
    SHL AX, 1
FINAL:
    ADD AX, BX
    MOV SUM, AX
    POP BX
    POP AX
    
ENDM 

DATA SEGMENT
    X DW 5
    Y DW 10
    SUM DW 0
DATA ENDS
    
STACK SEGMENT STACK
    DW 10H DIP(0)
STACK ENDS
    
CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX
    
    FINSUM X, Y, SUM
    
    MOV AH, 4CH
    INT 21H      

CODE ENDS
    END START