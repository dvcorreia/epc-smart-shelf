close all; clear; clc;
load('data.mat');
constdata = data;

data(isnan(data))=Inf;
datanotinf = constdata;
datanotinf(isnan(datanotinf))=100;

data = -1 * data;
datanotinf = -1 * datanotinf;

x = linspace(0, 150, size(data, 1));
y = linspace(0, 60, size(data, 2));
z = [0, 250, 500, 700, 950, 1200, 1430, 1600];

% Surf Plots
[X, Y] = meshgrid(x, y);
fig1 = figure();

% Surf Plot Interpolated

title('Shelve RF Survey (Interpolated)','Interpreter','latex')
hold on; grid minor;
set(gca, 'XMinorGrid', 'on')
set(gca, 'YMinorGrid', 'on')
axis('equal');
axis('square');
view(-7,8);

h2 = colorbar;
ylabel(h2, 'dBm','Interpreter','latex')
caxis([-80 -30]);

xlabel('x (cm)','Interpreter','latex')
ylabel('y (cm)','Interpreter','latex')
zlabel('z (cm)','Interpreter','latex')

for i = 1 : size(datanotinf, 3)
    Z = z(i) * ones(size(X));
    surf(X,Y,Z,datanotinf(:,:,i)');
end

shading('interp');
saveas(fig1,'rfsurvey_inter.eps');

% Surf Plot Flat
fig2 = figure();
title('Shelve RF Survey','Interpreter','latex')
hold on; grid minor;
set(gca, 'XMinorGrid', 'on')
set(gca, 'YMinorGrid', 'on')
axis('equal');
axis('square');
h = colorbar;
ylabel(h, 'dBm','Interpreter','latex')
view(-7,8);

xlabel('x (cm)','Interpreter','latex')
ylabel('y (cm)','Interpreter','latex')
zlabel('z (cm)','Interpreter','latex')

for i = 1 : size(data, 3)
    Z = z(i) * ones(size(X));
    surf(X,Y,Z,data(:,:,i)');
end

shading('faceted');
saveas(fig2,'rfsurvey.eps');
