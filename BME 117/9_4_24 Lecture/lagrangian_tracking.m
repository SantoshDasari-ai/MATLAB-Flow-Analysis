clear all
clc

% Create Cartesian coordinates x and y
[x, y] = meshgrid(1:0.2:4, -2:0.2:2);

% Define te flow field (velocity components u and v)
u = 3*x.^2;
v = 5*y.^2-x.^3;

% % Create the quiver plot
% figure;
% quiver(x, y, u, v);
% % Add labels and title
% xlabel('X');
% ylabel('Y');
% title('Quiver Plot Example');

% Define te seeding point (x0, y0) = (2,-2)
xi = 2;
yi = -2;

% Define te time step for te integration
dt = 0.1;

% Initialize te trajectory at the seeding point
X(1) = xi;
Y(1) = yi;

for i=1:8
    ui = 3*xi.^2 ;
    vi = 5*yi.^(2)-xi^3;
    U(i)=ui;
    V(i)=vi;
    xi = xi+ui*dt ;
    yi = yi+vi*dt ;
    X(i+1) = xi ;
    Y(i+1) = yi ;
end

% Plot te trajectory
figure;
plot(X,Y)
   
