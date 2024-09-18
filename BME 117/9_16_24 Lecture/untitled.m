clear
clc

% Importing data
data1 = load('data1.txt');
data2 = load('data2.txt');
data3 = load('data3.txt');
data4 = load('data4.txt');

% Extract shear rates and shear stresses
shear_rate1 = data1(:,1);
shear_stress1 = data1(:,2);
shear_rate2 = data2(:,1);
shear_stress2 = data2(:,2);
shear_rate3 = data3(:,1);
shear_stress3 = data3(:,2);
shear_rate4 = data4(:,1);
shear_stress4 = data4(:,2);

% Plotting the data
figure;
subplot(2,2,1);
scatter(shear_rate1, shear_stress1, 'filled');
title('Shear Rate vs Shear Stress for Data Set 1');
xlabel('Shear Rate (s^{-1})');
ylabel('Shear Stress (Pa)');

subplot(2,2,2);
scatter(shear_rate2, shear_stress2, 'filled');
title('Shear Rate vs Shear Stress for Data Set 2');
xlabel('Shear Rate (s^{-1})');
ylabel('Shear Stress (Pa)');

subplot(2,2,3);
scatter(shear_rate3, shear_stress3, 'filled');
title('Shear Rate vs Shear Stress for Data Set 3');
xlabel('Shear Rate (s^{-1})');
ylabel('Shear Stress (Pa)');

subplot(2,2,4);
scatter(shear_rate4, shear_stress4, 'filled');
title('Shear Rate vs Shear Stress for Data Set 4');
xlabel('Shear Rate (s^{-1})');
ylabel('Shear Stress (Pa)');

% Curve fitting for different fluid behaviors
% Newtonian fit
linear_fit1 = fitlm(shear_rate1, shear_stress1);
linear_fit2 = fitlm(shear_rate2, shear_stress2);
linear_fit3 = fitlm(shear_rate3, shear_stress3);
linear_fit4 = fitlm(shear_rate4, shear_stress4);

% Shear thinning (pseudoplastic) fit
shear_thinning_fit1 = fit(shear_rate1, shear_stress1, 'power1');
shear_thinning_fit2 = fit(shear_rate2, shear_stress2, 'power1');
shear_thinning_fit3 = fit(shear_rate3, shear_stress3, 'power1');
shear_thinning_fit4 = fit(shear_rate4, shear_stress4, 'power1');

% Shear thickening (dilatant) fit
shear_thickening_fit1 = fit(shear_rate1, shear_stress1, 'power2');
shear_thickening_fit2 = fit(shear_rate2, shear_stress2, 'power2');
shear_thickening_fit3 = fit(shear_rate3, shear_stress3, 'power2');
shear_thickening_fit4 = fit(shear_rate4, shear_stress4, 'power2');

% Bingham plastic fit
bingham_fit1 = fit(shear_rate1, shear_stress1, 'poly1');
bingham_fit2 = fit(shear_rate2, shear_stress2, 'poly1');
bingham_fit3 = fit(shear_rate3, shear_stress3, 'poly1');
bingham_fit4 = fit(shear_rate4, shear_stress4, 'poly1');

% Plotting fitted models over the data
figure;
subplot(2,2,1);
scatter(shear_rate1, shear_stress1, 'filled');
hold on;
plot(shear_rate1, predict(linear_fit1, shear_rate1), 'r-', 'LineWidth', 2);
plot(shear_rate1, shear_thinning_fit1(shear_rate1), 'g-', 'LineWidth', 2);
plot(shear_rate1, shear_thickening_fit1(shear_rate1), 'b-', 'LineWidth', 2);
plot(shear_rate1, bingham_fit1(shear_rate1), 'k-', 'LineWidth', 2);
title('Shear Rate vs Shear Stress for Data Set 1');
xlabel('Shear Rate (s^{-1})');
ylabel('Shear Stress (Pa)');
legend('Data', 'Newtonian', 'Shear Thinning', 'Shear Thickening', 'Bingham');

subplot(2,2,2);
scatter(shear_rate2, shear_stress2, 'filled');
hold on;
plot(shear_rate2, predict(linear_fit2, shear_rate2), 'r-', 'LineWidth', 2);
plot(shear_rate2, shear_thinning_fit2(shear_rate2), 'g-', 'LineWidth', 2);
plot(shear_rate2, shear_thickening_fit2(shear_rate2), 'b-', 'LineWidth', 2);
plot(shear_rate2, bingham_fit2(shear_rate2), 'k-', 'LineWidth', 2);
title('Shear Rate vs Shear Stress for Data Set 2');
xlabel('Shear Rate (s^{-1})');
ylabel('Shear Stress (Pa)');
legend('Data', 'Newtonian', 'Shear Thinning', 'Shear Thickening', 'Bingham');

