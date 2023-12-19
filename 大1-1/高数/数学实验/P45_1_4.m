x=[-4:0.1:4]
y=[-4:0.1:4]
[X,Y]=meshgrid(x,y)
Z=real(sqrt(sqrt(X.^2+Y.^2)-1))
surf(X,Y,Z)
hold on
Z=-real(sqrt(sqrt(X.^2+Y.^2)-1))
surf(X,Y,Z)