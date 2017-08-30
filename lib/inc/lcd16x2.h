#include "stm8s.h"
/////////////////////////////////////
void LCD_Enable(void);
void LCD_Send4Bit( uint8_t  Data );
void LCD_SendCommand (uint8_t  command );
void LCD_Init ( void );
void LCD_Gotoxy(uint8_t  x, uint8_t  y);
void LCD_Clear(void);
void LCD_PutChar ( uint8_t  Data );
void LCD_Puts (uint8_t *s);
void Delay_Basic(uint16_t nCount);
/////////////////////////////////////////////////



