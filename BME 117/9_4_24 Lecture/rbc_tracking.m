clear all
clc

% Create Cartesian coordinates x and y
[x, y] = meshgrid(0:0.2:5, 0:0.2:5);

% Initialize variables
t = 0;
xi = 0;
yi = 0;
dt = 1;
X(1) = xi;
Y(1) = yi;

% Simulate particle movement
for i = 1:5
    % Set velocity components based on time step
    if i<=2
        ui = 1;
        vi = 0.5;
    else
        ui = 0.25;
        vi = 1;
    end
    
    % Update position
    xi = xi + ui*dt;
    yi = yi + vi*dt;
    
    % Store new position
    X(i+1) = xi;
    Y(i+1) = yi;
end

% Plotting
scatter(X,Y)  % Plot individual points
hold on
plot(X,Y)     % Connect points with a line





