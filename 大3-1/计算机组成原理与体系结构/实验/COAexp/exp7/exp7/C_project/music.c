#include <reg51.h>//51��Ƭ�������Ҫ�Ŀ� 
#include <intrins.h>//_nop_��ʱ������Ҫ�ÿ� 
#include <stdio.h>
#include <stdlib.h>
#include <string.h> //�����ַ���������ȡ������ĸ������õ�;����strlen����
#define uchar unsigned char
#define uint unsigned int

uchar code song_tone[]=	// ���տ��ָ������Ƶ�ʱ���ͬƵ���ɲ�ͬ����ʱ������ 
{
 	212,212,190,212,159,169,212,212,190,212,142,159,212,212,106,126,129,169,190,119,119,126,159,142,159,0
};
uchar code song_long[]= // ���տ��ָ���ı����ľ���ÿ�����������೤��
{
 	9,3,12,12,12,24,9,3,12,12,12,24,9,3,12,12,12,12,12,9,3,12,12,12,24,0
};

uint code row11[22] = {0,1,1,1,0,1,1,0,1,0,0,0,0,1,1,1,1,0,1,0,0,1};
uint code row22[22] = {1,0,1,0,1,0,0,1,1,0,0,1,1,0,1,0,0,1,1,1,1,0};
uint code row33[22] = {0,0,1,1,1,1,1,1,1,1,1,0,1,1,0,1,0,0,0,0,1,1};
uint code row44[22] = {1,1,1,0,0,0,1,0,1,0,1,1,0,1,1,1,1,1,1,1,1,1};
uint code answers[22] = {5,9,15,10,6,10,11,6,15,2,3,5,6,11,13,11,9,5,13,5,7,11};
	
uint num;
uint interval;
uchar i;


//���¶�������������ŵ�����,  sbit ��˼Ϊ<�ض���>,,��Ҫ�� bit ���,bit�ǻ���� "λ"

sbit lcdrs = P1^1;         //�ض���,rs��ƽΪ1��������,Ϊ0��ת��ָ��
sbit lcdrw = P1^2;        //����LCD������д;Ϊ1���LCD,Ϊ0��д��LCD
sbit lcden = P1^3;        //LCD�ж�����,ENΪ�½����򽻻�ִ��,��EN = 1;����EN = 0;
  

//������ʱ����
void delay_ms(uint z) 
{ 
  uchar x,y;
   for(x=z;x>0;x--)
    for(y=124;y>0;y--);
}

//********************************************��æ�ӳ���*************
// ��æ�ֳ���,�����ж�LCDҺ���Ƿ�æ״̬.����������жϿ��ܻᵼ������д��LCDʧ��.

void dbusy()                  //�޷���ֵ ������ (��)
{
     P0 = 0xff;                //��0xff���͸�LCD����������
     lcdrs = 0;               //ѡָ��
     lcdrw = 1;               //ѡ���
     lcden = 1;               //ʹ�ܶ���1(�ߵ�ƽ)
     while (P0 & 0x80);    //ѭ�� (���P0��0x80��ȵĻ�) P0 & 0x80����,��P0���ߵ�8λ����������10000000�Ƚ�,
                               //ȫ����ͬ����Ϊ 1<��>;æ״̬����,�����ڴ˴���ѭ������
     lcden = 0;               //ʹ�ܶ���0(�͵�ƽ)
}
/**************************************************************************************/

/***********************************************д���ݻ�ָ���ӳ���*******************/
void tcmddata (int x, unsigned char  DATA)//�޷���ֵ ������ (�������α��� x, �����ַ��ͱ��� DATA)
{
   dbusy();
   delay_ms(50);              //��æ�ӳ���
   P0 = DATA;      //�����æ,��Ѳ��� DDATA ��ȡ���ı�����ֵ�� ����<P0>
   lcdrw = 0;      //��д��ѡ��Ϊ д<0>
   lcdrs = x;      //���ݻ�ָ���ѡ��Ϊ���� <x>��ֵ, x��ֵΪ0����1;Ϊ0��ʾ���ߴ�����ǿ���LCDָ��,Ϊ1��ʾҪ��ʾ������
   lcden = 1;      //ʹ�ܶ���1
   lcden = 0;      //ʹ�ܶ���0; ����һ��ָ���γ�һ���½���,LCDʶ���½����ź����ȡ��������
}
/**************************************************************************************/
//
/************************************************LCD��ʼ������******************/
void lcd_init()            //�޷���ֵ ������ (��)������2004�ĳ�ʼ����1602�ĳ�ʼ��ָ����ȫ��ͬ 
{
   lcden=0;           //ʹ�ܶ�EN���㣬��Ϊ�ϵ���Ĭ�ϸߵ�ƽ������������
     
   //��ʾģʽ����
  tcmddata(0, 0x38);  //������ (ָ��, ָ������)  //  0���͸�tcmddata�����е�x,�پ�tcmddata�������͸�rs,��rs=0�����ʱ����Ϊ���ʽ;0x38Ϊ��������
                      //0x38  ��1602����16*2����2004�ʹ���16*4��ʾ��5*7����8λ���ݽӿ�
   //��ʾ���ؼ��������
  tcmddata(0, 0x08);  //0�������ʽ��0x08  ��ʾֻ����ʾ
   //���ݿ�������
  tcmddata(0, 0x06); //0�������ʽ��0x06  ��ʾ��д��һ���ַ������ݺ󣬵�ַָ���Զ���1���ҹ�����ƣ��ַ�����

  tcmddata(0, 0x0c);  //0�������ʽ��0x0c  ��ʾ����ʾ������ʾ���
	
	
	
	
	tcmddata(0, 0x01);
}
/*************************************************************************************/

 
/**********************������ʾλ��*******************************************************************/
void set_xy(uchar x,uchar y)
{  
   switch(x)
   {
    case 1: y = y + 0x80;break;
	case 2: y = y + 0xc0;break;
	case 3: y = y + 0x94;break;
	case 4: y = y + 0xd4;break;
	default: y = y + 0x80;//
   }
   tcmddata(0,y);//0�������ʽ���涨��ʾ��ʼ�����У�x�У�y�� 

}

