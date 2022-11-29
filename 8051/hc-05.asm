;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.0.1 #6083 (Dec 17 2010) (MINGW32)
; This file was generated Tue Nov 29 08:11:56 2022
;--------------------------------------------------------
	.module hc_05
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _uart_ASCII
	.globl _main
	.globl _DHT11_Read
	.globl _DHT11_Read_Bit
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _str
	.globl _state
	.globl _uart_initialize
	.globl _uart_put_char
	.globl _uart_get_char
	.globl _uart_get_char_echo
	.globl _uart_put_string
	.globl _uart_get_string
	.globl _uart_i2s
	.globl _uart_s2i
	.globl _uart_put_integer
	.globl _uart_get_integer
	.globl _uart_put_byte
	.globl _uart_put_word
	.globl _UART_ISR
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_state::
	.ds 2
_str::
	.ds 30
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area OSEG    (OVR,DATA)
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG	(DATA)
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	ljmp	_UART_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:9: int state=0;
	clr	a
	mov	_state,a
	mov	(_state + 1),a
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	lcall	_main
;	return from main will lock up
	sjmp .
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'uart_initialize'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:21: void uart_initialize(void)
;	-----------------------------------------
;	 function uart_initialize
;	-----------------------------------------
_uart_initialize:
	ar2 = 0x02
	ar3 = 0x03
	ar4 = 0x04
	ar5 = 0x05
	ar6 = 0x06
	ar7 = 0x07
	ar0 = 0x00
	ar1 = 0x01
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:23: PCON&=0x7F;		// Clear SMOD of PCON, No Double Baud Rate
	anl	_PCON,#0x7F
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:24: TMOD&=0x2F;TMOD|=0x20;	// Set Timer1 to Mode 2 (8-bit auto reload) for Baud Rate Generation
	anl	_TMOD,#0x2F
	orl	_TMOD,#0x20
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:25: TH1=0xFD;		// Set Baud Rate to 9600 bps for 11.0592M Hz
	mov	_TH1,#0xFD
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:26: SM0=0;SM1=1;		// Set UART to Mode 1 (8-bit UART)
	clr	_SM0
	setb	_SM1
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:27: REN=1;			// Set REN of SCON to Enable UART Receive
	setb	_REN
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:28: TR1=1;			// Set TR1 of TCON to Start Timer1
	setb	_TR1
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:29: TI=0;RI=0;		// Clear TI/RI of SCON to Get Ready to Send/Receive
	clr	_TI
	clr	_RI
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uart_put_char'
;------------------------------------------------------------
;c                         Allocated to registers 
;------------------------------------------------------------
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:32: void uart_put_char(char c)	// Put Character to UART
;	-----------------------------------------
;	 function uart_put_char
;	-----------------------------------------
_uart_put_char:
	mov	_SBUF,dpl
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:35: while(TI==0);TI=0;
00101$:
	jbc	_TI,00108$
	sjmp	00101$
00108$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uart_get_char'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:38: char uart_get_char(void)	// Get Character from UART
;	-----------------------------------------
;	 function uart_get_char
;	-----------------------------------------
_uart_get_char:
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:40: while(RI==0);RI=0;
00101$:
	jbc	_RI,00108$
	sjmp	00101$
00108$:
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:41: return SBUF;
	mov	dpl,_SBUF
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uart_get_char_echo'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:44: char uart_get_char_echo(void)	// Get Character from UART with Echo, Require uart_put_char()
;	-----------------------------------------
;	 function uart_get_char_echo
;	-----------------------------------------
_uart_get_char_echo:
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:46: while(RI==0);RI=0;
00101$:
	jbc	_RI,00108$
	sjmp	00101$
00108$:
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:47: uart_put_char(SBUF);
	mov	dpl,_SBUF
	lcall	_uart_put_char
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:48: return SBUF;
	mov	dpl,_SBUF
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uart_put_string'
;------------------------------------------------------------
;s                         Allocated to registers r2 r3 r4 
;------------------------------------------------------------
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:51: void uart_put_string(char *s)	// Put String to UART, Require uart_put_char()
;	-----------------------------------------
;	 function uart_put_string
;	-----------------------------------------
_uart_put_string:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:53: while(*s!=0){uart_put_char(*s);s++;}
00101$:
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r5,a
	jz	00104$
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	lcall	_uart_put_char
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r2
	cjne	r2,#0x00,00101$
	inc	r3
	sjmp	00101$
