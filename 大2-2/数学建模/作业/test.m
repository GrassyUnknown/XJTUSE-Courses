A=1
T=2
k1=5
k2=0.5
C1=A
C2=0
tn=[]
xn=[]
for i = 0:T:15*T
    syms t
    a=symfun((k1*C1)*(exp(-k2*t)-exp(-k1*t))/(k1-k2)+C2*exp(-k2*t),t)
    t0=linspace(i,i+T,30)
    tn=[tn t0]
    t1=t0-i
    xn=[xn a(t1)]
    C2=a(T)
    C1=A+C1*exp(-k1*T)
end
plot(tn,xn)