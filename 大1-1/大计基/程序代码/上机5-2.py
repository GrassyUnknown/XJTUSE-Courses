num=int(input())
num2=0
i=1
while(num!=0):
    if num%(2**i)!=0:
        num2=num2+1*(10**(i-1))
        num=num-2**(i-1)
    i=i+1
print(num2)