00104$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uart_get_string'
;------------------------------------------------------------
;s                         Allocated to registers r2 r3 r4 
;------------------------------------------------------------
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:56: void uart_get_string(char *s)	// Get String from UART, Require uart_get_char_echo()
;	-----------------------------------------
;	 function uart_get_string
;	-----------------------------------------
_uart_get_string:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:58: while(((*s)=uart_get_char())!=13)s++;
00101$:
	push	ar2
	push	ar3
	push	ar4
	lcall	_uart_get_char
	mov	r5,dpl
	pop	ar4
	pop	ar3
	pop	ar2
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	__gptrput
	cjne	r5,#0x0D,00109$
	sjmp	00103$
00109$:
	inc	r2
	cjne	r2,#0x00,00101$
	inc	r3
	sjmp	00101$
00103$:
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:59: *s=0;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'uart_i2s'
;------------------------------------------------------------
;s                         Allocated to stack - offset -5
;i                         Allocated to stack - offset 1
;sign                      Allocated to stack - offset 3
;len                       Allocated to registers r6 
;p                         Allocated to stack - offset 4
;sloc0                     Allocated to stack - offset 8
;sloc1                     Allocated to stack - offset 7
;sloc2                     Allocated to stack - offset 8
;------------------------------------------------------------
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:62: void uart_i2s(int i,char *s)	// Convert Integer to String
;	-----------------------------------------
;	 function uart_i2s
;	-----------------------------------------
_uart_i2s:
	push	_bp
	mov	_bp,sp
	push	dpl
	push	dph
	mov	a,sp
	add	a,#0x0a
	mov	sp,a
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:65: sign='+';len=0;p=s;
	mov	a,_bp
	add	a,#0x03
	mov	r0,a
	mov	@r0,#0x2B
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	a,_bp
	add	a,#0x04
	mov	r1,a
	mov	a,@r0
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:66: if(i<0){sign='-';i=-i;}
	mov	r0,_bp
	inc	r0
	inc	r0
	mov	a,@r0
	jnb	acc.7,00115$
	mov	a,_bp
	add	a,#0x03
	mov	r0,a
	mov	@r0,#0x2D
	mov	r0,_bp
	inc	r0
	clr	c
	clr	a
	subb	a,@r0
	mov	@r0,a
	inc	r0
	clr	a
	subb	a,@r0
	mov	@r0,a
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:67: do{*s=(i%10)+'0';s++;len++;i/=10;}while(i!=0);
00115$:
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	mov	r5,#0x00
00103$:
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#0x0A
	push	acc
	clr	a
	push	acc
	mov	r0,_bp
	inc	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	lcall	__modsint
	mov	r6,dpl
	dec	sp
	dec	sp
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,#0x30
	add	a,r6
	mov	dpl,r4
	mov	dph,r2
	mov	b,r3
	lcall	__gptrput
	inc	dptr
	mov	r4,dpl
	mov	r2,dph
	inc	r5
	mov	ar6,r5
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#0x0A
	push	acc
	clr	a
	push	acc
	mov	r0,_bp
	inc	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	lcall	__divsint
	mov	r0,_bp
	inc	r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	dec	sp
	dec	sp
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	r0,_bp
	inc	r0
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00103$
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:68: if(sign=='-'){*s='-';s++;len++;}
	mov	ar6,r5
	mov	a,_bp
	add	a,#0x03
	mov	r0,a
	cjne	@r0,#0x2D,00119$
	mov	dpl,r4
	mov	dph,r2
	mov	b,r3
	mov	a,#0x2D
	lcall	__gptrput
	mov	a,r5
	inc	a
	mov	r6,a
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:69: for(i=0;i<len/2;i++){p[len]=p[i];p[i]=p[len-1-i];p[len-1-i]=p[len];}
00119$:
	mov	a,r6
	clr	c
	rrc	a
	mov	r2,a
	mov	r0,_bp
	inc	r0
	clr	a
	mov	@r0,a
	inc	r0
	mov	@r0,a
00108$:
	mov	ar5,r2
	mov	r7,#0x00
	mov	r0,_bp
	inc	r0
	clr	c
	mov	a,@r0
	subb	a,r5
	inc	r0
	mov	a,@r0
	xrl	a,#0x80
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jc	00126$
	ljmp	00111$
