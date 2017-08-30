                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _delay_ms
                                     13 	.globl _delay_us
                                     14 	.globl _GPIO_WriteLow
                                     15 	.globl _GPIO_WriteHigh
                                     16 	.globl _GPIO_Write
                                     17 	.globl _GPIO_Init
                                     18 	.globl _LCD_STR
                                     19 	.globl _initLCD
                                     20 	.globl _LCD_DATA
                                     21 	.globl _LCD_NYB
                                     22 	.globl _LCD_LINE
                                     23 ;--------------------------------------------------------
                                     24 ; ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area DATA
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area INITIALIZED
                                     31 ;--------------------------------------------------------
                                     32 ; Stack segment in internal ram 
                                     33 ;--------------------------------------------------------
                                     34 	.area	SSEG
      000001                         35 __start__stack:
      000001                         36 	.ds	1
                                     37 
                                     38 ;--------------------------------------------------------
                                     39 ; absolute external ram data
                                     40 ;--------------------------------------------------------
                                     41 	.area DABS (ABS)
                                     42 ;--------------------------------------------------------
                                     43 ; interrupt vector 
                                     44 ;--------------------------------------------------------
                                     45 	.area HOME
      008000                         46 __interrupt_vect:
      008000 82 00 80 83             47 	int s_GSINIT ;reset
      008004 82 00 00 00             48 	int 0x0000 ;trap
      008008 82 00 00 00             49 	int 0x0000 ;int0
      00800C 82 00 00 00             50 	int 0x0000 ;int1
      008010 82 00 00 00             51 	int 0x0000 ;int2
      008014 82 00 00 00             52 	int 0x0000 ;int3
      008018 82 00 00 00             53 	int 0x0000 ;int4
      00801C 82 00 00 00             54 	int 0x0000 ;int5
      008020 82 00 00 00             55 	int 0x0000 ;int6
      008024 82 00 00 00             56 	int 0x0000 ;int7
      008028 82 00 00 00             57 	int 0x0000 ;int8
      00802C 82 00 00 00             58 	int 0x0000 ;int9
      008030 82 00 00 00             59 	int 0x0000 ;int10
      008034 82 00 00 00             60 	int 0x0000 ;int11
      008038 82 00 00 00             61 	int 0x0000 ;int12
      00803C 82 00 00 00             62 	int 0x0000 ;int13
      008040 82 00 00 00             63 	int 0x0000 ;int14
      008044 82 00 00 00             64 	int 0x0000 ;int15
      008048 82 00 00 00             65 	int 0x0000 ;int16
      00804C 82 00 00 00             66 	int 0x0000 ;int17
      008050 82 00 00 00             67 	int 0x0000 ;int18
      008054 82 00 00 00             68 	int 0x0000 ;int19
      008058 82 00 00 00             69 	int 0x0000 ;int20
      00805C 82 00 00 00             70 	int 0x0000 ;int21
      008060 82 00 00 00             71 	int 0x0000 ;int22
      008064 82 00 00 00             72 	int 0x0000 ;int23
      008068 82 00 00 00             73 	int 0x0000 ;int24
      00806C 82 00 00 00             74 	int 0x0000 ;int25
      008070 82 00 00 00             75 	int 0x0000 ;int26
      008074 82 00 00 00             76 	int 0x0000 ;int27
      008078 82 00 00 00             77 	int 0x0000 ;int28
      00807C 82 00 00 00             78 	int 0x0000 ;int29
                                     79 ;--------------------------------------------------------
                                     80 ; global & static initialisations
                                     81 ;--------------------------------------------------------
                                     82 	.area HOME
                                     83 	.area GSINIT
                                     84 	.area GSFINAL
                                     85 	.area GSINIT
      008083                         86 __sdcc_gs_init_startup:
      008083                         87 __sdcc_init_data:
                                     88 ; stm8_genXINIT() start
      008083 AE 00 00         [ 2]   89 	ldw x, #l_DATA
      008086 27 07            [ 1]   90 	jreq	00002$
      008088                         91 00001$:
      008088 72 4F 00 00      [ 1]   92 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]   93 	decw x
      00808D 26 F9            [ 1]   94 	jrne	00001$
      00808F                         95 00002$:
      00808F AE 00 00         [ 2]   96 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]   97 	jreq	00004$
      008094                         98 00003$:
      008094 D6 86 99         [ 1]   99 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 00         [ 1]  100 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  101 	decw	x
      00809B 26 F7            [ 1]  102 	jrne	00003$
      00809D                        103 00004$:
                                    104 ; stm8_genXINIT() end
                                    105 	.area GSFINAL
      00809D CC 80 80         [ 2]  106 	jp	__sdcc_program_startup
                                    107 ;--------------------------------------------------------
                                    108 ; Home
                                    109 ;--------------------------------------------------------
                                    110 	.area HOME
                                    111 	.area HOME
      008080                        112 __sdcc_program_startup:
      008080 CC 80 C4         [ 2]  113 	jp	_main
                                    114 ;	return from main will return to caller
                                    115 ;--------------------------------------------------------
                                    116 ; code
                                    117 ;--------------------------------------------------------
                                    118 	.area CODE
                                    119 ;	lib/inc/delay.h: 1: void delay_us(int time){
                                    120 ;	-----------------------------------------
                                    121 ;	 function delay_us
                                    122 ;	-----------------------------------------
      0080A0                        123 _delay_us:
      0080A0 89               [ 2]  124 	pushw	x
                                    125 ;	lib/inc/delay.h: 2: while(time--){
      0080A1 1E 05            [ 2]  126 	ldw	x, (0x05, sp)
      0080A3                        127 00101$:
      0080A3 1F 01            [ 2]  128 	ldw	(0x01, sp), x
      0080A5 5A               [ 2]  129 	decw	x
      0080A6 16 01            [ 2]  130 	ldw	y, (0x01, sp)
      0080A8 26 F9            [ 1]  131 	jrne	00101$
      0080AA 85               [ 2]  132 	popw	x
      0080AB 81               [ 4]  133 	ret
                                    134 ;	lib/inc/delay.h: 6: void delay_ms(int time){
                                    135 ;	-----------------------------------------
                                    136 ;	 function delay_ms
                                    137 ;	-----------------------------------------
      0080AC                        138 _delay_ms:
      0080AC 89               [ 2]  139 	pushw	x
                                    140 ;	lib/inc/delay.h: 7: while(time--){
      0080AD 1E 05            [ 2]  141 	ldw	x, (0x05, sp)
      0080AF                        142 00101$:
      0080AF 1F 01            [ 2]  143 	ldw	(0x01, sp), x
      0080B1 5A               [ 2]  144 	decw	x
      0080B2 16 01            [ 2]  145 	ldw	y, (0x01, sp)
      0080B4 27 0C            [ 1]  146 	jreq	00104$
                                    147 ;	lib/inc/delay.h: 8: delay_us(1000);
      0080B6 89               [ 2]  148 	pushw	x
      0080B7 4B E8            [ 1]  149 	push	#0xe8
      0080B9 4B 03            [ 1]  150 	push	#0x03
      0080BB CD 80 A0         [ 4]  151 	call	_delay_us
      0080BE 85               [ 2]  152 	popw	x
      0080BF 85               [ 2]  153 	popw	x
      0080C0 20 ED            [ 2]  154 	jra	00101$
      0080C2                        155 00104$:
      0080C2 85               [ 2]  156 	popw	x
      0080C3 81               [ 4]  157 	ret
                                    158 ;	user/main.c: 15: int main(void) {
                                    159 ;	-----------------------------------------
                                    160 ;	 function main
                                    161 ;	-----------------------------------------
      0080C4                        162 _main:
                                    163 ;	user/main.c: 17: GPIO_Init(LCD_PORT, GPIO_PIN_ALL, GPIO_MODE_OUT_PP_LOW_FAST);
      0080C4 4B E0            [ 1]  164 	push	#0xe0
      0080C6 4B FF            [ 1]  165 	push	#0xff
      0080C8 4B 0F            [ 1]  166 	push	#0x0f
      0080CA 4B 50            [ 1]  167 	push	#0x50
      0080CC CD 83 71         [ 4]  168 	call	_GPIO_Init
      0080CF 5B 04            [ 2]  169 	addw	sp, #4
                                    170 ;	user/main.c: 18: GPIO_Init(LCD_PORT1, GPIO_PIN_ALL, GPIO_MODE_OUT_PP_LOW_FAST);
      0080D1 4B E0            [ 1]  171 	push	#0xe0
      0080D3 4B FF            [ 1]  172 	push	#0xff
      0080D5 4B 0A            [ 1]  173 	push	#0x0a
      0080D7 4B 50            [ 1]  174 	push	#0x50
      0080D9 CD 83 71         [ 4]  175 	call	_GPIO_Init
      0080DC 5B 04            [ 2]  176 	addw	sp, #4
                                    177 ;	user/main.c: 19: initLCD();
      0080DE CD 81 24         [ 4]  178 	call	_initLCD
                                    179 ;	user/main.c: 20: LCD_LINE(1);
      0080E1 4B 01            [ 1]  180 	push	#0x01
      0080E3 CD 81 FB         [ 4]  181 	call	_LCD_LINE
      0080E6 84               [ 1]  182 	pop	a
                                    183 ;	user/main.c: 21: LCD_STR("Chung Dinh");
      0080E7 AE 82 20         [ 2]  184 	ldw	x, #___str_0+0
      0080EA 89               [ 2]  185 	pushw	x
      0080EB CD 81 10         [ 4]  186 	call	_LCD_STR
      0080EE 85               [ 2]  187 	popw	x
                                    188 ;	user/main.c: 22: delay_ms(100);
      0080EF 4B 64            [ 1]  189 	push	#0x64
      0080F1 4B 00            [ 1]  190 	push	#0x00
      0080F3 CD 80 AC         [ 4]  191 	call	_delay_ms
      0080F6 85               [ 2]  192 	popw	x
                                    193 ;	user/main.c: 23: LCD_LINE(2);
      0080F7 4B 02            [ 1]  194 	push	#0x02
      0080F9 CD 81 FB         [ 4]  195 	call	_LCD_LINE
      0080FC 84               [ 1]  196 	pop	a
                                    197 ;	user/main.c: 24: LCD_STR("12/05/1994");
      0080FD AE 82 2B         [ 2]  198 	ldw	x, #___str_1+0
      008100 89               [ 2]  199 	pushw	x
      008101 CD 81 10         [ 4]  200 	call	_LCD_STR
      008104 85               [ 2]  201 	popw	x
                                    202 ;	user/main.c: 25: delay_ms(100);
      008105 4B 64            [ 1]  203 	push	#0x64
      008107 4B 00            [ 1]  204 	push	#0x00
      008109 CD 80 AC         [ 4]  205 	call	_delay_ms
      00810C 85               [ 2]  206 	popw	x
                                    207 ;	user/main.c: 26: while(1);
      00810D                        208 00102$:
      00810D 20 FE            [ 2]  209 	jra	00102$
      00810F 81               [ 4]  210 	ret
                                    211 ;	user/main.c: 28: void LCD_STR(const unsigned char *text){
                                    212 ;	-----------------------------------------
                                    213 ;	 function LCD_STR
                                    214 ;	-----------------------------------------
      008110                        215 _LCD_STR:
                                    216 ;	user/main.c: 29: while(*text){
      008110 1E 03            [ 2]  217 	ldw	x, (0x03, sp)
      008112                        218 00101$:
      008112 F6               [ 1]  219 	ld	a, (x)
      008113 4D               [ 1]  220 	tnz	a
      008114 26 01            [ 1]  221 	jrne	00115$
      008116 81               [ 4]  222 	ret
      008117                        223 00115$:
                                    224 ;	user/main.c: 30: LCD_DATA(*(text++),1);
      008117 5C               [ 2]  225 	incw	x
      008118 89               [ 2]  226 	pushw	x
      008119 4B 01            [ 1]  227 	push	#0x01
      00811B 88               [ 1]  228 	push	a
      00811C CD 81 8B         [ 4]  229 	call	_LCD_DATA
      00811F 85               [ 2]  230 	popw	x
      008120 85               [ 2]  231 	popw	x
      008121 20 EF            [ 2]  232 	jra	00101$
      008123 81               [ 4]  233 	ret
                                    234 ;	user/main.c: 33: void initLCD(void){
                                    235 ;	-----------------------------------------
                                    236 ;	 function initLCD
                                    237 ;	-----------------------------------------
      008124                        238 _initLCD:
                                    239 ;	user/main.c: 34: GPIO_WriteLow(LCD_PORT1,LCD_E); //clear enable
      008124 4B 80            [ 1]  240 	push	#0x80
      008126 4B 0A            [ 1]  241 	push	#0x0a
      008128 4B 50            [ 1]  242 	push	#0x50
      00812A CD 84 0C         [ 4]  243 	call	_GPIO_WriteLow
      00812D 5B 03            [ 2]  244 	addw	sp, #3
                                    245 ;	user/main.c: 35: GPIO_WriteLow(LCD_PORT1,LCD_RS); //viết lệnh 
      00812F 4B 40            [ 1]  246 	push	#0x40
      008131 4B 0A            [ 1]  247 	push	#0x0a
      008133 4B 50            [ 1]  248 	push	#0x50
      008135 CD 84 0C         [ 4]  249 	call	_GPIO_WriteLow
      008138 5B 03            [ 2]  250 	addw	sp, #3
                                    251 ;	user/main.c: 37: delay_ms(30); //delay LCD để khởi tạo.
      00813A 4B 1E            [ 1]  252 	push	#0x1e
      00813C 4B 00            [ 1]  253 	push	#0x00
      00813E CD 80 AC         [ 4]  254 	call	_delay_ms
      008141 85               [ 2]  255 	popw	x
                                    256 ;	user/main.c: 38: LCD_NYB(0x03,0); //Bắt buộc để khởi tạo
      008142 4B 00            [ 1]  257 	push	#0x00
      008144 4B 03            [ 1]  258 	push	#0x03
      008146 CD 81 B1         [ 4]  259 	call	_LCD_NYB
      008149 85               [ 2]  260 	popw	x
                                    261 ;	user/main.c: 39: delay_ms(5);  
      00814A 4B 05            [ 1]  262 	push	#0x05
      00814C 4B 00            [ 1]  263 	push	#0x00
      00814E CD 80 AC         [ 4]  264 	call	_delay_ms
      008151 85               [ 2]  265 	popw	x
                                    266 ;	user/main.c: 40: LCD_NYB(0x03,0); //Bắt buộc để khởi tạo
      008152 4B 00            [ 1]  267 	push	#0x00
      008154 4B 03            [ 1]  268 	push	#0x03
      008156 CD 81 B1         [ 4]  269 	call	_LCD_NYB
      008159 85               [ 2]  270 	popw	x
                                    271 ;	user/main.c: 41: delay_ms(1);  
      00815A 4B 01            [ 1]  272 	push	#0x01
      00815C 4B 00            [ 1]  273 	push	#0x00
      00815E CD 80 AC         [ 4]  274 	call	_delay_ms
      008161 85               [ 2]  275 	popw	x
                                    276 ;	user/main.c: 42: LCD_DATA(0x02,0); //Thiết lập giao diện 4 bit, 1 line và 5*7 font 
      008162 4B 00            [ 1]  277 	push	#0x00
      008164 4B 02            [ 1]  278 	push	#0x02
      008166 CD 81 8B         [ 4]  279 	call	_LCD_DATA
      008169 85               [ 2]  280 	popw	x
                                    281 ;	user/main.c: 43: LCD_DATA(0x28,0); //Thiết lập giao diện 4 bit, 2 line và 5*10 font  
      00816A 4B 00            [ 1]  282 	push	#0x00
      00816C 4B 28            [ 1]  283 	push	#0x28
      00816E CD 81 8B         [ 4]  284 	call	_LCD_DATA
      008171 85               [ 2]  285 	popw	x
                                    286 ;	user/main.c: 44: LCD_DATA(0x0c,0); //Thiết lập giao diện 4 bit, 2 line và 5*7 font 
      008172 4B 00            [ 1]  287 	push	#0x00
      008174 4B 0C            [ 1]  288 	push	#0x0c
      008176 CD 81 8B         [ 4]  289 	call	_LCD_DATA
      008179 85               [ 2]  290 	popw	x
                                    291 ;	user/main.c: 45: LCD_DATA(0x01,0); //Xóa LCD  
      00817A 4B 00            [ 1]  292 	push	#0x00
      00817C 4B 01            [ 1]  293 	push	#0x01
      00817E CD 81 8B         [ 4]  294 	call	_LCD_DATA
      008181 85               [ 2]  295 	popw	x
                                    296 ;	user/main.c: 46: LCD_DATA(0x06,0); //Di chuyển trỏ sau khi viết
      008182 4B 00            [ 1]  297 	push	#0x00
      008184 4B 06            [ 1]  298 	push	#0x06
      008186 CD 81 8B         [ 4]  299 	call	_LCD_DATA
      008189 85               [ 2]  300 	popw	x
      00818A 81               [ 4]  301 	ret
                                    302 ;	user/main.c: 48: void LCD_DATA(unsigned char data,unsigned char type){
                                    303 ;	-----------------------------------------
                                    304 ;	 function LCD_DATA
                                    305 ;	-----------------------------------------
      00818B                        306 _LCD_DATA:
      00818B 88               [ 1]  307 	push	a
                                    308 ;	user/main.c: 49: delay_ms(10); //TEST LCD
      00818C 4B 0A            [ 1]  309 	push	#0x0a
      00818E 4B 00            [ 1]  310 	push	#0x00
      008190 CD 80 AC         [ 4]  311 	call	_delay_ms
      008193 85               [ 2]  312 	popw	x
                                    313 ;	user/main.c: 50: LCD_NYB(data>>4,type); //WRITE THE UPPER NIBBLE
      008194 7B 04            [ 1]  314 	ld	a, (0x04, sp)
      008196 4E               [ 1]  315 	swap	a
      008197 A4 0F            [ 1]  316 	and	a, #0x0f
      008199 6B 01            [ 1]  317 	ld	(0x01, sp), a
      00819B 7B 05            [ 1]  318 	ld	a, (0x05, sp)
      00819D 88               [ 1]  319 	push	a
      00819E 7B 02            [ 1]  320 	ld	a, (0x02, sp)
      0081A0 88               [ 1]  321 	push	a
      0081A1 CD 81 B1         [ 4]  322 	call	_LCD_NYB
      0081A4 85               [ 2]  323 	popw	x
                                    324 ;	user/main.c: 51: LCD_NYB(data,type); //WRITE THE LOWER NIBBLE
      0081A5 7B 05            [ 1]  325 	ld	a, (0x05, sp)
      0081A7 88               [ 1]  326 	push	a
      0081A8 7B 05            [ 1]  327 	ld	a, (0x05, sp)
      0081AA 88               [ 1]  328 	push	a
      0081AB CD 81 B1         [ 4]  329 	call	_LCD_NYB
      0081AE 85               [ 2]  330 	popw	x
      0081AF 84               [ 1]  331 	pop	a
      0081B0 81               [ 4]  332 	ret
                                    333 ;	user/main.c: 53: void LCD_NYB(unsigned char nyb, char type){
                                    334 ;	-----------------------------------------
                                    335 ;	 function LCD_NYB
                                    336 ;	-----------------------------------------
      0081B1                        337 _LCD_NYB:
                                    338 ;	user/main.c: 55: temp = (nyb<<1) & 0x1F;
      0081B1 7B 03            [ 1]  339 	ld	a, (0x03, sp)
      0081B3 48               [ 1]  340 	sll	a
      0081B4 A4 1F            [ 1]  341 	and	a, #0x1f
                                    342 ;	user/main.c: 56: GPIO_Write(LCD_PORT,temp);
      0081B6 88               [ 1]  343 	push	a
      0081B7 4B 0F            [ 1]  344 	push	#0x0f
      0081B9 4B 50            [ 1]  345 	push	#0x50
      0081BB CD 83 FF         [ 4]  346 	call	_GPIO_Write
      0081BE 5B 03            [ 2]  347 	addw	sp, #3
                                    348 ;	user/main.c: 57: if(type == 0){
      0081C0 0D 04            [ 1]  349 	tnz	(0x04, sp)
      0081C2 26 0D            [ 1]  350 	jrne	00102$
                                    351 ;	user/main.c: 58: GPIO_WriteLow(LCD_PORT1,LCD_RS); //COMMAND MODE
      0081C4 4B 40            [ 1]  352 	push	#0x40
      0081C6 4B 0A            [ 1]  353 	push	#0x0a
      0081C8 4B 50            [ 1]  354 	push	#0x50
      0081CA CD 84 0C         [ 4]  355 	call	_GPIO_WriteLow
      0081CD 5B 03            [ 2]  356 	addw	sp, #3
      0081CF 20 0B            [ 2]  357 	jra	00103$
      0081D1                        358 00102$:
                                    359 ;	user/main.c: 60: GPIO_WriteHigh(LCD_PORT1,LCD_RS); //CHARACTER/DATA MODE
      0081D1 4B 40            [ 1]  360 	push	#0x40
      0081D3 4B 0A            [ 1]  361 	push	#0x0a
      0081D5 4B 50            [ 1]  362 	push	#0x50
      0081D7 CD 84 05         [ 4]  363 	call	_GPIO_WriteHigh
      0081DA 5B 03            [ 2]  364 	addw	sp, #3
      0081DC                        365 00103$:
                                    366 ;	user/main.c: 62: GPIO_WriteHigh(LCD_PORT1,LCD_E); //ENABLE LCD DATA LINE
      0081DC 4B 80            [ 1]  367 	push	#0x80
      0081DE 4B 0A            [ 1]  368 	push	#0x0a
      0081E0 4B 50            [ 1]  369 	push	#0x50
      0081E2 CD 84 05         [ 4]  370 	call	_GPIO_WriteHigh
      0081E5 5B 03            [ 2]  371 	addw	sp, #3
                                    372 ;	user/main.c: 63: delay_ms(1); //SMALL DELAY 
      0081E7 4B 01            [ 1]  373 	push	#0x01
      0081E9 4B 00            [ 1]  374 	push	#0x00
      0081EB CD 80 AC         [ 4]  375 	call	_delay_ms
      0081EE 85               [ 2]  376 	popw	x
                                    377 ;	user/main.c: 64: GPIO_WriteLow(LCD_PORT1,LCD_E); //DISABLE LCD DATA LINE
      0081EF 4B 80            [ 1]  378 	push	#0x80
      0081F1 4B 0A            [ 1]  379 	push	#0x0a
      0081F3 4B 50            [ 1]  380 	push	#0x50
      0081F5 CD 84 0C         [ 4]  381 	call	_GPIO_WriteLow
      0081F8 5B 03            [ 2]  382 	addw	sp, #3
      0081FA 81               [ 4]  383 	ret
                                    384 ;	user/main.c: 68: void LCD_LINE(char line){
                                    385 ;	-----------------------------------------
                                    386 ;	 function LCD_LINE
                                    387 ;	-----------------------------------------
      0081FB                        388 _LCD_LINE:
                                    389 ;	user/main.c: 69: switch(line){
      0081FB 7B 03            [ 1]  390 	ld	a, (0x03, sp)
      0081FD A1 00            [ 1]  391 	cp	a, #0x00
      0081FF 27 0D            [ 1]  392 	jreq	00102$
      008201 7B 03            [ 1]  393 	ld	a, (0x03, sp)
      008203 A1 01            [ 1]  394 	cp	a, #0x01
      008205 27 07            [ 1]  395 	jreq	00102$
      008207 7B 03            [ 1]  396 	ld	a, (0x03, sp)
      008209 A1 02            [ 1]  397 	cp	a, #0x02
      00820B 27 0A            [ 1]  398 	jreq	00103$
      00820D 81               [ 4]  399 	ret
                                    400 ;	user/main.c: 71: case 1:
      00820E                        401 00102$:
                                    402 ;	user/main.c: 72: LCD_DATA(0x80,0);
      00820E 4B 00            [ 1]  403 	push	#0x00
      008210 4B 80            [ 1]  404 	push	#0x80
      008212 CD 81 8B         [ 4]  405 	call	_LCD_DATA
      008215 85               [ 2]  406 	popw	x
                                    407 ;	user/main.c: 73: break;
      008216 81               [ 4]  408 	ret
                                    409 ;	user/main.c: 74: case 2:
      008217                        410 00103$:
                                    411 ;	user/main.c: 75: LCD_DATA(0xC0,0);
      008217 4B 00            [ 1]  412 	push	#0x00
      008219 4B C0            [ 1]  413 	push	#0xc0
      00821B CD 81 8B         [ 4]  414 	call	_LCD_DATA
      00821E 85               [ 2]  415 	popw	x
                                    416 ;	user/main.c: 77: }
      00821F 81               [ 4]  417 	ret
                                    418 	.area CODE
      008220                        419 ___str_0:
      008220 43 68 75 6E 67 20 44   420 	.ascii "Chung Dinh"
             69 6E 68
      00822A 00                     421 	.db 0x00
      00822B                        422 ___str_1:
      00822B 31 32 2F 30 35 2F 31   423 	.ascii "12/05/1994"
             39 39 34
      008235 00                     424 	.db 0x00
                                    425 	.area INITIALIZER
                                    426 	.area CABS (ABS)
