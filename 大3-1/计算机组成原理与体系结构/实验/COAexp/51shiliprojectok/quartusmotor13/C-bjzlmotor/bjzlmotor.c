#include <reg52.h>
#define uchar unsigned char
#define uint unsigned int
//重新定义各个控制引脚的名称,  sbit 意思为<重定义>,,不要跟 bit 搞混,bit是汇编中 "位"
sbit ch0=P1^0;
sbit ch1=P1^1;

//逆时针赋值数组
uchar code anclockwise[8]={0x0E,0x06,0x07,0x03,0x0B,0x09,0x0D,0x0C};
//顺时针赋值数组
uchar code clockwise[8]={0x0E,0x0C,0x0D,0x09,0x0B,0x03,0x07,0x06};


/*
//逆时针赋值数组
uchar code anclockwise[8]={0x08,0x0c,0x04,0x06,0x02,0x03,0x01,0x09};
//顺时针赋值数组
uchar code clockwise[8]={0x09,0x01,0x03,0x02,0x06,0x04,0x0c,0x08};
*/

void delay_ms(uint timer)//延时函数
{
   uchar j=124;
   while (timer--){
      for(j=124;j>0;j--);
	}
}

void main(){
  uchar m;

  P1=0x00; //初始化
  P2=0xFF;
  while(1)
  {	
	 //驱动步进电机
     for (m=0;m<8;m++)
	 {
	     P2=clockwise[m];
		 delay_ms(1000);
	 }
	  for (m=0;m<8;m++)
	 {
	     P2=anclockwise[m];
		 delay_ms(1000);
	 }
	//驱动直流电机
     ch0=0;
     ch1=1;
     delay_ms(1000);
     ch0=0;
     ch1=0;
     delay_ms(2000);
     ch0=1;
     ch1=0;
	 delay_ms(1000);

   }


}