00126$:
	push	ar2
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r3,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r4,a
	inc	r0
	mov	ar5,@r0
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	mov	r1,_bp
	inc	r1
	mov	a,@r1
	add	a,@r0
	push	acc
	inc	r1
	mov	a,@r1
	inc	r0
	addc	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	pop	acc
	mov	@r0,a
	dec	r0
	pop	acc
	mov	@r0,a
	dec	r0
	pop	acc
	mov	@r0,a
	mov	a,_bp
	add	a,#0x08
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,_bp
	add	a,#0x07
	mov	r1,a
	lcall	__gptrget
	mov	@r1,a
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	mov	a,_bp
	add	a,#0x07
	mov	r0,a
	mov	a,@r0
	lcall	__gptrput
	mov	ar7,r6
	mov	r5,#0x00
	dec	r7
	cjne	r7,#0xff,00127$
	dec	r5
00127$:
	mov	r0,_bp
	inc	r0
	mov	a,r7
	clr	c
	subb	a,@r0
	mov	r7,a
	mov	a,r5
	inc	r0
	subb	a,@r0
	mov	r5,a
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	mov	a,r7
	add	a,@r0
	mov	r7,a
	mov	a,r5
	inc	r0
	addc	a,@r0
	mov	r5,a
	inc	r0
	mov	ar2,@r0
	mov	dpl,r7
	mov	dph,r5
	mov	b,r2
	lcall	__gptrget
	mov	r3,a
	mov	a,_bp
	add	a,#0x08
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r3
	lcall	__gptrput
	mov	dpl,r7
	mov	dph,r5
	mov	b,r2
	mov	a,_bp
	add	a,#0x07
	mov	r0,a
	mov	a,@r0
	lcall	__gptrput
	mov	r0,_bp
	inc	r0
	inc	@r0
	cjne	@r0,#0x00,00128$
	inc	r0
	inc	@r0
00128$:
	pop	ar2
	ljmp	00108$
00111$:
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:70: p[len]=0;
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r2,a
	inc	r0
	mov	ar3,@r0
	mov	dpl,r6
	mov	dph,r2
	mov	b,r3
	clr	a
	lcall	__gptrput
	mov	sp,_bp
	pop	_bp
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uart_s2i'
;------------------------------------------------------------
;s                         Allocated to registers r2 r3 r4 
;i                         Allocated to registers r5 r6 
;sign                      Allocated to stack - offset 1
;sloc0                     Allocated to stack - offset 7
;sloc1                     Allocated to stack - offset 2
;------------------------------------------------------------
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:73: int uart_s2i(char *s)	// Convert String to Integer
;	-----------------------------------------
;	 function uart_s2i
;	-----------------------------------------
_uart_s2i:
	push	_bp
	mov	a,sp
	mov	_bp,a
	add	a,#0x04
	mov	sp,a
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:75: int i=0;char sign='+';
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r0,_bp
	inc	r0
	mov	@r0,#0x2B
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:76: if(*s=='-'){sign='-';s++;}
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r7,a
	cjne	r7,#0x2D,00112$
	mov	r0,_bp
	inc	r0
	mov	@r0,#0x2D
	inc	r2
	cjne	r2,#0x00,00117$
	inc	r3
00117$:
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:77: while(*s!=0){i=i*10+(*s-'0');s++;}
00112$:
	mov	r0,_bp
	inc	r0
	inc	r0
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar4
00103$:
	mov	r0,_bp
	inc	r0
	inc	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	mov	r3,a
	jz	00105$
	push	ar3
	push	ar5
	push	ar6
	mov	dptr,#0x000A
	lcall	__mulint
	mov	r7,dpl
	mov	r2,dph
	dec	sp
	dec	sp
	pop	ar3
	mov	a,r3
	rlc	a
	subb	a,acc
	mov	r4,a
	mov	a,r3
	add	a,#0xd0
	mov	r3,a
	mov	a,r4
	addc	a,#0xff
	mov	r4,a
	mov	a,r3
	add	a,r7
	mov	r7,a
	mov	a,r4
	addc	a,r2
	mov	r2,a
	mov	ar5,r7
	mov	ar6,r2
	mov	r0,_bp
	inc	r0
	inc	r0
	inc	@r0
	cjne	@r0,#0x00,00119$
	inc	r0
	inc	@r0
