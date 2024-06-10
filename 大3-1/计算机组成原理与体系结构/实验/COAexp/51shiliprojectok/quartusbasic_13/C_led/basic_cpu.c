#include <reg51.h>
#define uchar unsigned char
#define uint unsigned int

uchar code led_pao[]={
0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80};

void delay_ms(uint timer)//延时函数
{
   uchar j=124;
   while (timer--){
      for(j=124;j>0;j--);
	}
}

void main(){
  uchar a=0x00;/*对移位进行计数*/
  uchar input1;
  uchar input2;
  uchar output1;
	  
  uchar i;
      
  P0=0x01;//初始化P0
  while(1){
    
	for (i=0;i<8;i++) 
	 {	  
	  P0=led_pao[i];//用查表的方法实现P0的移位
	  delay_ms(300);//用延时来隔离每次的发光管闪烁时间
	  a=a+1; //对移位进行计数*/
	  P1=a;//通过P1口输出a此时的值	 

	  input1=P0;//从P0口输入读入需要加和的加数
	  input2=P3;//从P3口输入读入需要加和的被加数
	  output1=input1+input2;
	  P2=output1;//通过P2口输出加和结果	 
	}		   
  }
}



