;HA--P2.0	HB--P2.1	HC--P2.2	HD--P2.3
		ORG		0000H
		
		AJMP	MAIN
		
		ORG	0013H
		
		AJMP	REV
		
		ORG	0030H
		
MAIN:	MOV	IE,#10000100B
	CLR	IT1							;IT0=0�͵�ƽ������ʽ
FOR:	MOV	P2,#0FFH
	MOV	R3,#08H
	MOV	R0,#00H
FOR1:	MOV	A,R0
	MOV	DPTR,#TABLE
	MOVC	A,@A+DPTR					;ȡ�����ź�
	MOV	P2,A
	CALL	DELAY						;��ʱ
	DJNZ	R3,FOR2						;�����ź�û����ת
	AJMP	FOR							;����ת��ʼ
FOR2:	INC	R0							;������ƫ������1
	AJMP	FOR1
	
REV:	MOV	P2,#0FFH					;
	MOV	R3,#08H
	MOV	R0,#09H
REV1:	MOV	A,R0
	MOV	DPTR,#TABLE
	MOVC	A,@A+DPTR
	MOV	P2,A
	CALL	DELAY        
	DJNZ	R3,REV2    ;��R3-1�������ж���R3������0������ת��REV2����R3��0����˳��ִ��
	AJMP	REV3
REV2:	INC	R0
	AJMP	REV1	
REV3:	MOV	P2,#0FFH
	MOV	R3,#08H
	MOV	R0,#00H
	RETI
		
DELAY:	MOV	R1,#40H
DELAY1:	MOV	R2,#48H
        DJNZ	R2,$       ;��R2-1�������ж���R2������0������ת��S����R2��0����˳��ִ��
	DJNZ	R1,DELAY1  ;��R1-1�������ж���R1������0������ת��DELAY1����R2��0����˳��ִ�У���������Ŀ�ľ����ڽ�20M���ȵ�Ƶ�ʽ����� 
	RET
	
TABLE:	DB		0EH,06H,07H,03H,0BH,09H,0DH,0CH	;A->AB->B->BC->C->CD->D->DA->A
	DB		0EH,0CH,0DH,09H,0BH,03H,07H,06H	;A->AD->D->DC->C->CB->B->BA->A
	END			