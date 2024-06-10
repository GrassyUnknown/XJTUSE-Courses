#include <reg52.h>
#define uchar unsigned char
#define uint unsigned int

//数码管显示码表，共阴极，本实验采用的
uchar code display_tab[]={0x3f,0x06,0x5b,0x4f,
 0x66,0x6d,0x7d,0x07,
 0x7f,0x6f,0x77,0x7c,
 0x39,0x5e,0x79,0x71,0};
  
/*数码管显示码表，共阳极
uchar code tab[]={0xc0,0xf9,0xa4,0xb0,
 0x99,0x92,0x82,0xf8,
 0x80,0x90,0x88,0x83,
 0xc6,0xa1,0x86,0x8e,0}; */

/*键盘显示码表，如果不想行列比较可以把键盘也编为表，只需判断一次就可以对应上
uchar code keycode[]={0xee,0xde,0xbe,0x7e,
 0xed,0xdd,0xbd,0x7d,
 0xeb,0xdb,0xbb,0x7b,
 0xe7,0xd7,0xb7,0x77};*/

uchar pre_keynum=16; keynum=16;	//两个全局变量

//短暂延时函数
void delay_ms(uint z) 
{ 
  uchar x,y;
   for(x=z;x>0;x--)
    for(y=124;y>0;y--);
}

void key_scan()
{ 
  uchar temp_cow; // 行号
  uchar temp_col; // 列号

  P3=0x0f;//先对行号置初值
  delay_ms(1);
  // 按键后00001111会变为0000xxxx，每个按键x中会有一个为0，其余为1
  // 下面的异或会将其中的1,0互换，0变1,1变0
  temp_cow=P3^0x0f;
  // 判断按键发生于具体哪一行，为了查表每行都要隔4个数	
  switch(temp_cow)
  {
    case 1: keynum=0;break;
	case 2: keynum=4;break;
	case 4: keynum=8;break;
	case 8: keynum=12;break;
	default: keynum=16;//
  }


  P3=0xf0; //先对列号置初值
  temp_col=P3^0xf0;	//行号占高4位
 // 判断按键发生于具体哪一列
  switch(temp_col)
  {
    case 0x10: keynum+=0;break;
	case 0x20: keynum+=1;break;
	case 0x40: keynum+=2;break;
	case 0x80: keynum+=3;break;
  }
 }
    
void main()
{
  P0=0x3f; //初始化数码管
  while(1)
  {
    P3=0xf0;
	if (P3!=0xf0) key_scan();//判断按键是否按下，按下时扫描键盘获得按键序号
	if (pre_keynum!=keynum)
	{
	  P0=display_tab[keynum];
	  pre_keynum=keynum;
	 }
	 delay_ms(2000);
  }
}

  
