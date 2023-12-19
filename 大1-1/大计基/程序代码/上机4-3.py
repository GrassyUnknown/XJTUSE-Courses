a=2
b=1
sum=0
for i in range(1,21):
    sum=sum+(a/b)
    c=a
    a=a+b
    b=c
print(sum)

