x = 0:0.001:1; %#ok<*NASGU> %shear rate 1/s
[x,y]=meshgrid(0:0.1:2);

% velocity field
% v = 2*x.*i + (x-y)

u = 2.*x
v = x-y

quiver(x,y,u,v, 1)
starty = 0:0.1:2;
startx = zeros(size(starty)) + 0.1;
l = streamline(x,y,u,v,startx,starty)
set(l,'Color','r');