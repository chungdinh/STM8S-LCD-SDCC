;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _delay_ms
	.globl _delay_us
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Write
	.globl _GPIO_Init
	.globl _LCD_STR
	.globl _initLCD
	.globl _LCD_DATA
	.globl _LCD_NYB
	.globl _LCD_LINE
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int 0x0000 ;int3
	int 0x0000 ;int4
	int 0x0000 ;int5
	int 0x0000 ;int6
	int 0x0000 ;int7
	int 0x0000 ;int8
	int 0x0000 ;int9
	int 0x0000 ;int10
	int 0x0000 ;int11
	int 0x0000 ;int12
	int 0x0000 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int 0x0000 ;int17
	int 0x0000 ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int 0x0000 ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	lib/inc/delay.h: 1: void delay_us(int time){
;	-----------------------------------------
;	 function delay_us
;	-----------------------------------------
_delay_us:
	pushw	x
;	lib/inc/delay.h: 2: while(time--){
	ldw	x, (0x05, sp)
00101$:
	ldw	(0x01, sp), x
	decw	x
	ldw	y, (0x01, sp)
	jrne	00101$
	popw	x
	ret
;	lib/inc/delay.h: 6: void delay_ms(int time){
;	-----------------------------------------
;	 function delay_ms
;	-----------------------------------------
_delay_ms:
	pushw	x
;	lib/inc/delay.h: 7: while(time--){
	ldw	x, (0x05, sp)
00101$:
	ldw	(0x01, sp), x
	decw	x
	ldw	y, (0x01, sp)
	jreq	00104$
;	lib/inc/delay.h: 8: delay_us(1000);
	pushw	x
	push	#0xe8
	push	#0x03
	call	_delay_us
	popw	x
	popw	x
	jra	00101$
00104$:
	popw	x
	ret
;	user/main.c: 15: int main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	user/main.c: 17: GPIO_Init(LCD_PORT, GPIO_PIN_ALL, GPIO_MODE_OUT_PP_LOW_FAST);
	push	#0xe0
	push	#0xff
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/main.c: 18: GPIO_Init(LCD_PORT1, GPIO_PIN_ALL, GPIO_MODE_OUT_PP_LOW_FAST);
	push	#0xe0
	push	#0xff
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/main.c: 19: initLCD();
	call	_initLCD
;	user/main.c: 20: LCD_LINE(1);
	push	#0x01
	call	_LCD_LINE
	pop	a
;	user/main.c: 21: LCD_STR("Chung Dinh");
	ldw	x, #___str_0+0
	pushw	x
	call	_LCD_STR
	popw	x
;	user/main.c: 22: delay_ms(100);
	push	#0x64
	push	#0x00
	call	_delay_ms
	popw	x
;	user/main.c: 23: LCD_LINE(2);
	push	#0x02
	call	_LCD_LINE
	pop	a
;	user/main.c: 24: LCD_STR("12/05/1994");
	ldw	x, #___str_1+0
	pushw	x
	call	_LCD_STR
	popw	x
;	user/main.c: 25: delay_ms(100);
	push	#0x64
	push	#0x00
	call	_delay_ms
	popw	x
;	user/main.c: 26: while(1);
00102$:
	jra	00102$
	ret
;	user/main.c: 28: void LCD_STR(const unsigned char *text){
;	-----------------------------------------
;	 function LCD_STR
;	-----------------------------------------
_LCD_STR:
;	user/main.c: 29: while(*text){
	ldw	x, (0x03, sp)
00101$:
	ld	a, (x)
	tnz	a
	jrne	00115$
	ret
00115$:
;	user/main.c: 30: LCD_DATA(*(text++),1);
	incw	x
	pushw	x
	push	#0x01
	push	a
	call	_LCD_DATA
	popw	x
	popw	x
	jra	00101$
	ret
;	user/main.c: 33: void initLCD(void){
;	-----------------------------------------
;	 function initLCD
;	-----------------------------------------
_initLCD:
;	user/main.c: 34: GPIO_WriteLow(LCD_PORT1,LCD_E); //clear enable
	push	#0x80
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/main.c: 35: GPIO_WriteLow(LCD_PORT1,LCD_RS); //viết lệnh 
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/main.c: 37: delay_ms(30); //delay LCD để khởi tạo.
	push	#0x1e
	push	#0x00
	call	_delay_ms
	popw	x
;	user/main.c: 38: LCD_NYB(0x03,0); //Bắt buộc để khởi tạo
	push	#0x00
	push	#0x03
	call	_LCD_NYB
	popw	x
;	user/main.c: 39: delay_ms(5);  
	push	#0x05
	push	#0x00
	call	_delay_ms
	popw	x
;	user/main.c: 40: LCD_NYB(0x03,0); //Bắt buộc để khởi tạo
	push	#0x00
	push	#0x03
	call	_LCD_NYB
	popw	x
;	user/main.c: 41: delay_ms(1);  
	push	#0x01
	push	#0x00
	call	_delay_ms
	popw	x
;	user/main.c: 42: LCD_DATA(0x02,0); //Thiết lập giao diện 4 bit, 1 line và 5*7 font 
	push	#0x00
	push	#0x02
	call	_LCD_DATA
	popw	x
;	user/main.c: 43: LCD_DATA(0x28,0); //Thiết lập giao diện 4 bit, 2 line và 5*10 font  
	push	#0x00
	push	#0x28
	call	_LCD_DATA
	popw	x
;	user/main.c: 44: LCD_DATA(0x0c,0); //Thiết lập giao diện 4 bit, 2 line và 5*7 font 
	push	#0x00
	push	#0x0c
	call	_LCD_DATA
	popw	x
;	user/main.c: 45: LCD_DATA(0x01,0); //Xóa LCD  
	push	#0x00
	push	#0x01
	call	_LCD_DATA
	popw	x
;	user/main.c: 46: LCD_DATA(0x06,0); //Di chuyển trỏ sau khi viết
	push	#0x00
	push	#0x06
	call	_LCD_DATA
	popw	x
	ret
;	user/main.c: 48: void LCD_DATA(unsigned char data,unsigned char type){
;	-----------------------------------------
;	 function LCD_DATA
;	-----------------------------------------
_LCD_DATA:
	push	a
;	user/main.c: 49: delay_ms(10); //TEST LCD
	push	#0x0a
	push	#0x00
	call	_delay_ms
	popw	x
;	user/main.c: 50: LCD_NYB(data>>4,type); //WRITE THE UPPER NIBBLE
	ld	a, (0x04, sp)
	swap	a
	and	a, #0x0f
	ld	(0x01, sp), a
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x02, sp)
	push	a
	call	_LCD_NYB
	popw	x
;	user/main.c: 51: LCD_NYB(data,type); //WRITE THE LOWER NIBBLE
	ld	a, (0x05, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	call	_LCD_NYB
	popw	x
	pop	a
	ret
;	user/main.c: 53: void LCD_NYB(unsigned char nyb, char type){
;	-----------------------------------------
;	 function LCD_NYB
;	-----------------------------------------
_LCD_NYB:
;	user/main.c: 55: temp = (nyb<<1) & 0x1F;
	ld	a, (0x03, sp)
	sll	a
	and	a, #0x1f
;	user/main.c: 56: GPIO_Write(LCD_PORT,temp);
	push	a
	push	#0x0f
	push	#0x50
	call	_GPIO_Write
	addw	sp, #3
;	user/main.c: 57: if(type == 0){
	tnz	(0x04, sp)
	jrne	00102$
;	user/main.c: 58: GPIO_WriteLow(LCD_PORT1,LCD_RS); //COMMAND MODE
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
	jra	00103$
00102$:
;	user/main.c: 60: GPIO_WriteHigh(LCD_PORT1,LCD_RS); //CHARACTER/DATA MODE
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
00103$:
;	user/main.c: 62: GPIO_WriteHigh(LCD_PORT1,LCD_E); //ENABLE LCD DATA LINE
	push	#0x80
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/main.c: 63: delay_ms(1); //SMALL DELAY 
	push	#0x01
	push	#0x00
	call	_delay_ms
	popw	x
;	user/main.c: 64: GPIO_WriteLow(LCD_PORT1,LCD_E); //DISABLE LCD DATA LINE
	push	#0x80
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
	ret
;	user/main.c: 68: void LCD_LINE(char line){
;	-----------------------------------------
;	 function LCD_LINE
;	-----------------------------------------
_LCD_LINE:
;	user/main.c: 69: switch(line){
	ld	a, (0x03, sp)
	cp	a, #0x00
	jreq	00102$
	ld	a, (0x03, sp)
	cp	a, #0x01
	jreq	00102$
	ld	a, (0x03, sp)
	cp	a, #0x02
	jreq	00103$
	ret
;	user/main.c: 71: case 1:
00102$:
;	user/main.c: 72: LCD_DATA(0x80,0);
	push	#0x00
	push	#0x80
	call	_LCD_DATA
	popw	x
;	user/main.c: 73: break;
	ret
;	user/main.c: 74: case 2:
00103$:
;	user/main.c: 75: LCD_DATA(0xC0,0);
	push	#0x00
	push	#0xc0
	call	_LCD_DATA
	popw	x
;	user/main.c: 77: }
	ret
	.area CODE
___str_0:
	.ascii "Chung Dinh"
	.db 0x00
___str_1:
	.ascii "12/05/1994"
	.db 0x00
	.area INITIALIZER
	.area CABS (ABS)
