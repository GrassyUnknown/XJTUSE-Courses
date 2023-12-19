def isPrime(n):
    for i in range(2,n):
        if n%i==0:
            return 0
    return 1

for i in range(3,99,2):
    if isPrime(i)==1 and isPrime(i+2)==1:
        print(i,'和',i+2)
