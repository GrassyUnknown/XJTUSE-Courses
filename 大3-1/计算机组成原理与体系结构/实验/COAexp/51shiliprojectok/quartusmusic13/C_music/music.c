#include <reg52.h>
#define uchar unsigned char
#define uint unsigned int
//重新定义各个控制引脚的名称,  sbit 意思为<重定义>,,不要跟 bit 搞混,bit是汇编中 "位"
sbit beep = P1^0;
uchar code song_tone[]=	// 生日快乐歌的音符频率表，不同频率由不同的延时来决定 
{
 	212,212,190,212,159,169,212,212,190,212,142,159,212,212,106,126,129,169,190,119,119,126,159,142,159,0
};
uchar code song_long[]= // 生日快乐歌节拍表，节拍决定每个音符的演奏长短
{
 	9,3,12,12,12,24,9,3,12,12,12,24,9,3,12,12,12,12,12,9,3,12,12,12,24,0
};

void delay_ms(uint ms)
{
 	uchar t;
	while(ms--)
	{
	 	for(t=0;t<120;t++);
	}
}

// 播放函数
void playmusic()  
{
 	uint i =0,j,k;
	while(song_long[i]!=0||song_tone[i]!=0)	//判断是否时长或者音符长度为0，为0歌曲即结束
	{
	 	for(j=0;j<song_long[i]*20;j++) //时长及音符长度不为0时，逐一播放各个音符，song_long 为拍子长度，这里20为延时倍数，修改这个值可加快或减缓音乐的播放速度
		{							   //song_long为拍子长度,一个节拍大概为 400ms-500ms，这里的节拍又受下面一个音符的影响，所以只能根据大概的来取值
		 	beep = ~beep; //电平翻转的频率会产生出不同的音调的播放效果
			for(k=0;k<song_tone[i]/3;k++); //这里的3为频率增减调节，修改该值会整体调高或者降低音调，但降低该值时，应适当加大节拍延时，反之应适当将节拍延时调小
		}
		delay_ms(10);
		i++;
	}
}

void main()
{
 	while(1)
	{
	 	playmusic();
		delay_ms(500);
	}
}