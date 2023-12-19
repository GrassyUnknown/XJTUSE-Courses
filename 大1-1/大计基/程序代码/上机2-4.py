m=int(input())
n=int(input())
if m>n:
    r=n
    n=m
    m=r
sum=0
for r in range(m,n+1):
    sum+=r
print(sum)
