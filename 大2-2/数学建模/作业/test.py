import random
def generate(n):
    chess=[]
    for i in range(0,n):
        chess.append(random.choice([True,False]))
    return chess
for n in range(1,200):
    cheeses=[]
    for t in range(0,100): 
        chess=generate(n)
        for i in range(0,500):
            chessprev=chess.copy()
            temp=chess[0]
            for j in range(0,n-1):
                chess[j]=not chess[j]^chess[j+1]
            chess[n-1]=not chess[n-1]^temp
            if chess==chessprev:
                break
        cheeses.append(chess)
    temp=0
    for t in range(0,99):
        if cheeses[t]!=cheeses[t+1]:
            temp=1
            break
    if temp==0:
        print(n)
        print(cheeses[0])