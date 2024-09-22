% Clear workspace and command window
clear; clc;

% Define the filenames for the datasets
filenames = {'data1.txt', 'data2.txt', 'data3.txt', 'data4.txt'};

% Initialize figure for viscosity curves
figure;

% Loop through each dataset
for i = 1:length(filenames)
    % Import data using readtable
    data = readtable(filenames{i});
    shear_rate = data.Var1;
    shear_stress = data.Var2;

    % Calculate shear stress at 1.5 s^-1
    stress_at_1_5 = interp1(shear_rate, shear_stress, 1.5);
    fprintf('Shear stress at 1.5 s^-1 for %s: %.4f Pa\n', filenames{i}, stress_at_1_5);

    % Create viscosity curve
    viscosity = shear_stress ./ shear_rate;

    % Create subplot for each dataset
    subplot(2, 2, i);
    semilogx(shear_rate, viscosity, 'o-');
    xlabel('Shear Rate (s^{-1})');
    ylabel('Viscosity (Pa·s)');
    title(sprintf('Viscosity Curve for %s', filenames{i}));

    % Open Curve Fitting Tool for each dataset
    cftool(shear_rate, shear_stress);
end




