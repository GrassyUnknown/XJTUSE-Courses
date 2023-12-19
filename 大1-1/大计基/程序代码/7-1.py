def isPrime(n):
    for k in range(2,n):
        if n%k==0:
            return 0
    return 1

list1=[0,0,0,0,0,0]
list2=[0,0,0,0,0,0]
list=[]
def AllResults(k):
    if k==6:
        list.extend(list2)
        return
    for i in range(0,6):
        if list1[i]==0:
            list2[k]=i+1
            list1[i]=1
            AllResults(k+1)
            list1[i]=0
    return
AllResults(0)
for i in range(0,len(list)//6):
    judge=1
    for j in range(0,5):
        if isPrime(list[6*i+j]+list[6*i+j+1])==0:
            judge=0
    if judge==1:
        for j in range(0,6):
            print(list[6*i+j],end='')
        print('\n')
