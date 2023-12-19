n=int(input('输入n'))
a=int(input('输入a'))
s=0
for i in range(1,n+1):
    for j in range(0,i):
        s+=a*(10**j)
print(s)
