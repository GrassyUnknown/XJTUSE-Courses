;用定时器T1方式1来产生歌谱中各音符对应频率的方波，由P1.0输出驱动喇叭。
;节拍控制可通过调用延时子程序次数来实现。
				ORG		0000H
				
				AJMP	START
			
				ORG		001BH
			
				AJMP	TIME
;
;***************************************************************
;				/*主程序*/									   *
;***************************************************************
;			
				ORG		0030H
				
START:			MOV		TMOD,#10H		;定时器1方式1
				MOV		IE,#88H			;允许中断
				MOV		DPTR,#TAB
LOOP:			CLR		A
				MOVC	A,@A+DPTR		;取节拍
				MOV		R1,A
				INC		DPTR
				CLR		A
				MOVC	A,@A+DPTR
				MOV		R0,A
				ORL		A,R1
				JZ		NEXT0			;是休止符转停止发音
				MOV		A,R0
				ANL		A,R1
				CJNE	A,#0FFH,NEXT	;没有结束转下一拍
				AJMP	START

NEXT:			MOV		TH1,R1
				MOV		TL1,R0
				SETB	TR1
				SJMP	NEXT1
NEXT0:			CLR		TR1				;是休止符关闭定时器，停止发音
NEXT1:			CLR		A
				INC		DPTR
				MOVC	A,@A+DPTR		;取延时常数
				MOV		R2,A
LOOP1:			CALL	DELAY200MS
				DJNZ	R2,LOOP1
				INC		DPTR
				AJMP	LOOP
;
;***************************************************************
;				/*延时子程序*/								   *
;***************************************************************
;	
DELAY200MS:		MOV		R4,#0A1H
DEL1:			MOV		R3,#0FFH
				DJNZ	R3,$
				DJNZ	R4,DEL1
				RET
			
TIME:			MOV		TH1,R1
				MOV		TL1,R0
				CPL		P1.0
				RETI
		
TAB:			       DW 2202H,2902H,2902H,2902H,2906H,2702H ;我从山中来
DW 2502H,2702H,2502H,2402H,2208H ;带着兰花草
DW 2E02H,2E02H,2E02H,2E02H,2E06H,2C02H ;种在小园中
DW 2902H,2C02H,2D02H,2A02H,2908H ;祈祷花开早
DW 2902H,2E02H,2E02H,2C02H,2906H,2702H ;一日看三回
DW 2502H,2702H,2502H,2402H,2206H,1D02H ;看得花时过
DW 1D02H,2502H,2502H,2402H,2206H,2902H ;兰花却依然
DW 2702H,2502H,2402H,2002H,2208H ;苞也无一个
DW 0000H ;
			
				END		
				
	

