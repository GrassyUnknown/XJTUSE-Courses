n=input()
m=0
length=len(n)
num=int(n)

for i in range(length-1,-1,-1):
    m=m+(num%10)*(10**i)
    num=num//10
if int(n)==m:
    print("是回文数")
else:
    print("不是回文数")

