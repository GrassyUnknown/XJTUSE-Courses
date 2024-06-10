#include<reg52.h>
#define uint unsigned int
#define uchar unsigned char
//重新定义各个控制引脚的名称,  sbit 意思为<重定义>,,不要跟 bit 搞混,bit是汇编中 "位"
sbit led=P0^0; //指定发光管对应的输出口 
sbit sound=P1^0;//指定蜂鸣器对应的输出口
sbit key1=P3^0;//指定按键对应的输入口
uint g_count; //定义全局变量，用来计数

//定时器1的中断函数，中断号为3
void timer1_int() interrupt 3
{
  sound=~sound;//蜂鸣器引脚取反，以此来产生一定频率波发声
  led=1;	   //发光管同时亮起
  g_count++;   //延时计数器计数
  if (g_count<400)
  {	//延时数小于定量1时产生固定频率1的声音
    TH1=(8192-700)/32;
	TL1=(8192-700)%32;
   }
   else if (g_count<800)
   { ////延时数大于定量1小于定量2时产生固定频率2的声音
     TH1=(8192-1000)/32;
	 TL1=(8192-1000)%32;
    }
	else
	{ // 关中断 返回
	  TR1=0;
	  g_count=0;
	  led=0;
	 }
}

//普通延时函数
void delay_ms(uint ms)
{
 	uchar t;
	while(ms--)
	{
	 	for(t=0;t<120;t++);
	}
}

void main()
{
  g_count=0; //全局变量赋初值
 
  sound=0;	//初始化蜂鸣器 
  //led=0;   //初始化发光管，也可以不初始化
//
  TMOD=0x00;
  TH1=(8192-700)/32;
  TL1=(8192-700)%32;
  ET1=1;
  EA=1;
 //
  while(1)
  {
    led=0;//进入程序后再次初始化发光管，以同步蜂鸣器
    if(key1==1)	  
	  TR1=1;	//启动定时器发声 
  }
}

