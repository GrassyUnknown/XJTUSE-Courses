#include <reg51.h>
#define uchar unsigned char
#define uint unsigned int

uchar code led_pao[]={
0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80};

void delay_ms(uint timer)//��ʱ����
{
   uchar j=124;
   while (timer--){
      for(j=124;j>0;j--);
	}
}

void main(){
  uchar a=0x00;/*����λ���м���*/
  uchar input1;
  uchar input2;
  uchar output1;
	  
  uchar i;
      
  P0=0x01;//��ʼ��P0
  while(1){
    
	for (i=0;i<8;i++) 
	 {	  
	  P0=led_pao[i];//�ò��ķ���ʵ��P0����λ
	  delay_ms(300);//����ʱ������ÿ�εķ������˸ʱ��
	  a=a+1; //����λ���м���*/
	  P1=a;//ͨ��P1�����a��ʱ��ֵ	 

	  input1=P0;//��P0�����������Ҫ�Ӻ͵ļ���
	  input2=P3;//��P3�����������Ҫ�Ӻ͵ı�����
	  output1=input1+input2;
	  P2=output1;//ͨ��P2������Ӻͽ��	 
	}		   
  }
}



