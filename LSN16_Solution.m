%% ME370 LSN16
% Solution
% Instructor Version

clear
close all
clc

%% Given/known values
h=1053;%[ft]
cd=0.16;%[lbm/ft]
v_final=40;%[mph]
v_final=v_final*5280/3600;%[ft/s]
t_final=1.9;%[s]
g=32.2;%[ft/s^2]

%% Method 1
% Graphically determine mass of the jumper

% make a vector containing possible range of mass values
m=linspace(50,300,1000);

%use mass vector to determine function at v_final and t_final for each
%value of mass
f_m=sqrt(g*m/cd).*tanh(sqrt(g*cd./m)*t_final)-v_final;

% %or:
% for i=1:length(m)
%     f_m(i)=sqrt(g*m(i)/cd)*tanh(sqrt(g*cd/m(i))*t_final)-v_final;
% end

% plot function vs. mass
plot(m,f_m)
grid on
% use 'ginput' function to graphically find mass and disp result
[a b] = ginput(1);

%% Method 2
% Use Newton-Raphson to determine mass of the jumper

% Define tolerance for NR method:
tol=0.1; %adjust tolerance to get more accurate answer
% Define initial guss for NR method:
m_NR=150;%[lbm]

% Calculate function at the initial guess
f_m=sqrt(g*m_NR/cd)*tanh(sqrt(g*cd/m_NR)*t_final)-v_final;
   
  
% Create 'while' loop to execute the NR method
while abs(f_m)>=tol
   f_m=sqrt(g*m_NR/cd)*tanh(sqrt(g*cd/m_NR)*t_final)-v_final;
   dfdm=1/2*sqrt(g/m_NR/cd)*tanh(sqrt(g*cd/m_NR)*t_final)-g*t_final/2/m_NR*sech(sqrt(g*cd/m_NR)*t_final)^2;
   m_NR=m_NR - f_m/dfdm;
end

% Display result from NR
fprintf('\nUsing NR, the jumper''s mass is %.4f[lbm]\n',m_NR)

%% Method 3
% Use the 'fzero' function to determine mass of the jumper

% Create function handle of then funtion with mass as unknown
func=@(m) sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t_final)-v_final;

% Define inital guess for fzero method:
m_guess=100;%[lbm]

% Use the 'fzero' function to find the mass:
m_fzero=fzero(func,m_guess);

% Display result from using 'fzero' function
fprintf('\nUsing fzero, the jumper''s mass is %.4f[lbm]\n',m_fzero)
