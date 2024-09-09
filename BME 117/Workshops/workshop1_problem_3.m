clear all
clc

% Define grid for x and y coordinates
[x, y] = meshgrid(0.5:0.1:4, 1:1:10); % sparser grid in the y-direction

% Define constants
a = 1; % constant for vx
b = 0.1; % constant for vy

% Define velocity field equations using the given formats
vx = a * x; % velocity in the x-direction
vy = b * ones(size(x)); % constant slight upward velocity in the y-direction

% Set vx and vy to zero outside the specified regions
vx(x < 1 | (x > 2 & x < 3) | x > 3.5) = 0;
vy(x < 1 | (x > 2 & x < 3) | x > 3.5) = 0;

% Plot the velocity field using quiver
figure;
quiver(x, y, vx, vy, 'AutoScaleFactor', 0.5)
title('Modified Velocity Field Based on Experimental Data');
xlabel('x (m)');
ylabel('y (m)');
axis([0.5 4 0 10]);


