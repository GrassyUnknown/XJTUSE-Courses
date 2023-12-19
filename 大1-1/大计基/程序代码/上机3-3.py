num1,num2=0,1
n=int(input())
for i in range(2,n+1):
    num=num1+num2
    num1=num2
    num2=num
print(num)
