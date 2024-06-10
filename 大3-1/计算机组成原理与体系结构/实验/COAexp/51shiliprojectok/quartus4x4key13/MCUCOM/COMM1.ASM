
	   ORG	   0000H
	   LJMP    MMMM
	   ORG	   000BH
	   SJMP    MMMM
	   ORG	   001BH
	   SJMP    MMMM
	   ORG	   0030H
MMMM:	   MOV	   SP,#60H
           CLR     P3.7 

           MOV     P1,#0FFH
           CLR     P3.5
           CLR     P3.2         ;0000
           CLR     P3.3
           CLR     P3.4
           NOP
           MOV     A,P1
           ANL     A,#0FH
           MOV     47H,A

           CLR     P3.5
           CLR     P3.2         ;0001
           CLR     P3.3
           SETB    P3.4
           NOP
           MOV     A,P1
           ANL     A,#0FH
           MOV     46H,A

           CLR     P3.5
           CLR     P3.2         ;0010
           SETB    P3.3
           CLR     P3.4
           NOP
           MOV     A,P1
           ANL     A,#0FH
           MOV     45H,A

           CLR     P3.5
           CLR     P3.2         ;0011
           SETB    P3.3
           SETB    P3.4
           NOP
           MOV     A,P1
           ANL     A,#0FH
           MOV     44H,A

           CLR     P3.5
           SETB    P3.2         ;0100
           CLR     P3.3
           CLR     P3.4
           NOP
           MOV     A,P1
           ANL     A,#0FH
           MOV     43H,A

           CLR     P3.5
           SETB    P3.2         ;0101
           CLR     P3.3
           SETB    P3.4
           NOP
           MOV     A,P1
           ANL     A,#0FH
           MOV     42H,A

           CLR     P3.5
           SETB    P3.2         ;0110
           SETB    P3.3
           CLR     P3.4
           NOP
           MOV     A,P1
           ANL     A,#0FH
           MOV     41H,A

           CLR     P3.5
           SETB    P3.2         ;0111
           SETB    P3.3
           SETB    P3.4
           NOP
           MOV     A,P1
           ANL     A,#0FH
           MOV     40H,A



           MOV     48H,#0AAH
           MOV     49H,#0AAH
           MOV     4AH,#0AAH
           MOV     4BH,#0AAH
           MOV     4CH,#0AAH
           MOV     4DH,#0AAH
           MOV     4EH,#0AAH
           MOV     4FH,#0AAH

       LCALL   COMPC

           SETB    P3.5
           CLR     P3.2
           CLR     P3.3       ; 1000
           CLR     P3.4
           MOV     A,52H
           SWAP    A
           MOV     P1,A
           NOP
           CLR     P3.7
           SETB    P3.7
           CLR     P3.7

           SETB    P3.5
           CLR     P3.2
           CLR     P3.3       ; 1001
           SETB    P3.4
           MOV     A,51H
           SWAP    A 
           MOV     P1,A
           NOP
           CLR     P3.7
           SETB    P3.7
           CLR     P3.7

           SETB    P3.5
           CLR     P3.2
           SETB    P3.3       ; 1010
           CLR     P3.4
           MOV     A,50H
           SWAP    A
           MOV     P1,A
           NOP
           CLR     P3.7
           SETB    P3.7
           CLR     P3.7

           LJMP    MMMM   

;[]---------------------------------------[]
;|	      8051  通信接口		   |
;|					   |
;|	       1997.2. HIEE		   |
;[]---------------------------------------[]
;--------------------------------------------
;	 INTERFACE PROCEDURE
;
;  RAM & REGISTER USED:
;	50H -- 5FH, A, R0, R1, PCON, TMOD,
;	TL1, TH1, SBUF, SCON, C, RI, TI, TR8
;--------------------------------------------
COMPC:
	ORL	PCON, #80H	  ; 串口初始化
	ANL	TMOD, #0CFH	  ; 11001111B
	ORL	TMOD, #20H	  ; 00100000B

	ORL	SCON, #0D0H	  ; 11010000B
	MOV	TL1, #247
	MOV	TH1, #247
	SETB	TR1

HAND20:
 QW1:   JNB     RI, QW1
	mov	a,sbuf
	CLR	RI
	cjne	a,#0f0h,hand20	;PC->MCU:0xf0
	
	mov	c,p
	mov	tb8,c
	mov	sbuf,a		;MCU->PC:0xf0
QW2:    jnb     ti,QW2
	clr	ti
	
QW3:    jnb     ri,QW3             
	mov	a,sbuf
	clr	ri		
	cjne	a,#0a0h,lnext0		
        Ljmp     receive
lnext0:
	cjne	a,#0afh,hand20	  
send:				;PC->MCU:0x0af	
	mov	a,#0afh		;MCU->PC:0x0af	
	mov	c,p
	mov	tb8,c
	mov	sbuf,a
QW4:    jnb     ti,QW4
	clr	ti
	
	mov	r1,#08h	
	MOV	R0, #40H	  ;   FROM RAM 40H--4FH
sendloop:
	MOV	A, @R0
	MOV	C, P
	MOV	TB8, C
	MOV	SBUF, A
QW5:    JNB     TI, QW5
	CLR	TI
	
	INC	R0
	DJNZ	R1, sendloop

	mov	a,#0ffh
	mov	c,p
	mov	tb8,c
	mov	sbuf,a
QW6:    jnb     ti,QW6
	clr	ti	
	
	ret
	
receive:			;PC->MCU:0xa0
	mov	r1, #03h  	; RECEIVE FROM IBM-PC
	MOV	R0, #50H	  ;   SAVE IN RAM 50H--5FH
receloop:
QW7:    JNB     RI, QW7
	MOV	@R0, SBUF
	CLR	RI

	INC	R0
	DJNZ	R1, receloop

QW8:    jnb     ri,QW8
	clr	ri
		
	mov	a,#0a0h		;MCU->PC:0xa0
	mov	c,p
	mov	sbuf,a
QW9:    jnb     ti,QW9
	clr	ti
	
	ret
	
	END

