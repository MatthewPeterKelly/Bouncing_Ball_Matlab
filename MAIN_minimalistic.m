function MAIN_minimalistic()
close all; clear; clc;

%% Physical parameters
g = 9.81; % (m/s^2) gravitational acceleration
m = 0.3;  % (kg) mass of the ball
c = 0.02; % (N*s^2/m^2) quadratic drag coefficient

e = 0.95; % Coefficient of restitution
P.rollingThreshold = 1e3;

y0 = [0-1i 2-10i]'; % Initial state (x,y position. x,y velocity)

options = odeset('RelTol',1e-6,'AbsTol',1e-6,...
    'Events',@EventFunction_minimalistic,'MaxStep',0.1);

% Acceleration due to gravity and quadratic decelatation due to drag
dynamics_function = @(t,y) [y(2); -c*y(2).*norm(y(2))/m - g*1i];
% Simulate three bounces
[~,y1] = ode45(dynamics_function,[0 10],y0,options);
[~,y2] = ode45(dynamics_function,[0 10],[y1(end,1); e*y1(end,2)'],options);
[~,y3] = ode45(dynamics_function,[0 10],[y2(end,1); e*y2(end,2)'],options);

figure(1); clf;
plot(y0(1),'ko'); hold on;
plot(y1(:,1)); plot(y2(:,1)); plot(y3(:,1));
axis equal; grid on;
xlim([0 5]); ylim([0 5]);
xlabel('x'); ylabel('x');
title('Minimalistic example of bouncing ball dynamics');

end

%% EventFunction_minimalistic
function [value,isterminal,direction] = EventFunction_minimalistic(~,y)
%% [value,isterminal,direction] = EventFunction_minimalistic(~,y)
value = imag(y(1)); % Ground at y == 0
isterminal = true; % Stop if the hit the ground
direction = -1; % Should only be coming to the ground from above
end