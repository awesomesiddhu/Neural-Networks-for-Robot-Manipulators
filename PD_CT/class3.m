clc; close all; clear all;
t0= 0; tf= 10;
x0= [0.1 0 0 0]';
[t,x]= ode23('robctl',[t0 tf],x0);
[qd,e]= robout(t,x);
plot(t,e)
xlabel('Time(s)')
