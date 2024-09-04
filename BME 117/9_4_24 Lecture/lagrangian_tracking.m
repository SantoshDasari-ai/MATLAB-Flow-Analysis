clear all
clc

% Create Cartesian coordinates x and y
[x, y] = meshgrid(1:0.2:4, -2:0.2:2);

% Define the flow field (velocity components u and v)
u = 3*x.^2;
v = 5*y.^2-x.^3;

% Create the quiver plot
figure;
quiver(x, y, u, v);
% Add labels and title
xlabel('X');
ylabel('Y');
title('Quiver Plot Example');

% Define the seeding point (x0, y0) = (2,-2)
xi = 2;
yi = -2;

% Define the time step for the integration
dt = 0.1;

% Initialize the trajectory at the seeding point
X(1) = xi;
Y(1) = yi;

% Loop for 8 time steps
for i=1:8
    % Calculate u-component of velocity at current position
    ui = 3*xi.^2 ;
    % Calculate v-component of velocity at current position
    vi = 5*yi.^(2)-xi^3;
    % Store u-component in array U
    U(i)=ui;
    % Store v-component in array V
    V(i)=vi;
    % Update x-position using Euler method
    xi = xi+ui*dt ;
    % Update y-position using Euler method
    yi = yi+vi*dt ;
    % Store updated x-position in array X
    X(i+1) = xi ;
    % Store updated y-position in array Y
    Y(i+1) = yi ;
end
% Plot the trajectory
figure;
plot(X,Y)
   
