          spk equ p3.0;单片机的P3O端口输出蜂鸣器信号
          ORG 0000H;         
MAIN:     MOV SP, #60H
          mov a,#11H;高4位作为步进电机驱动信号，低4位用以循环
          push a;将驱动信号入栈
ORIG:
          MOV R0,#05H;初始秒数为5
          MOV R1,#00H;初始分钟数为0
          MOV R2,#00H;初始小时数为0
          MOV P0,R0;将秒输出到P0O端口，P0O连接数码管6和5
          MOV P1,R1;将分钟输出到P1O端口，P1O连接数码管8和7
          MOV P2,R2;将小时输出到P2O端口，P2O连接二极管D6~D1
          mov p3,#00h;驱动步进电机初始信号为0        
SEC:
          pop A;出栈到A，作为步进电机驱动信号
          mov R6,a
          mov p3,R6;输出步进电机驱动信号到P3O
          mov a,r6
          rl a;a左移一位，获得下一秒的步进电机驱动信号
          push a          
          ACALL DELAY1;延时0.5S
          ACALL DELAY1;延时0.5S
          MOV A,#00H
	  XRL A,R0;判断秒数是否为零
	  JZ MIN;是零则跳转

          mov a,R0;获得秒数
          dec a;秒数减一
          mov r0,a;秒数原为16进制
          mov b,#10h;将16存到寄存器B中，作为除数
          div ab;将16进制的秒数除以16
          mov a,b;获得余数
          CJNE a,#0fh,haha;判断余数不等于15，如果是则跳转
          mov a,r0;不跳转则当前秒数减6
          dec a;连续6次减一，共减6
          dec a
          dec a
          dec a
          dec a
          dec a
          mov r0,a;将秒数存到R0
haha:	
          MOV P0,r0;将秒输出到P0O端口，P0O连接数码管6和5
          SJMP SEC;跳转处理下一秒
MIN:

          MOV R0,#59H;如果秒为0则跳转到这，此时秒被置为59
          MOV A,R1
          XRL A,#00H;判断分钟数是否为0
          JZ HOUR;为0则跳转
          mov a,R1;存储当前的分钟数
          dec a;分钟数减一
          mov r1,a
          mov b,#10h;将16存到寄存器B中，作为除数
          div ab;将16进制的分钟数除以16
          mov a,b;获得余数
          CJNE a,#0fh,haha2;判断余数不等于15，如果是则跳转
          mov a,r1;不跳转则当前分钟数减6
          dec a;连续6次减一，共减6
          dec a
          dec a
          dec a
          dec a
          dec a
          mov r1,a
haha2:
          MOV P0,R0;将秒输出到P0O端口，P0O连接数码管6和5
          MOV P1,R1;将分钟输出到P1O端口，P1O连接数码管8和7
          SJMP SEC;跳转处理下一秒
HOUR:
          MOV R1,#59H;如果分钟为0则跳转到这，此时秒被置为59
          MOV A,R2
	  XRL A,#00H;判断小时数是否为0
          JZ CLRTIME;为0则跳转
          mov a,R2;存储当前的小时数
          dec a;小时数减一
          mov r2,a
          mov b,#10h;将16存到寄存器B中，作为除数
          div ab;将16进制的小时数除以16
          mov a,b
          CJNE a,#0fh,haha3;判断余数不等于15，如果是则跳转
          mov a,r2
          dec a;连续6次减一，共减6
          dec a
          dec a
          dec a
          dec a
          dec a
          mov r2,a;将转成的BCD码的分钟数存到R2中
haha3:
          MOV P0,R0;将秒输出到P0O端口，P0O连接数码管6和5
          MOV P1,R1;将分钟输出到P1O端口，P1O连接数码管8和7
          MOV P2,R2;将小时输出到P2O端口，P2O连接二极管D6~D1
          SJMP SEC

CLRTIME:		;倒计时为0后，清除时间全置为0，并输出到3个端口
          MOV R0,#00H
          MOV R1,#00H
          MOV R2,#00H
          MOV P0,R0;将秒输出到P0O端口，P0O连接数码管6和5
          MOV P1,R1;将分钟输出到P1O端口，P1O连接数码管8和7
          MOV P2,R2;将小时输出到P2O端口，P2O连接二极管D6~D1
          Acall play;调用播放音乐子程序
          LJMP ORIG        
play:
        mov R6,#0dH;播放音符总次数为13
 ahah:
        MOV R3,#00H 
 NEXT:
        MOV A,R3
        MOV DPTR,#TABLE;指针指向音乐频率表
        MOVC A,@A+DPTR
        JZ ahah
        MOV R7,A
        INC R3
        MOV A,R3
        MOVC A,@A+DPTR
        MOV R2,A
        ACALL SONG;播放单个音符
        dec r6;播放音符次数减一
        mov a,r6;将播放音乐次数存到寄存器A中
        jz GO;如果A为0则表示播放结束，跳出字符播放循环
        INC R3;指向下一个音符
        SJMP NEXT
go:
        ret
          
ADJUST:
       ACALL    DELAY2;进入调整时间模式要求至少摁1秒
       MOV      A,P0
       CJNE     A,#03H, ADJRET1;如果P0I[0..1]=11，并且按键时间查过1秒则跳转  
       JMP      ADJCONT
  ADJRET1:
       RET
  ADJCONT:
       ;等待两个按钮被释放
  WWW: MOV      A,P0
       CJNE      A,#00H,WWW;如果P0I[0..1]=00,表示两个按钮都释放，否则在WWW处不断循环  

       MOV      R3,#00H ; R3表示调整选项0:sec 1:min 2:hour
       MOV      R4, #00H ; save BTN1
       MOV      R5, #00H ; save BTN2
