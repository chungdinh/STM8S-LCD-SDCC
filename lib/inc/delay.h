void delay_us(int time){
  while(time--){
    
  }
}
void delay_ms(int time){
  while(time--){
    delay_us(1000);
  }
}