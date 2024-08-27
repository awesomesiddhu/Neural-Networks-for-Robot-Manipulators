clc;
clear all;
close all;
t0=0; 
tf=10;
% qd=[amp1*sinf,amp2*cosf ]';
% e = qd - q;
x= [0.1 0 0 0]'; % Input vector x (transpose to make it a column vector)
xdot = robctl_classicpdcontrol([t0 tf],x);

% Define parameters
Kv = 0.1; % Velocity feedback gain



