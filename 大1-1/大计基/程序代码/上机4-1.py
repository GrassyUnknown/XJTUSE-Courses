def length(a,b):
    return (((float(b[0])-float(a[0]))**2+(float(b[1])-float(a[1]))**2+(float(b[2])-float(a[2]))**2)**0.5)
a=input('第一个坐标').split(',')
b=input('第二个坐标').split(',')
c=input('第三个坐标').split(',')
l1=length(a,b)
l2=length(b,c)
l3=length(c,a)
p=(l1+l2+l3)/2
s=(p*(p-l1)*(p-l2)*(p-l3))**0.5
print(s)

