
 ; KX_BASIC_CPU基本8051 CPU核测试程序：选择模式1，键2/键1输入8位2进制数加上
 ; 键4/键3输入的8位2进制数，其和显示于数码管8/7 ,
 ; P0/P3定义为输入口，模式1情况下，P0口的数据由键2/键1输入；P3口的数据由键4/键3输入；
 ; P2/P1定义为输出口，模式1情况下，P2口的数据由数码8/7显示；P1口的数据由数码6/5显示；
 ; 注意，各端口作为输入/输出口是独立的，此例中，P0口作为输入口，与FPGA的PIO7-PIO0相接，
 ; P0口同时作为输出口时，与FPGA的PIO39-PIO33相接，对应模式1的发光管D8-D1。
          ORG 0000H
MAIN :    MOV   SP,#60H
          MOV   24H,#00H
          MOV   30H,#01H
ROUND:    LCALL  DELAY1
          MOV   A,24H
          INC   A
          MOV   24H,A
          MOV   P1,A
          MOV   A,30H
          RR    A
          MOV   P0,A
          MOV   30H,A
          NOP
          NOP
          MOV   A,P0
          MOV   B,P3
          ADD   A,B
          MOV   P2,A
          LCALL  DELAY1
          SJMP  ROUND
DELAY:    MOV   20H,#0FFH
   W1:    MOV   21H,#0FFH
   W2:    DJNZ  21H,W2
          DJNZ  20H,W1
          RET
DELAY1:   MOV   22H,#08H
    W3:   LCALL DELAY
          DJNZ  22H,W3
          RET
          END
