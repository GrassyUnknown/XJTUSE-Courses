format long;
l=[12.5,12.625,12.625,14.125,14.5,14.5,17.25,17.75];
W=[17,16,17,23,26,27,41,49];
fun=@(k,l)k(1)*l.^3;
[k,J]=lsqcurvefit(fun,0,l,W);
y=fun(k,l);
plot(l,W,'b.',l,y,'o')
hold on
plot(l,y,'r-')
disp(k);


