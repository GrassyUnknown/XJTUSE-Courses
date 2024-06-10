function mouse_track() 
% figure; axis([-10,10,0,5]); 
set(gcf,'WindowButtonDownFcn',@ButttonDownFcn); 

function ButttonDownFcn(src,event) 
pt = get(gca,'CurrentPoint'); 
Xlim = get(gca,'Xlim'); 
Xlim = Xlim(2)-0.5;
Ylim = get(gca,'Ylim'); 
Ylim = Ylim(2)-0.5;
x = pt(1,1); y = pt(1,2); 
X = x-Xlim/2;
Y = y-Ylim/2;
fprintf('x=%.0f,y=%.0f\n',X,Y);

