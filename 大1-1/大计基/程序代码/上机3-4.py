num=int(input('输入整数个数'))
list=[]
for i in range(1,num+1):
    list.append(int(input('输入整数')))
for i in range(num-1,-1,-1):
    print(list[i])
