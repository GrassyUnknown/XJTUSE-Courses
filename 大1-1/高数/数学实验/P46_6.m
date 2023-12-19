subplot(2,2,1)
[X,Y,Z]=cylinder([2 0])
surf(X,Y,4*Z)
axis equal
subplot(2,2,2)
a=-1:0.05:1
[X,Y,Z]=cylinder(sqrt(1-a.^2))
a=3;b=2;c=5
surf(a*X,b*Y,c*Z)
axis equal
subplot(2,2,3)
a=0:0.1:4
[X,Y,Z]=cylinder(sqrt(a))
surf(X,Y,4*Z)
axis equal