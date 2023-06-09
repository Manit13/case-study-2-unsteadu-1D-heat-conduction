%20BME091
%20BME090
%20BME092

%1D unsteady heat conduction problem
%20BME091
%Manit Shah
%1D unsteady heat conduction problem
clc
clear all;
%input

L=1;                          % wall length(m)
lambda=5.0;                           % conductivity(W/m-K)
rho=2000;                        % density(kg/m^3)
cp=200;                          % specific heat capacity(J/kg-K)
T_ini=293.2;                      % initial temperature(K)
t_fin=273.2;                      %final temperature
alpha=500;                        % heat transfer coefficient(K)

% Setup time steps
M=100;                            % number of time steps
t=40;
DELTA_t=t/(M);                 % time step duration(s)
for j=1:M
    time(j)=(j-1)*DELTA_t;
end

%Setup nodes
N=10;                              % number of nodes
DELTA_x=L/(N);                   % distance between adjacent nodes
x=0:DELTA_x:L;                   % position of each node


%Initial wall temperatures T(i,1)
for i=1:N+1
   T(i,1)=T_ini;
end
% Step trough time
for j=1:(M-1)
    % Heat flux condition(q=n*(-k*dT/dx))[W/m^2]
    T(1,j+1)=T(1,j)+2*lambda*(T(2,j)-T(1,j))*DELTA_t/(rho*cp*DELTA_x^2);
      for i=2:(N)
           T(i,j+1)=T(i,j)+lambda*(T(i-1,j)+T(i+1,j)-2*T(i,j))*DELTA_t/(rho*cp*DELTA_x^2);
      endfor
      end
      %plot
plot(time,T)
xlabel 'time'
ylabel 'temperature'

figure
plot(x,T)
xlabel 'position';
ylabel 'temperature'

