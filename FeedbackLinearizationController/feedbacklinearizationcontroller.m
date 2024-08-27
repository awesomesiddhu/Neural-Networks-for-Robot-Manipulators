clc; close all; clear all;
T=10;
t0= 0 ; tf=50 ;
x0= [1 1 1]' ;
[t,x]= ode23('fblinct',[t0 tf],x0) ;
y=x;
yd= sin(2*pi*t/T) ;
e= yd - y ;
figure
subplot(3,1,1)
plot(t,[yd,x(:,1)])
subplot(3,1,2)
plot(t,e)
subplot(3,1,3)
plot(t,x(:,2))