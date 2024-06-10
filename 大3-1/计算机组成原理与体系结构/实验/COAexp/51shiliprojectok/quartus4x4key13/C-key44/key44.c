#include <reg52.h>
#define uchar unsigned char
#define uint unsigned int

//�������ʾ�������������ʵ����õ�
uchar code display_tab[]={0x3f,0x06,0x5b,0x4f,
 0x66,0x6d,0x7d,0x07,
 0x7f,0x6f,0x77,0x7c,
 0x39,0x5e,0x79,0x71,0};
  
/*�������ʾ���������
uchar code tab[]={0xc0,0xf9,0xa4,0xb0,
 0x99,0x92,0x82,0xf8,
 0x80,0x90,0x88,0x83,
 0xc6,0xa1,0x86,0x8e,0}; */

/*������ʾ�������������бȽϿ��԰Ѽ���Ҳ��Ϊ��ֻ���ж�һ�ξͿ��Զ�Ӧ��
uchar code keycode[]={0xee,0xde,0xbe,0x7e,
 0xed,0xdd,0xbd,0x7d,
 0xeb,0xdb,0xbb,0x7b,
 0xe7,0xd7,0xb7,0x77};*/

uchar pre_keynum=16; keynum=16;	//����ȫ�ֱ���

//������ʱ����
void delay_ms(uint z) 
{ 
  uchar x,y;
   for(x=z;x>0;x--)
    for(y=124;y>0;y--);
}

void key_scan()
{ 
  uchar temp_cow; // �к�
  uchar temp_col; // �к�

  P3=0x0f;//�ȶ��к��ó�ֵ
  delay_ms(1);
  // ������00001111���Ϊ0000xxxx��ÿ������x�л���һ��Ϊ0������Ϊ1
  // ��������Ὣ���е�1,0������0��1,1��0
  temp_cow=P3^0x0f;
  // �жϰ��������ھ�����һ�У�Ϊ�˲��ÿ�ж�Ҫ��4����	
  switch(temp_cow)
  {
    case 1: keynum=0;break;
	case 2: keynum=4;break;
	case 4: keynum=8;break;
	case 8: keynum=12;break;
	default: keynum=16;//
  }


  P3=0xf0; //�ȶ��к��ó�ֵ
  temp_col=P3^0xf0;	//�к�ռ��4λ
 // �жϰ��������ھ�����һ��
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
  P0=0x3f; //��ʼ�������
  while(1)
  {
    P3=0xf0;
	if (P3!=0xf0) key_scan();//�жϰ����Ƿ��£�����ʱɨ����̻�ð������
	if (pre_keynum!=keynum)
	{
	  P0=display_tab[keynum];
	  pre_keynum=keynum;
	 }
	 delay_ms(2000);
  }
}

  
