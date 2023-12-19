eps=float(input())
sign,pi,i=1,1,1
while(1/(2*i+1)>=eps):
    pi=pi-sign*(1/(2*i+1))
    sign=-sign
    i+=1
pi=4*pi
print(pi)
