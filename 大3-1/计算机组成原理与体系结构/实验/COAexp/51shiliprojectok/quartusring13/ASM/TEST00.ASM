
          ORG 0000H
   WW:    MOV   A,#4EH
          MOV   R0,A
          MOV   @R0,A
          MOV   A,P1
          NOP 
          MOV   P1,#45H
          SJMP  WW
          END