/**********************��ʾ����***********************************************************************/

void display(uchar x,uchar y,uchar *s)
{          
    set_xy(x,y); 
    while(*s)  	//����һ�����������ַ���������ʾ  
    {
     P0=*s;
	 tcmddata(1,*s);
	 s++;
    }
}


sbit beep  = P1^0;//��������P1O[0]

unsigned int FTemp;//�洢��ǰ���µ����ټ���ӦƵ�ʵı��� 
unsigned char Timer0_H,Timer0_L,Time;//Timer0_H��Timer0_L��ͬ�洢��ǰ����������Ӧ��Ƶ��,Time�洢��ǰ���������� 



unsigned int code tab[] = {//4*4���̶�Ӧ������Ԥ����(16λ) ����1234�ҿ���+ǰ��Ʒ 
	64684,64898,65030,65157,//D, G, B, E
	64732,64934,65058,65178,//bE, #G, C, F
	64777,64968,65085,65198,//E, A, #C, #F
	64820,64994,65110,65217 //F, bB, D, G
};


unsigned char Keyscan(void){//��ȡ��ǰ���̱����µļ�,����ֵΪ���ĺ���(0~15),û�м����·���16 
	unsigned char i, j, temp, Buffer[4] = {0xfe, 0xfd, 0xfb, 0xf7};
		for(j = 0; j < 4; j++){
			P3 = Buffer[j];
			_nop_();
			temp = 0x80; 
			for(i = 0; i < 4; i++){
				if(!(P3 & temp)){
					return (i + j * 4);//i���к�,j���к�,�ԱȰ������С��е�ַ��ȷ�����¼����к��� 
				}
				temp >>= 1;
			}	
			
		}
	return 16;//���û�м����£�����16 
}
// ���ź���
void playmusic()  
{
 	uint i =0,j,k;
	while(song_long[i]!=0||song_tone[i]!=0)	//�ж��Ƿ�ʱ��������������Ϊ0��Ϊ0����������
	{
	 	for(j=0;j<song_long[i]*20;j++) //ʱ�����������Ȳ�Ϊ0ʱ����һ���Ÿ���������song_long Ϊ���ӳ��ȣ�����20Ϊ��ʱ�������޸����ֵ�ɼӿ��������ֵĲ����ٶ�
		{							   //song_longΪ���ӳ���,һ�����Ĵ��Ϊ 400ms-500ms������Ľ�����������һ��������Ӱ�죬����ֻ�ܸ��ݴ�ŵ���ȡֵ
		 	if(Keyscan()==0)return;
			beep = ~beep; //��ƽ��ת��Ƶ�ʻ��������ͬ�������Ĳ���Ч��
			for(k=0;k<song_tone[i]/5;k++); //�����3ΪƵ���������ڣ��޸ĸ�ֵ��������߻��߽��������������͸�ֵʱ��Ӧ�ʵ��Ӵ������ʱ����֮Ӧ�ʵ���������ʱ��С
		}
		delay_ms(10);
		i++;
	}
}

void DelayUs2x(unsigned char t){//��ʱ2tus 
 	while(--t);
}

void DelayMs(unsigned char t){//��ʱtms 
	while(t--){
		DelayUs2x(245);
		DelayUs2x(245);
	}
}

void delay(unsigned char t){//��ʱ0.25ts 
	unsigned char i;
	for(i=0;i<t;i++){
    DelayMs(250);
	}
	TR0=0;
}

void Song(){//���ֲ��� 
	TH0=Timer0_H;
	TL0=Timer0_L;
	TR0=1;
	delay(Time);//����һ��Time���˷�����ʱ������ 
}





