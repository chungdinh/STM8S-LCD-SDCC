#include "stm8s.h" 
#include "delay.h" 

#define LCD_PORT GPIOD 
#define LCD_PORT1 GPIOC
#define LCD_RS GPIO_PIN_6 
#define LCD_E GPIO_PIN_7

void delay_ms(int delay); 
void initLCD(void);
void LCD_DATA(unsigned char data,unsigned char type);
void LCD_NYB(unsigned char nyb, char type);
void LCD_LINE(char line);
void LCD_STR(const unsigned char *text);
int main(void) {

GPIO_Init(LCD_PORT, GPIO_PIN_ALL, GPIO_MODE_OUT_PP_LOW_FAST);
GPIO_Init(LCD_PORT1, GPIO_PIN_ALL, GPIO_MODE_OUT_PP_LOW_FAST);
initLCD();
LCD_LINE(1);
LCD_STR("Chung Dinh");
delay_ms(100);
LCD_LINE(2);
LCD_STR("12/05/1994");
delay_ms(100);
while(1);
} 
void LCD_STR(const unsigned char *text){
while(*text){
  LCD_DATA(*(text++),1);
}
}
void initLCD(void){
GPIO_WriteLow(LCD_PORT1,LCD_E); //clear enable
GPIO_WriteLow(LCD_PORT1,LCD_RS); //viết lệnh 

delay_ms(30); //delay LCD để khởi tạo.
LCD_NYB(0x03,0); //Bắt buộc để khởi tạo
delay_ms(5);  
LCD_NYB(0x03,0); //Bắt buộc để khởi tạo
delay_ms(1);  
LCD_DATA(0x02,0); //Thiết lập giao diện 4 bit, 1 line và 5*7 font 
LCD_DATA(0x28,0); //Thiết lập giao diện 4 bit, 2 line và 5*10 font  
LCD_DATA(0x0c,0); //Thiết lập giao diện 4 bit, 2 line và 5*7 font 
LCD_DATA(0x01,0); //Xóa LCD  
LCD_DATA(0x06,0); //Di chuyển trỏ sau khi viết
}
void LCD_DATA(unsigned char data,unsigned char type){
delay_ms(10); //TEST LCD
LCD_NYB(data>>4,type); //WRITE THE UPPER NIBBLE
LCD_NYB(data,type); //WRITE THE LOWER NIBBLE
}
void LCD_NYB(unsigned char nyb, char type){
unsigned char temp;
temp = (nyb<<1) & 0x1F;
GPIO_Write(LCD_PORT,temp);
if(type == 0){
GPIO_WriteLow(LCD_PORT1,LCD_RS); //COMMAND MODE
} else {
 GPIO_WriteHigh(LCD_PORT1,LCD_RS); //CHARACTER/DATA MODE
 }
 GPIO_WriteHigh(LCD_PORT1,LCD_E); //ENABLE LCD DATA LINE
 delay_ms(1); //SMALL DELAY 
 GPIO_WriteLow(LCD_PORT1,LCD_E); //DISABLE LCD DATA LINE


} 
void LCD_LINE(char line){
  switch(line){
    case 0:
    case 1:
    LCD_DATA(0x80,0);
    break;
    case 2:
    LCD_DATA(0xC0,0);
    break;
  }
  }