00119$:
	sjmp	00103$
00105$:
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:78: if(sign=='-')i=-i;
	mov	r0,_bp
	inc	r0
	cjne	@r0,#0x2D,00107$
	clr	c
	clr	a
	subb	a,r5
	mov	r5,a
	clr	a
	subb	a,r6
	mov	r6,a
00107$:
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:79: return i;
	mov	dpl,r5
	mov	dph,r6
	mov	sp,_bp
	pop	_bp
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uart_put_integer'
;------------------------------------------------------------
;i                         Allocated to registers r2 r3 
;s                         Allocated to stack - offset 1
;------------------------------------------------------------
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:82: void uart_put_integer(int i)	// Put Integer to UART, Require uart_i2s(),uart_put_string()
;	-----------------------------------------
;	 function uart_put_integer
;	-----------------------------------------
_uart_put_integer:
	push	_bp
	mov	a,sp
	mov	_bp,a
	add	a,#0x07
	mov	sp,a
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:85: uart_i2s(i,s);uart_put_string(s);
	mov	r4,_bp
	inc	r4
	mov	ar5,r4
	mov	r6,#0x00
	mov	r7,#0x40
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r2
	mov	dph,r3
	lcall	_uart_i2s
	dec	sp
	dec	sp
	dec	sp
	pop	ar4
	mov	r2,#0x00
	mov	r3,#0x40
	mov	dpl,r4
	mov	dph,r2
	mov	b,r3
	lcall	_uart_put_string
	mov	sp,_bp
	pop	_bp
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uart_get_integer'
;------------------------------------------------------------
;s                         Allocated to stack - offset 1
;------------------------------------------------------------
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:88: int uart_get_integer()		// Get Integer from UART, Require uart_get_string(),uart_s2i()
;	-----------------------------------------
;	 function uart_get_integer
;	-----------------------------------------
_uart_get_integer:
	push	_bp
	mov	a,sp
	mov	_bp,a
	add	a,#0x07
	mov	sp,a
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:91: uart_get_string(s);
	mov	r2,_bp
	inc	r2
	mov	ar3,r2
	mov	r4,#0x00
	mov	r5,#0x40
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	push	ar2
	lcall	_uart_get_string
	pop	ar2
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:92: return uart_s2i(s);
	mov	r3,#0x00
	mov	r4,#0x40
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	_uart_s2i
	mov	sp,_bp
	pop	_bp
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uart_put_byte'
;------------------------------------------------------------
;byte_data                 Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:95: void uart_put_byte(unsigned char byte_data)
;	-----------------------------------------
;	 function uart_put_byte
;	-----------------------------------------
_uart_put_byte:
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:97: uart_put_char(uart_ASCII[byte_data/16]);uart_put_char(uart_ASCII[byte_data%16]);
	mov	a,dpl
	mov	r2,a
	swap	a
	anl	a,#0x0f
	mov	dptr,#_uart_ASCII
	movc	a,@a+dptr
	mov	dpl,a
	push	ar2
	lcall	_uart_put_char
	pop	ar2
	mov	a,#0x0F
	anl	a,r2
	mov	dptr,#_uart_ASCII
	movc	a,@a+dptr
	mov	dpl,a
	ljmp	_uart_put_char
;------------------------------------------------------------
;Allocation info for local variables in function 'uart_put_word'
;------------------------------------------------------------
;word_data                 Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:100: void uart_put_word(unsigned int word_data)
;	-----------------------------------------
;	 function uart_put_word
;	-----------------------------------------
_uart_put_word:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\User\Desktop\HC-05\8051\/uart.c:102: uart_put_byte(word_data/256);uart_put_byte(word_data%256);
	mov	ar4,r3
	mov	dpl,r4
	push	ar2
	push	ar3
	lcall	_uart_put_byte
	pop	ar3
	pop	ar2
	mov	dpl,r2
	ljmp	_uart_put_byte