void main(void){

	unsigned char Key_Value = 16, Key_Temp1 = 16, Key_Temp2 = 16;//Ĭ��Key_ValueΪ16(����δ����),Key_Temp1���4*4���̰�����λ��,Key_Temp2��У���� 

	int persent_beat = -2;
	int score = 0;
	int ii;
	int present_row;
	int correct;
	char printstr[5];
	char printstr1[10];
	char printstr2[10];
	int is_playing = 0; 

	TMOD |= 0x11;//����ģʽ��ֵΪ00010001,ǰ4λ��ʾ��ʱ��1����,����λ��ʾ��ʱ��0���� 
	EA  = 1;//�����ж� 
	ET0 = 1;//��ʱ��0�����ж� 
	IT0 = 1;//�ߵ�ƽ���� 
	ET1 = 1;//��ʱ��1�����ж�
	
	
	
	
	
	
	lcd_init();//��ʼ��
	

	
	while(1){//ѭ��ִ�� 
		lcd_init();
		
		
		if (persent_beat > 0 && persent_beat % interval == 0){
			if (Key_Value == answers[persent_beat/interval-1]){
									correct = 1;
						}
					if (correct == 0){
							display(1,0,"F");
						}
						else if (correct == 1 && Key_Value != 16){
							display(1,0,"T");
							score += 1;
						}
		}
		
		


			if (is_playing == 0) {
				display(1,0,"Binary Game");
				display(2,0,"1 for easy");
				display(3,0,"2 for medium");
				display(4,0,"3 for difficult");
				while(Key_Temp1 == 16){//����м�����(����16) 
					Key_Temp1 = Keyscan();//��ȡ�����ı�� 
					Key_Temp2 = Keyscan();//�ٶ�һ�����У�� 
					if (Key_Temp1 == 1){//���У������ 
						is_playing = 1;
						num = 6;
						interval = 3;
					}
					else if(Key_Temp1 == 2){
						is_playing = 1;
						num = 14;
						interval = 2;
					}
					else if(Key_Temp1 == 3){
						is_playing = 1;
						num = 22;
						interval = 1;
					}
					else{
						Key_Temp1 = 16;
					}
				}
			}
			else {
				if (persent_beat == -2) {
					display(2,8,"Ready");
					persent_beat++;
					delay(10);
				}
				else if (persent_beat == -1) {
					display(2,8,"Go");
					persent_beat++;
					delay(10);
				}
				else {
					unsigned char persent_delay = 245;
					unsigned char delay_times = 15;
					Key_Temp1 = 16;

					
					for (ii = 1; ii <num+1 ; ii++){
						present_row = ii*interval-persent_beat;
						if (present_row >= 1 && present_row <= 19){
							sprintf(printstr,"%d",row11[ii-1]);
							display(1,present_row,printstr);
							sprintf(printstr,"%d",row22[ii-1]);
							display(2,present_row,printstr);
							sprintf(printstr,"%d",row33[ii-1]);
							display(3,present_row,printstr);
							sprintf(printstr,"%d",row44[ii-1]);
							display(4,present_row,printstr);
						}
					}
					
					persent_beat++;
						
					while (Key_Temp1 == 16 && persent_delay) {//��û�а��������»�û��ʱ�� 
						//Key_Temp3 = Keyscan();//��ȡ�����ı�� 
						Key_Value = 16;
						correct = 0;
						--persent_delay;
						
						if (delay_times > 0 && persent_delay == 1) {
							persent_delay = 245;
							delay_times--;
						}
						TR0=0;
						
						TR1 = 0;//ֹͣ������TR1 
						Key_Temp1 = Keyscan();//��ȡ�����ı�� 
						if(Key_Temp1 != 16){//����м�����(����16) 
							Key_Temp2 = Keyscan();//�ٶ�һ�����У�� 
							if (Key_Temp1 == Key_Temp2){//���У������ 
								Key_Value = Key_Temp1;//������Ÿ���Key_Value 
								
								
								
								FTemp = tab[Key_Value];//��ӦԤ������ֵ����FTemp 
								TR1 = 1;//����������TR1 
								while (Keyscan() < 16);//ֱ���ɿ����� 
								TR1 = 0;
								beep = 1;//SPK��Ϊ1
							}
						}
						
						
						
						
						if (persent_beat > num*interval+1) {
							sprintf(printstr1,"score %d",score);
							sprintf(printstr2,"total %d",num);
							
							display(1,2,"Finish!");
							display(2,2,printstr1);
							display(3,2,printstr2);
							display(4,2,"0 to restart");
							playmusic();

							
							score = 0;
							persent_beat = -2;
							is_playing = 0;
							delay(15);
							break;
						} 
					} 
					
					
						
					
				}
			}
			
			
		

		
	} 
}

void TIM0_ISR() interrupt 1//��ʱ��T0�ж� 
{
	TR0 = 0;//ֹͣ��ʱ��T0 
	beep = !beep;//�䷴ 
	TH0 = Timer0_H;//������Ԥ�����߰�λ 
	TL0 = Timer0_L;//������Ԥ�����Ͱ�λ
	TR0 = 1;//������ʱ��T0 
}

void T1_INT(void) interrupt 3//��ʱ��T1�ж� 
{
	TR1 = 0;//ֹͣ��ʱ��T1 
	TL1 = FTemp;//������Ԥ�����Ͱ�λ
	TH1 = FTemp >> 8;//������Ԥ�����߰�λ 
	beep = !beep;//�䷴ 
	TR1 = 1;//������ʱ��T1 
}
