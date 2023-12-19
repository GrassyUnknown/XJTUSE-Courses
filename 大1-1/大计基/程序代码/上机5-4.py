n=float(input())
num=int(n)
n=n-num
num2=0
i=1
while(num!=0):
    if num%(2**i)!=0:
        num2=num2+1*(10**(i-1))
        num=num-2**(i-1)
    i=i+1
m='.'
i=1
while(n!=0 and i<=4):
    n=2*n
    if int(n)==1:
        m=m+'1'
        n=n-1
    elif int(n)==0:
        m=m+'0'
    i=i+1
print(str(num2)+m)