;------------------------------------------------------------
;Allocation info for local variables in function 'DHT11_Read_Bit'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:5: __bit DHT11_Read_Bit()
;	-----------------------------------------
;	 function DHT11_Read_Bit
;	-----------------------------------------
_DHT11_Read_Bit:
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:7: while(DHT11_DATA==0);
00101$:
	jnb	_P0_0,00101$
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:8: TL0=0;
	mov	_TL0,#0x00
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:9: while(DHT11_DATA==1);
00104$:
	jb	_P0_0,00104$
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:10: if(TL0>50)
	mov	a,#0x32
	cjne	a,_TL0,00119$
00119$:
	jnc	00108$
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:11: return 1;
	setb	c
	ret
00108$:
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:13: return 0;
	clr	c
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'DHT11_Read'
;------------------------------------------------------------
;Temperature               Allocated to stack - offset -5
;Humidity                  Allocated to registers r2 r3 r4 
;i                         Allocated to registers r6 
;readings                  Allocated to stack - offset 1
;------------------------------------------------------------
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:16: void DHT11_Read(unsigned char * Humidity,unsigned char * Temperature)
;	-----------------------------------------
;	 function DHT11_Read
;	-----------------------------------------
_DHT11_Read:
	push	_bp
	mov	a,sp
	mov	_bp,a
	add	a,#0x28
	mov	sp,a
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:21: TMOD&=0xF1;TMOD|=0x01;TR0=1;
	anl	_TMOD,#0xF1
	orl	_TMOD,#0x01
	setb	_TR0
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:23: TH0=0;TL0=0;
	mov	_TH0,#0x00
	mov	_TL0,#0x00
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:24: DHT11_DATA=0;
	clr	_P0_0
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:25: while(TH0<75);
00101$:
	mov	a,#0x100 - 0x4B
	add	a,_TH0
	jnc	00101$
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:26: DHT11_DATA=1;
	setb	_P0_0
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:28: while(DHT11_DATA==1);
00104$:
	jb	_P0_0,00104$
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:29: while(DHT11_DATA==0);
00107$:
	jnb	_P0_0,00107$
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:30: while(DHT11_DATA==1);
00110$:
	jb	_P0_0,00110$
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:32: for(i=0;i<40;i++)
	mov	r5,_bp
	inc	r5
	mov	r6,#0x00
00116$:
	cjne	r6,#0x28,00151$
00151$:
	jnc	00113$
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:33: readings[i]=DHT11_Read_Bit();
	mov	a,r6
	add	a,r5
	mov	r0,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar0
	lcall	_DHT11_Read_Bit
	clr	a
	rlc	a
	pop	ar0
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	@r0,a
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:32: for(i=0;i<40;i++)
	inc	r6
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:35: while(DHT11_DATA==0);
	sjmp	00116$
00113$:
	jnb	_P0_0,00113$
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:37: for(i=0,(*Humidity)=0;i<8;i++)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	lcall	__gptrput
	mov	r6,#0x00
00120$:
	cjne	r6,#0x08,00154$
00154$:
	jnc	00123$
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:39: (*Humidity)*=2;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	add	a,acc
	mov	r7,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrput
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:40: (*Humidity)+=readings[i];
	mov	a,r6
	add	a,r5
	mov	r0,a
	push	ar5
	mov	a,@r0
	add	a,r7
	mov	r7,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrput
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:37: for(i=0,(*Humidity)=0;i<8;i++)
	inc	r6
	pop	ar5
	sjmp	00120$
00123$:
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:42: for(i=0,(*Temperature)=0;i<8;i++)
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	lcall	__gptrput
	mov	r6,#0x00
00124$:
	cjne	r6,#0x08,00156$
00156$:
	jnc	00128$
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:44: (*Temperature)*=2;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	add	a,acc
	mov	r7,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrput
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:45: (*Temperature)+=readings[i+16];
	mov	a,#0x10
	add	a,r6
	add	a,r5
	mov	r0,a
	push	ar5
	mov	a,@r0
	add	a,r7
	mov	r7,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrput
;	C:\Users\User\Desktop\HC-05\8051\/DHT11.c:42: for(i=0,(*Temperature)=0;i<8;i++)
	inc	r6
	pop	ar5
	sjmp	00124$
