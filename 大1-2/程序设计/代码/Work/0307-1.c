#include <stdio.h>
#include <stdlib.h>
#include <windows.h>

void HideCursor()
{
    CONSOLE_CURSOR_INFO cursor_info = {1, 0}; //�ڶ���ֵΪ0��ʾ���ع��
    SetConsoleCursorInfo(GetStdHandle(STD_OUTPUT_HANDLE), &cursor_info);
}

//�����С��-----------------------
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

        system("cls"); //��������

        for (int i = top; i <= bottom; i++)
        {
            for (int j = left; j <= right; j++)
            {
                //�ڴ˴����Ʊ߿��С��
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

