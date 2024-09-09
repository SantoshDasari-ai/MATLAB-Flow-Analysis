clear all
clc

% Define the grid
[x, y] = meshgrid(1:0.5:10, 1:0.5:10);

% Define the velocity components
u = 3 * x.^2;
v = 10 * ones(size(x));

% Create the plot
figure;
quiver(x, y, u, v, 'b');
hold on;

% Add streamlines
startx = zeros(1, 5);  % x = 0 for all streamlines
starty = linspace(1, 10, 5);  % 5 evenly spaced y-values from 1 to 10
streamline(x, y, u, v, startx, starty);

% Create the plot
figure;
quiver(x, y, u, v, 'b');
hold on;

% Add streamlines
startx = zeros(1, 5);  % x = 0 for all streamlines
starty = linspace(1, 10, 5);  % 5 evenly spaced y-values from 1 to 10
streamline(x, y, u, v, startx, starty);

% Add labels and title
xlabel('X-axis');
ylabel('Y-axis');
title('Flow Field Visualization by Santosh Dasari');

% Add a legend
legend('Velocity Vectors', 'Streamlines', 'Location', 'best');

% Adjust axis limits for better visualization
axis([1 10 1 10]);

