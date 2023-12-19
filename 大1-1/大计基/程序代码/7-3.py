str='0123456789ABCDEF'
num=''
num1=int(input('输入要转换的十进制数字：'))
n=int(input('要转换的进制(<=16)：'))
while(num1!=0):
    num=str[num1%n]+num
    num1=num1//n
print('转换后的',n,'进制为：',num)