DETECT:			; 确保P0I[1..0]不等于11
       MOV      B,P0
       MOV      A,B
       CJNE      A,#03H,BTN1AND2E
       JMP       BTN1AND2
BTN1AND2E:
          		;如果P0I[1..0] = 11
       MOV      A,B

       CJNE     A,#01H,BTN1E
       JMP      BTN1
 BTN1E:  		 ; 如果P0I[0] = 1
       MOV      R4, #00H

       MOV      A,B
       CJNE     A,#02H,BTN2E
       JMP      BTN2
 BTN2E:
 	  		;如果P0I[1] = 1
       MOV      R5, #00H

       JMP     DETECT

BTN1AND2:
       		;等待超过1秒来跳出调整模式
       ACALL    DELAY2
       MOV      A,P0
       CJNE     A,#03H,DETECT

       		;等待两个按钮释放
 WWWW: MOV      A,P0
       CJNE     A,#00H,WWWW

       JMP      ADJEND

BTN1:
       		;判断btn1是否本释放
       CJNE     R4,#01H,BTN1S
       JMP      DETECT
BTN1S:

       MOV      R4,#01H

       INC      R3
       MOV      A,#03H
       XRL      A,R3
       JNZ      BTN1END
       MOV      R3, #00H
BTN1END:
       SJMP     DETECT;跳转到Detect模式处

BTN2:
       ;判断btn2是否本释放
       CJNE     R5,#01H,BTN2S;释放则进行调整
       JMP      DETECT;
BTN2S:
       MOV      R5,#01H

       MOV      A,#00H;如果R3为0则调整秒
       XRL      A,R3;比较R3是否为0
       JZ       ADJSEC;调转
       MOV      A, #01H;如果R3为1则调整秒
       XRL      A,R3;比较R3是否为1
       JZ       ADJMIN;调转
       MOV      A,#02H;如果R3为2则调整秒
       XRL      A,R3;比较R3是否为2
       JZ       ADJHOUR;调转
       SJMP     BTN2END
  ADJSEC:		;调整秒
       MOV      A,R0    ;一次秒数加一
       ADD      A,#01H
       DA       A	;加法调整
       MOV      R0,A
       XRL      A,#60H	;判断秒数是否被加到60 ，如果是则跳转调整
       JNZ      ADJSECEND
       MOV      R0,#00H
  ADJSECEND:            
       MOV      P0,R0
       SJMP     BTN2END
  ADJMIN:             ;调整分钟
       MOV      A,R1  ;一次分钟数加一
       ADD      A,#01H
       DA       A     ;加法调整
       MOV      R1,A
       XRL      A,#60H;判断分钟数是否被加到60 ，如果是则跳转调整
       JNZ      ADJMINEND
       MOV      R1,#00H
  ADJMINEND:
       MOV      P1,R1
       SJMP     BTN2END
  ADJHOUR:            ;调整小时
       MOV      A,R2  ;一次分钟数加一
       ADD      A,#01H
       DA       A     ;加法调整
       MOV      R2,A
       XRL      A,#24H;判断分钟数是否被加到60 ，如果是则跳转调整
       JNZ      ADJHOUREND
       MOV      R2,#00H
  ADJHOUREND:
       MOV      P2,R2
       SJMP     BTN2END
  BTN2END:
       JMP     DETECT
ADJEND:
       RET



DELAYCK:  MOV   20H,#0E1H;给8051计数器端口输入循环数，为225
   W1:    MOV   21H,#0FAH;给8051计数器端口输入循环数，为250
   W2:    DJNZ  21H,W2;循环250次

          MOV   A,P0
          XRL   A,#03H;
          JNZ   ENDADJ
          ACALL ADJUST
ENDADJ:
          DJNZ  20H,W1
          RET

DELAY:    MOV   20H,#0E1H
   W5:    MOV   21H,#0FAH
   W6:    DJNZ  21H,W6
          DJNZ  20H,W5
          RET
;每次半秒
DELAY1:   MOV   22H,#08H;调用8次DELAYCK，等于8*225*250*100HZ = 45MHZ，等于0.5秒（其中该计数器为10ms计数器，即100HZ）
    W3:   LCALL DELAYCK
          DJNZ  22H,W3
          RET
DELAY2:   MOV   23H,#08H
    W4:   LCALL DELAY
          DJNZ  23H,W4
          RET
		;歌曲播放子程序
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

		;产生1/8拍延时子程序
EIGHTH:
MOV A,R7 ; 查表取出廷时参数,保存到R4
MOV DPTR,#DELAY_T
MOVC A,@A+DPTR
MOV R4,A
MOV A,R7 ; 查表取出1/8拍周期数,保存到R5
MOV DPTR,#S_PARA
MOVC A,@A+DPTR
MOV R5,A
NEXTCYC:
ACALL SOUND
DJNZ R5,NEXTCYC
RET

		;发声子程序
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
		;1/8拍周期表
S_PARA:
DS 1DH
DB 15H,16H,00
DB 19H,00H,1CH,00H,1FH,21H,00H,25H
DB 00H,29H,2CH,00H,31H,34H,37H,00H
DB 3EH,41H,00H,49H,00H,52H,57H,00H
DB 62H
		;延时参数表
DELAY_T:
DS 1DH
DB 7EH,77H,00H
DB 6AH,00H,5EH,00H,54H,4FH,00H,46H
DB 00H,3FH,3BH,00H,35H,32H,2FH,00H
DB 2AH,27H,00H,23H,00H,1FH,1DH,0C0H
DB 1AH
;歌曲频率表
TABLE:
DW 2202h,2502h,2902h





