a = 1; % Example definition of a, you should set it to the appropriate value

% [r, theta] = meshgrid(0:a/20:a, 0:pi/15:2*pi); % Matrix of cylindrical coordinates

% x = r .* cos(theta);
% y = r .* sin(theta);

% Define vx and vy as the Cartesian components of the velocity
vx = -y; % Example definition, replace with appropriate values
vy = x;  % Example definition, replace with appropriate values

% x, y variables required for the vector (quiver) plot


[x, y] = meshgrid(-1.0:0.1:1.1, -1.0:0.1:1.1); % Cartesian grid
r = sqrt(x.^2 + y.^2);  % r values for the points of the Cartesian grid
theta = atan2(y, x);    % theta values for the points of the Cartesian grid

% Condition to define where r >= a
for i = 1:length(x)
    for j = 1:length(y)
        if r(i, j) >= a
            r(i, j) = 0;
        end
    end
end


quiver(x, y, vx, vy); % vx, vy are the Cartesian components of the velocity
