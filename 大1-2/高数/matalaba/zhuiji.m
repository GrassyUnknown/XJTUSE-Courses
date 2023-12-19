syms x y;
k=0;
A=[0,0];
B=[0,8];
v=0.2;
dt=1;
d=8;
fun=@(x)((1+x.*x./(1024-4.*x.*x)).^2).^0.25;
while d>0.1
deltaY=0;
deltaX=0;
plot(A(1),A(2),'r*')
hold on
plot(B(1),B(2),'b*')
axis([-20,0,-10,10])
pause(0.2)
while (integral(fun,B(1),B(1)+deltaX)-v*dt)^2>0.001
deltaX=deltaX+0.01;
end
deltaY=((64-((B(1)+deltaX)^2)/4)^2)^0.25-B(2);
k=k+1;
B=B+[-deltaX,deltaY];
e=B-A;
d=norm(e);e0=e/d;
A=A+1.1*v*dt*e0;
fprintf('k=%.0f A(%.2f,%.2f) B(%.2f,100) d=%.2f\n',k,A(1),A(2),B(1),d)
end