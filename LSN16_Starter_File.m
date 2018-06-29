%% ME370 LSN16
% Starter File
% Instructor Version

clear
close all
clc

%% Given/known values
h=1053;%[ft]
cd=0.16;%[lbm/ft]
v=40;%[mph]
v=v*5280/3600;%[ft/s]
t=1.9;%[s]
g=32.2;%[ft/s^2]

%% Method 1
% Graphically determine mass of the jumper

% make a vector containing possible range of mass values


%use mass vector to determine function value for each value of mass at the
%given v_final and t_final


% plot function vs. mass.




% use 'ginput' function to graphically find mass and disp result



%% Method 2
% Use Newton-Raphson to determine mass of the jumper

% Define tolerance for NR method:


% Define initial guss for NR method:


% Calculate function at the initial guess


% Create 'while' loop to execute the NR method


% Display result from NR


%% Method 3
% Use the 'fzero' function to determine mass of the jumper

% Create function handle of then funtion with mass as unknown


% Define inital guess for fzero method:


% Use the 'fzero' function to find the mass:


% Display result from using 'fzero' function






