n=float(input())
m='0.'
i=1
while(n!=0 and i<=4):
    n=2*n
    if int(n)==1:
        m=m+'1'
        n=n-1
    elif int(n)==0:
        m=m+'0'
    i=i+1
print(m)

