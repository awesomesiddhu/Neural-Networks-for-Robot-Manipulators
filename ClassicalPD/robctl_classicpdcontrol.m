function xdot = robctl_classicpdcontrol(t,x)

% Desired trajectory
period=2*pi;
amp1=0.1;
amp2=0.1;
fact=2*pi/period;
sinf=sin(fact*t);
cosf=cos(fact*t);
qd=[amp1*sinf,amp2*cosf]';
qdp=fact*[amp1*cosf -amp2*sinf]';
qdpp=-fact^2*qd;

%PD Computed-Torque control input
m1=1;
m2=1;
a1=1;
a2=1;
g=9.8;
kp=100;
kv=20;
% ki=20;

%tracking errors
e=qd-[x(1) x(2)]';
ep=qdp-[x(3) x(4)]';

%computed inertia M(q) and nonlinear terms N(q,qdot)
M11=((m1+m2)*a1^2)+(m2*a2^2)+(2*m2*a1*a2*cos(x(2)));
M12=(m2*a2^2)+(m2*a1*a2*cos(x(2)));
M22=m2*a2^2;
N1=-m2*a1*a2*(2*x(3)*x(4)+x(4)^2)*sin(x(2));
N1=N1+(m1+m2)*g*a1*cos(x(1))+m2*g*a2*cos(x(1)+x(2));
N2=m2*a1*a2*x(3)^2*sin(x(2))+m2*g*a2*cos(x(1)+x(2));

% PD control torques
tau1=kv*ep(1)+kp*e(1);
tau2=kv*ep(2)+kp*e(2);
tau=[tau1;tau2];
%Inversion of M(q) and nonlinear terms
det=M11*M22-M12*M12;
MI11=M22/det;
MI12=-M12/det;
MI22=M11/det;

%state equations
xdot(1)=x(3);
xdot(2)=x(4);
xdot(3)=MI11*(-N1+tau1)+MI12*(-N2+tau2);
xdot(4)=MI12*(-N1+tau1)+MI22*(-N2+tau2);
xdot=xdot(:);

end

