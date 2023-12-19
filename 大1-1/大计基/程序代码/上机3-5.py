num=int(input('输入整数个数'))
list,max,min,sum=[],0,1E10,0
for i in range(1,num+1):
    list.append(int(input('输入整数')))
for i in list:
    if i>max:
        max=i
    if i<min:
        min=i
    sum+=i
aver=sum/num
print('最大值',max,'最小值',min,'平均值',aver)
    
