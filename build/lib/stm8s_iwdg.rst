                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_iwdg
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _IWDG_WriteAccessCmd
                                     12 	.globl _IWDG_SetPrescaler
                                     13 	.globl _IWDG_SetReload
                                     14 	.globl _IWDG_ReloadCounter
                                     15 	.globl _IWDG_Enable
                                     16 ;--------------------------------------------------------
                                     17 ; ram data
                                     18 ;--------------------------------------------------------
                                     19 	.area DATA
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area INITIALIZED
                                     24 ;--------------------------------------------------------
                                     25 ; absolute external ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area DABS (ABS)
                                     28 ;--------------------------------------------------------
                                     29 ; global & static initialisations
                                     30 ;--------------------------------------------------------
                                     31 	.area HOME
                                     32 	.area GSINIT
                                     33 	.area GSFINAL
                                     34 	.area GSINIT
                                     35 ;--------------------------------------------------------
                                     36 ; Home
                                     37 ;--------------------------------------------------------
                                     38 	.area HOME
                                     39 	.area HOME
                                     40 ;--------------------------------------------------------
                                     41 ; code
                                     42 ;--------------------------------------------------------
                                     43 	.area CODE
                                     44 ;	lib/stm8s_iwdg.c: 13: void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
                                     45 ;	-----------------------------------------
                                     46 ;	 function IWDG_WriteAccessCmd
                                     47 ;	-----------------------------------------
      00844C                         48 _IWDG_WriteAccessCmd:
                                     49 ;	lib/stm8s_iwdg.c: 15: IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
      00844C AE 50 E0         [ 2]   50 	ldw	x, #0x50e0
      00844F 7B 03            [ 1]   51 	ld	a, (0x03, sp)
      008451 F7               [ 1]   52 	ld	(x), a
      008452 81               [ 4]   53 	ret
                                     54 ;	lib/stm8s_iwdg.c: 18: void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
                                     55 ;	-----------------------------------------
                                     56 ;	 function IWDG_SetPrescaler
                                     57 ;	-----------------------------------------
      008453                         58 _IWDG_SetPrescaler:
                                     59 ;	lib/stm8s_iwdg.c: 20: IWDG->PR = (uint8_t)IWDG_Prescaler;
      008453 AE 50 E1         [ 2]   60 	ldw	x, #0x50e1
      008456 7B 03            [ 1]   61 	ld	a, (0x03, sp)
      008458 F7               [ 1]   62 	ld	(x), a
      008459 81               [ 4]   63 	ret
                                     64 ;	lib/stm8s_iwdg.c: 23: void IWDG_SetReload(uint8_t IWDG_Reload)
                                     65 ;	-----------------------------------------
                                     66 ;	 function IWDG_SetReload
                                     67 ;	-----------------------------------------
      00845A                         68 _IWDG_SetReload:
                                     69 ;	lib/stm8s_iwdg.c: 25: IWDG->RLR = IWDG_Reload;
      00845A AE 50 E2         [ 2]   70 	ldw	x, #0x50e2
      00845D 7B 03            [ 1]   71 	ld	a, (0x03, sp)
      00845F F7               [ 1]   72 	ld	(x), a
      008460 81               [ 4]   73 	ret
                                     74 ;	lib/stm8s_iwdg.c: 28: void IWDG_ReloadCounter(void)
                                     75 ;	-----------------------------------------
                                     76 ;	 function IWDG_ReloadCounter
                                     77 ;	-----------------------------------------
      008461                         78 _IWDG_ReloadCounter:
                                     79 ;	lib/stm8s_iwdg.c: 30: IWDG->KR = IWDG_KEY_REFRESH;
      008461 35 AA 50 E0      [ 1]   80 	mov	0x50e0+0, #0xaa
      008465 81               [ 4]   81 	ret
                                     82 ;	lib/stm8s_iwdg.c: 33: void IWDG_Enable(void)
                                     83 ;	-----------------------------------------
                                     84 ;	 function IWDG_Enable
                                     85 ;	-----------------------------------------
      008466                         86 _IWDG_Enable:
                                     87 ;	lib/stm8s_iwdg.c: 35: IWDG->KR = IWDG_KEY_ENABLE;
      008466 35 CC 50 E0      [ 1]   88 	mov	0x50e0+0, #0xcc
      00846A 81               [ 4]   89 	ret
                                     90 	.area CODE
                                     91 	.area INITIALIZER
                                     92 	.area CABS (ABS)
