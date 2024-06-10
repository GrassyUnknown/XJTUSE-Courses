
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
	ORL	PCON, #80H
	ANL	TMOD, #0CFH	  ; 11001111B
	ORL	TMOD, #20H	  ; 00100000B

	ORL	SCON, #0D0H	  ; 11010000B
	MOV	TL1, #247
	MOV	TH1, #247
	SETB	TR1

	MOV	A, #055H	  ; SEND SIGNAL 1 TO IBM-PC
	MOV	C, P
	MOV	TB8, C
	MOV	SBUF, A
HAND00:
	JNB	TI, HAND00
	CLR	TI
HAND20:
	JNB	RI, HAND20
	CLR	RI

	MOV	A, #05AH	  ; SEND SIGNAL 2 TO IBM-PC
	MOV	C, P
	MOV	TB8, C
	MOV	SBUF, A
HAND01:
	JNB	TI, HAND01
	CLR	TI
HAND21:
	JNB	RI, HAND21
	CLR	RI

	MOV	A, #0A5H	  ; SEND SIGNAL 3 TO IBM-PC
	MOV	C, P
	MOV	TB8, C
	MOV	SBUF, A
HAND02:
	JNB	TI, HAND02
	CLR	TI
HAND22:
	JNB	RI, HAND22
	CLR	RI

	MOV	A, #050H	  ; SEND SIGNAL 4 TO IBM-PC
	MOV	C, P
	MOV	TB8, C
	MOV	SBUF, A
HAND03:
	JNB	TI, HAND03
	CLR	TI
HAND23:
	JNB	RI, HAND23
	CLR	RI

	MOV	A, #05FH	  ; SEND SIGNAL 5 TO IBM-PC
	MOV	C, P
	MOV	TB8, C
	MOV	SBUF, A
HAND04:
	JNB	TI, HAND04
	CLR	TI

WAIT01:
	JNB	RI, WAIT01	  ; ASK & ANSWER IBM-PC
	MOV	A, SBUF
	CLR	RI

	MOV	C, P
	MOV	TB8, C
	MOV	SBUF, A
WAIT02:
	JNB	TI, WAIT02
	CLR	TI

	MOV	R1, #10H	  ; SEND TO IBM-PC
	MOV	R0, #40H	  ;   FROM RAM 40H--4FH
WAIT03:
	JNB	RI, WAIT03
	CLR	RI

	MOV	A, @R0
	MOV	C, P
	MOV	TB8, C
	MOV	SBUF, A
WAIT04:
	JNB	TI, WAIT04
	CLR	TI
	INC	R0
	DJNZ	R1, WAIT03


WAIT05:
	JNB	RI, WAIT05	  ; ASK & ANSWER IBM-PC
	MOV	A, SBUF
	CLR	RI

	MOV	C, P
	MOV	TB8, C
	MOV	SBUF, A
WAIT06:
	JNB	TI, WAIT06
	CLR	TI

	MOV	R1, #10H	  ; RECEIVE FROM IBM-PC
	MOV	R0, #50H	  ;   SAVE IN RAM 50H--5FH
WAIT07:
	JNB	RI, WAIT07
	MOV	@R0, SBUF
	CLR	RI

	MOV	A, @R0
	MOV	C, P
	MOV	TB8, C
	MOV	SBUF, A
WAIT08:
	JNB	TI, WAIT08
	CLR	TI
	INC	R0
	DJNZ	R1, WAIT07

	RET
	END