00128$:
	mov	sp,_bp
	pop	_bp
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;i                         Allocated to registers r2 r3 
;j                         Allocated to stack - offset 1
;Humidity                  Allocated to stack - offset 3
;Temperature               Allocated to stack - offset 4
;sloc0                     Allocated to stack - offset 7
;------------------------------------------------------------
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:11: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	push	_bp
	mov	a,sp
	mov	_bp,a
	add	a,#0x04
	mov	sp,a
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:17: IE = 0x90;
	mov	_IE,#0x90
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:18: uart_initialize();
	lcall	_uart_initialize
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:20: while(1)
00117$:
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:22: for(i=0;i<1000;i++){
	mov	r2,#0x00
	mov	r3,#0x00
00129$:
	clr	c
	mov	a,r2
	subb	a,#0xE8
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x83
	jnc	00132$
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:23: for(j=0;j<150;j++){
	mov	r4,#0x00
	mov	r5,#0x00
00125$:
	clr	c
	mov	a,r4
	subb	a,#0x96
	mov	a,r5
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00131$
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:24: if(state==1){
	mov	a,#0x01
	cjne	a,_state,00192$
	clr	a
	cjne	a,(_state + 1),00192$
	sjmp	00193$
00192$:
	sjmp	00104$
00193$:
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:25: A_IB=0;
	clr	_P2_1
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:26: A_IA=1;for(i=0;i<30;i++);
	setb	_P2_0
	mov	r6,#0x1E
	mov	r7,#0x00
00121$:
	dec	r6
	cjne	r6,#0xff,00194$
	dec	r7
00194$:
	mov	a,r6
	orl	a,r7
	jnz	00121$
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:27: A_IA=0;for(i=30;i<100;i++);
	clr	_P2_0
	mov	r6,#0x46
	mov	r7,#0x00
00124$:
	dec	r6
	cjne	r6,#0xff,00196$
	dec	r7
00196$:
	mov	a,r6
	orl	a,r7
	jnz	00124$
	mov	r2,#0x64
	mov	r3,a
	sjmp	00127$
00104$:
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:29: else if(state==0){
	mov	a,_state
	orl	a,(_state + 1)
	jnz	00127$
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:30: A_IA=A_IB=0;
	clr	_P2_1
	clr	_P2_0
00127$:
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:23: for(j=0;j<150;j++){
	inc	r4
	cjne	r4,#0x00,00125$
	inc	r5
	sjmp	00125$
00131$:
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:22: for(i=0;i<1000;i++){
	inc	r2
	cjne	r2,#0x00,00129$
	inc	r3
	sjmp	00129$
00132$:
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:34: EA = 0;
	clr	_EA
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:35: ES = 0;
	clr	_ES
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:36: DHT11_Read(&Humidity,&Temperature);
	mov	a,_bp
	add	a,#0x04
	mov	r2,a
	mov	r3,#0x00
	mov	r6,#0x40
	mov	a,_bp
	add	a,#0x03
	mov	r7,a
	mov	r4,#0x00
	mov	r5,#0x40
	push	ar2
	push	ar3
	push	ar6
	mov	dpl,r7
	mov	dph,r4
	mov	b,r5
	lcall	_DHT11_Read
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:37: uart_put_integer(Temperature);
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	mov	ar4,@r0
	mov	r5,#0x00
	mov	dpl,r4
	mov	dph,r5
	lcall	_uart_put_integer
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:38: uart_put_string("\r\n");
	mov	dptr,#__str_0
	mov	b,#0x80
	lcall	_uart_put_string
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:39: if(state==1){
	mov	a,#0x01
	cjne	a,_state,00201$
	clr	a
	cjne	a,(_state + 1),00201$
	mov	a,#0x01
	sjmp	00202$
00201$:
	clr	a
00202$:
	mov	r4,a
	jz	00109$
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:40: A_IB=0;
	clr	_P2_1
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:41: A_IA=1;for(i=0;i<30;i++);
	setb	_P2_0
	mov	r5,#0x1E
	mov	r6,#0x00
00135$:
	dec	r5
	cjne	r5,#0xff,00204$
	dec	r6
00204$:
	mov	a,r5
	orl	a,r6
	jnz	00135$
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:42: A_IA=0;for(i=30;i<100;i++);
	clr	_P2_0
	mov	r5,#0x46
	mov	r6,#0x00
00138$:
	dec	r5
	cjne	r5,#0xff,00206$
	dec	r6
00206$:
	mov	a,r5
	orl	a,r6
	jnz	00138$
	sjmp	00110$
00109$:
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:44: else if(state==0){
	mov	a,_state
	orl	a,(_state + 1)
	jnz	00110$
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:45: A_IA=A_IB=0;
	clr	_P2_1
	clr	_P2_0
00110$:
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:47: for(i=0;i<1000;i++){
	mov	r2,#0x00
	mov	r3,#0x00
00149$:
	clr	c
	mov	a,r2
	subb	a,#0xE8
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x83
	jnc	00152$
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:48: for(j=0;j<150;j++){
	mov	r0,_bp
	inc	r0
	clr	a
	mov	@r0,a
	inc	r0
	mov	@r0,a
00145$:
	mov	r0,_bp
	inc	r0
	clr	c
	mov	a,@r0
	subb	a,#0x96
	inc	r0
	mov	a,@r0
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00151$
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:49: if(state==1){
	mov	a,r4
	jz	00114$
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:50: A_IB=0;
	clr	_P2_1
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:51: A_IA=1;for(i=0;i<30;i++);
	setb	_P2_0
	mov	r7,#0x1E
	mov	r5,#0x00
00141$:
	dec	r7
	cjne	r7,#0xff,00212$
	dec	r5
00212$:
	mov	a,r7
	orl	a,r5
	jnz	00141$
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:52: A_IA=0;for(i=30;i<100;i++);
	clr	_P2_0
	mov	r5,#0x46
	mov	r6,#0x00
00144$:
	dec	r5
	cjne	r5,#0xff,00214$
	dec	r6
00214$:
	mov	a,r5
	orl	a,r6
	jnz	00144$
	mov	r2,#0x64
	mov	r3,a
	sjmp	00147$
00114$:
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:54: else if(state==0){
	mov	a,_state
	orl	a,(_state + 1)
	jnz	00147$
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:55: A_IA=A_IB=0;
	clr	_P2_1
	clr	_P2_0
00147$:
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:48: for(j=0;j<150;j++){
	mov	r0,_bp
	inc	r0
	inc	@r0
	cjne	@r0,#0x00,00217$
	inc	r0
	inc	@r0
00217$:
	sjmp	00145$
00151$:
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:47: for(i=0;i<1000;i++){
	inc	r2
	cjne	r2,#0x00,00149$
	inc	r3
	sjmp	00149$
00152$:
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:59: EA = 1;
	setb	_EA
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:60: ES = 1;
	setb	_ES
	ljmp	00117$
	mov	sp,_bp
	pop	_bp
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UART_ISR'
;------------------------------------------------------------
;s                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:65: void UART_ISR(void) __interrupt 4
;	-----------------------------------------
;	 function UART_ISR
;	-----------------------------------------
_UART_ISR:
	push	acc
	push	ar2
	push	ar3
	push	psw
	mov	psw,#0x00
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:68: if(RI == 1)
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:70: RI = 0;
	jbc	_RI,00117$
	sjmp	00109$
00117$:
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:71: s = SBUF;
	mov	r2,_SBUF
	mov	r3,#0x00
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:72: SBUF = s;
	mov	_SBUF,r2
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:73: if(state==0){
	mov	a,_state
	orl	a,(_state + 1)
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:74: state = 1;
	jnz	00104$
	mov	_state,#0x01
	mov	(_state + 1),a
	sjmp	00111$
00104$:
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:76: else if(state==1){
	mov	a,#0x01
	cjne	a,_state,00119$
	clr	a
	cjne	a,(_state + 1),00119$
	sjmp	00120$
00119$:
	sjmp	00111$
00120$:
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:77: state = 0;
	clr	a
	mov	_state,a
	mov	(_state + 1),a
	sjmp	00111$
00109$:
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:80: else if(TI == 1)
;	C:\Users\User\Desktop\HC-05\8051\hc-05.c:82: TI = 0;
	jbc	_TI,00121$
	sjmp	00111$
00121$:
00111$:
	pop	psw
	pop	ar3
	pop	ar2
	pop	acc
	reti
;	eliminated unneeded push/pop ar0
;	eliminated unneeded push/pop ar1
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
	.area CSEG    (CODE)
	.area CONST   (CODE)
_uart_ASCII:
	.ascii "0123456789ABCDEF"
	.db 0x00
__str_0:
	.db 0x0D
	.db 0x0A
	.db 0x00
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
