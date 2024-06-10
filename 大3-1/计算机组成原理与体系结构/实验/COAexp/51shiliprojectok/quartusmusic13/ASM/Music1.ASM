SPK EQU P1.0 ; 蜂鸣器所在端口

ORG 0000H
JMP START

START:
MOV R3,#00H
NEXT:
MOV A,R3
MOV DPTR,#TABLE
MOVC A,@A+DPTR
JZ START
MOV R7,A
INC R3
MOV A,R3
MOVC A,@A+DPTR
MOV R2,A
ACALL SONG
INC R3
SJMP NEXT


;===============================================================================?
;=== ?歌曲播放子程序 ===?
SONG:
MOV A,R2 ; 取出节拍?
RL A
JNZ KEEP
MOV A,#01H
KEEP:
MOV R2,A
REPEAT:
ACALL EIGHTH
DJNZ R2,REPEAT
RET

;===============================================================================?
;=== ?产生1/8拍延时子程序 ?===?
EIGHTH:
MOV A,R7 ; 查表取出廷时参数,保存到R4?
MOV DPTR,#DELAY_T
MOVC A,@A+DPTR
MOV R4,A
MOV A,R7 ; 查表取出1/8拍周期数,保存到R5?
MOV DPTR,#S_PARA
MOVC A,@A+DPTR
MOV R5,A
NEXTCYC:
ACALL SOUND
DJNZ R5,NEXTCYC
RET

;===============================================================================?
;=== ?发声子程序 ===?
SOUND:
SETB SPK
ACALL SDELAY
CLR SPK
ACALL SDELAY
RET

SDELAY:
MOV A,R4 ; 廷时值在R4内
MOV R0,A
XL2:
MOV R1,#03H
DL1:
NOP
DJNZ R1,DL1
DJNZ R0,XL2
RET
;===============================================================================?
;=== ?1/8拍周期表 ?===
S_PARA:
DS 1DH
DB 15H,16H,00
DB 19H,00H,1CH,00H,1FH,21H,00H,25H
DB 00H,29H,2CH,00H,31H,34H,37H,00H
DB 3EH,41H,00H,49H,00H,52H,57H,00H
DB 62H

;===============================================================================?
;=== ?延时参数表 ?===?
DELAY_T:
DS 1DH
DB 7EH,77H,00H
DB 6AH,00H,5EH,00H,54H,4FH,00H,46H
DB 00H,3FH,3BH,00H,35H,32H,2FH,00H
DB 2AH,27H,00H,23H,00H,1FH,1DH,0C0H
DB 1AH

;===============================================================================?
;=== ?歌曲表 ?===?
TABLE:
DW 2202H,2902H,2902H,2902H,2906H,2702H ;我从山中来
DW 2502H,2702H,2502H,2402H,2208H ;带着兰花草
DW 2E02H,2E02H,2E02H,2E02H,2E06H,2C02H ;种在小园中
DW 2902H,2C02H,2D02H,2A02H,2908H ;祈祷花开早
DW 2902H,2E02H,2E02H,2C02H,2906H,2702H ;一日看三回
DW 2502H,2702H,2502H,2402H,2206H,1D02H ;看得花时过
DW 1D02H,2502H,2502H,2402H,2206H,2902H ;兰花却依然
DW 2702H,2502H,2402H,2002H,2208H ;苞也无一个
DW 0000H ;

END
