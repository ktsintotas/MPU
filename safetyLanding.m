clear all; close all; clc;

%% presentation
% x is stable since the sensor is in standard place
x1 = normrnd(4, 1.5, [1,150])';
x2 = normrnd(6, 1.5, [1,150])';
x3 = normrnd(5, 1.5, [1,150])';
% y is stable since the sensor is in standard place
y1 = normrnd(1, 1.5, [1,150])';
y2 = normrnd(1, 1.5, [1,150])';
y3 = normrnd(4, 1.5, [1,150])';
% r = normrnd(mu,sigma,[sz1,...,szN])
z1 = normrnd(180, 1, [1,150])'; 
z2 = normrnd(200, 1, [1,150])'; 
z3 = normrnd(220, 1, [1,150])'; 
% sensor values
sensor1 = [x1 y1 z1];
sensor2 = [x2 y2 z2];
sensor3 = [x3 y3 z3];

clear x1 y1 z1 x2 y2 z2 x3 y3 z3

%%
normal = cross(sensor1 - sensor2, sensor1 - sensor3);

%%
syms x y z
P = [x,y,z];
planefunction(i, :) = dot(normal(i, :), P - sensor1(i, :));
zplane(i, :) = solve(planefunction(i, :), z);
figure(1); fmesh(zplane(i, :), [2, 8, 2, 8]), hold on

points = [sensor1; sensor2; sensor3];
for i = 1 : length(points)
    plot3(points(i,1), points(i,2), points(i,3), 'ro', 'MarkerSize',10); hold on    
end

%%