clear all
clc

% Define the flow field function
v = @(x, y) [3*x^2, 5*y^2 - x^3];

% Initial conditions
x0 = 2;
y0 = -2;
t0 = 0;
tf = 0.07;  % 8 time steps * 0.01 time increment
dt = 0.01;

% Preallocate arrays for x, y, and t
n = round((tf - t0) / dt) + 1;
x = zeros(1, n);
y = zeros(1, n);
t = linspace(t0, tf, n);

% Initial values
x(1) = x0;
y(1) = y0;

% Euler's method for numerical integration
for i = 1:n-1
    velocity = v(x(i), y(i));
    x(i+1) = x(i) + velocity(1) * dt;
    y(i+1) = y(i) + velocity(2) * dt;
end

% Plot the trajectory
figure;
plot(x, y, 'r-o', 'LineWidth', 2);
hold on;
plot(x0, y0, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');  % Start point
plot(x(end), y(end), 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');  % End point
xlabel('x');
ylabel('y');
title('Trajectory of Red Blood Cell By: Santosh Dasari');
grid on;
legend('Trajectory', 'Start Point', 'End Point', 'Location', 'best');

% Display the calculated x,y pairs
disp('Time steps and corresponding x,y coordinates:');
for i = 1:n
    fprintf('t = %.2f, x = %.4f, y = %.4f\n', t(i), x(i), y(i));
end