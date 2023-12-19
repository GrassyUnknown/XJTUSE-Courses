format long;
l=[12.5,12.625,12.625,14.125,14.5,14.5,17.25,17.75];
W=[17,16,17,23,26,27,41,49];
x=linspace(12,18,100);
[a,s]=polyfit(l,W,5);
y=polyval(a,x);
plot(x,y,'r*--',l,W,'b+-');
disp(a);