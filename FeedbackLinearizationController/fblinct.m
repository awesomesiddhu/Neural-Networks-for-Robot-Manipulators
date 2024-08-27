% MATLAB file for closed-loop system simulation
function xdot= fblinct(t,x)
 T=10;
% Computation of the desired trajectory
yD= sin(2*pi*t/T) ;
yDdot= (2*pi/T) * cos(2*pi*t/T) ;
yDddot= -(2*pi/T)^2 * sin(2*pi*t/T) ;
% Computation of the control input
kp= 100 ;
kd= 14.14 ;
f = sin(x(1)) + x(2)*x(3) + x(1)*x(2)^2 ;
g = 1 + x(1)^2 ;
y = x(1) ;
ydot= x(1)*x(2) + x(3) ;
e = yD - y ;
edot= yDdot - ydot ;
u = (-f + yDddot + kd*edot + kp*e) / g ;
% Plant dynamics
xdot(1) = x(1)*x(2) + x(3) ;
xdot(2) = -2*x(2) + x(1)*u ;
xdot(3) = sin(x(1)) + 2*x(1)*x(2) + u ;
xdot = xdot';
end