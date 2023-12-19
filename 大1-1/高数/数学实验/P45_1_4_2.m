z=-2:0.1:2
y=z.^2+1
[X,Y,Z]=cylinder(y)
Z=Z*4-2
surf(X,Y,Z)
axis equal