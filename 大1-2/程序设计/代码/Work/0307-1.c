#include <stdio.h>
#include <stdlib.h>
#include <windows.h>

void HideCursor()
{
    CONSOLE_CURSOR_INFO cursor_info = {1, 0}; //第二个值为0表示隐藏光标
    SetConsoleCursorInfo(GetStdHandle(STD_OUTPUT_HANDLE), &cursor_info);
}

//下落的小球-----------------------
int main()
{
    HideCursor();
    int i,j;
    int x = 1;
    int y = 10;

    int left = 0;
	int right = 20;
	int top = 0;
	int bottom = 10;

    for (x = 1; x < 10; x++)
    {

        system("cls"); //清屏函数

        for (int i = top; i <= bottom; i++)
        {
            for (int j = left; j <= right; j++)
            {
                //在此处绘制边框和小球
                if (i == top || i == bottom || j == left || j == right) {
                    printf("#");
                    if (j == right) {
                        printf("\n");
                    }
                }
                else {
                    if (i == x && j == y) {
                        printf("O");
                    }
                    else {
                        printf(" ");
                    }
                }
            }
        }

    }
    return 0;
}

