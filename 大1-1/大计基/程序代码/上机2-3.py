n=int(input())
i=1
for i in range(2,n):
    if n%i==0:
        print("不是素数")
        break
if i==n-1:
    print("是素数")
