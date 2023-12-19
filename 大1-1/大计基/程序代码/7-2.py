yuan=int(input(''))
listyuan=[100,50,20,10,5,1]
for i in range(0,6):
    value=listyuan[i]
    num=yuan//value
    if num!=0:
        print(value,'元:',num,'张')
        yuan=yuan-num*value
