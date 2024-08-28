% Define the grid of points
x = -2:0.2:2;
y = -2:0.2:2;

% Create meshgrid for coordinates
[X, Y] = meshgrid(x, y);

% Define the vector field components
U = -Y;  % Negative Y component for U
V = X;   % X component for V

% Create the quiver plot
figure;
quiver(X, Y, U, V);

% Add labels and title
xlabel('X');
ylabel('Y');
title('Quiver Plot Example');

% Adjust axis for better visualization
axis equal;
