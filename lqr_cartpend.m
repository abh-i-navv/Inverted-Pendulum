
clear all, close all, clc

m = 1; % mass of pendulum
M = 5; % mass of cart
L = 2; % length of rod
g = -10; % gravity
d = 1; % damping force

s = 1; % pendulum up (s=1)

A = [0 1 0 0;
    0 -d/M -m*g/M 0;
    0 0 0 1;
    0 -s*d/(M*L) -s*(m+M)*g/(M*L) 0];



B = [0; 1/M; 0; s*1/(M*L)];
eig(A)

Q = [1 0 0 0; % x (position)
    0 10 0 0; % x' (velocity)
    0 0 1 0; % theta (angle)
    0 0 0 10]; % theta' (angular velocity)
R = 0.1;

%%
det(ctrb(A,B))  % checking controlability

%%
K = lqr(A,B,Q,R); % gain

tspan = 0:.001:10;
if(s==-1)
    y0 = [0; 0; 0; 0]; % initial condition
    [t,y] = ode45(@(t,y)cartpend(y,m,M,L,g,d,-K*(y-[4; 0; 0; 0])),tspan,y0);
elseif(s==1)
    y0 = [-3; 0; pi-0.3; 0]; % initial condition
    [t,y] = ode45(@(t,y)cartpend(y,m,M,L,g,d,-K*(y-[1; 0; pi; 0])),tspan,y0);
else
    
end

for k=1:100:length(t)
    drawcartpend(y(k,:),m,M,L);
end