subplot(2,2,3);
scatter(shear_rate3, shear_stress3, 'filled');
hold on;
plot(shear_rate3, predict(linear_fit3, shear_rate3), 'r-', 'LineWidth', 2);
plot(shear_rate3, shear_thinning_fit3(shear_rate3), 'g-', 'LineWidth', 2);
plot(shear_rate3, shear_thickening_fit3(shear_rate3), 'b-', 'LineWidth', 2);
plot(shear_rate3, bingham_fit3(shear_rate3), 'k-', 'LineWidth', 2);
title('Shear Rate vs Shear Stress for Data Set 3');
xlabel('Shear Rate (s^{-1})');
ylabel('Shear Stress (Pa)');
legend('Data', 'Newtonian', 'Shear Thinning', 'Shear Thickening', 'Bingham');

subplot(2,2,4);
scatter(shear_rate4, shear_stress4, 'filled');
hold on;
plot(shear_rate4, predict(linear_fit4, shear_rate4), 'r-', 'LineWidth', 2);
plot(shear_rate4, shear_thinning_fit4(shear_rate4), 'g-', 'LineWidth', 2);
plot(shear_rate4, shear_thickening_fit4(shear_rate4), 'b-', 'LineWidth', 2);
plot(shear_rate4, bingham_fit4(shear_rate4), 'k-', 'LineWidth', 2);
title('Shear Rate vs Shear Stress for Data Set 4');
xlabel('Shear Rate (s^{-1})');
ylabel('Shear Stress (Pa)');
legend('Data', 'Newtonian', 'Shear Thinning', 'Shear Thickening', 'Bingham');

% Calculating viscosity for each data set
viscosity1 = shear_stress1 ./ shear_rate1;
viscosity2 = shear_stress2 ./ shear_rate2;
viscosity3 = shear_stress3 ./ shear_rate3;
viscosity4 = shear_stress4 ./ shear_rate4;

% Plotting viscosity curves
figure;
subplot(2,2,1);
plot(shear_rate1, viscosity1, 'o-', 'LineWidth', 2);
title('Viscosity vs Shear Rate for Data Set 1');
xlabel('Shear Rate (s^{-1})');
ylabel('Viscosity (Pa·s)');

subplot(2,2,2);
plot(shear_rate2, viscosity2, 'o-', 'LineWidth', 2);
title('Viscosity vs Shear Rate for Data Set 2');
xlabel('Shear Rate (s^{-1})');
ylabel('Viscosity (Pa·s)');

subplot(2,2,3);
plot(shear_rate3, viscosity3, 'o-', 'LineWidth', 2);
title('Viscosity vs Shear Rate for Data Set 3');
xlabel('Shear Rate (s^{-1})');
ylabel('Viscosity (Pa·s)');

subplot(2,2,4);
plot(shear_rate4, viscosity4, 'o-', 'LineWidth', 2);
title('Viscosity vs Shear Rate for Data Set 4');
xlabel('Shear Rate (s^{-1})');
ylabel('Viscosity (Pa·s)');

% Interpolating shear stress at 1.5 s^-1 for each data set
shear_stress_at_1_5_1 = interp1(shear_rate1, shear_stress1, 1.5);
shear_stress_at_1_5_2 = interp1(shear_rate2, shear_stress2, 1.5);
shear_stress_at_1_5_3 = interp1(shear_rate3, shear_stress3, 1.5);
shear_stress_at_1_5_4 = interp1(shear_rate4, shear_stress4, 1.5);

% Display results
fprintf('Shear stress at 1.5 s^-1 for Data Set 1: %.4f Pa\n', shear_stress_at_1_5_1);
fprintf('Shear stress at 1.5 s^-1 for Data Set 2: %.4f Pa\n', shear_stress_at_1_5_2);
fprintf('Shear stress at 1.5 s^-1 for Data Set 3: %.4f Pa\n', shear_stress_at_1_5_3);
fprintf('Shear stress at 1.5 s^-1 for Data Set 4: %.4f Pa\n', shear_stress_at_1_5_4);

% Reporting the type of fluid and model parameters
fprintf('Data Set 1: Newtonian R^2 = %.4f, Shear Thinning R^2 = %.4f, Shear Thickening R^2 = %.4f, Bingham R^2 = %.4f\n', ...
    linear_fit1.Rsquared.Ordinary, gof1.rsquare, gof5.rsquare, gof9.rsquare);
fprintf('Data Set 2: Newtonian R^2 = %.4f, Shear Thinning R^2 = %.4f, Shear Thickening R^2 = %.4f, Bingham R^2 = %.4f\n', ...
    linear_fit2.Rsquared.Ordinary, gof2.rsquare, gof6.rsquare, gof10.rsquare);
fprintf('Data Set 3: Newtonian R^2 = %.4f, Shear Thinning R^2 = %.4f, Shear Thickening R^2 = %.4f, Bingham R^2 = %.4f\n', ...
    linear_fit3.Rsquared.Ordinary, gof3.rsquare, gof7.rsquare, gof11.rsquare);
fprintf('Data Set 4: Newtonian R^2 = %.4f, Shear Thinning R^2 = %.4f, Shear Thickening R^2 = %.4f, Bingham R^2 = %.4f\n', ...
    linear_fit4.Rsquared.Ordinary, gof4.rsquare, gof8.rsquare, gof12.rsquare);