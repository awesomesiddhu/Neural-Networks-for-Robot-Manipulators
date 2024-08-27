close all;
clear all;
clc;
%classic PD controller
t0=0; 
tf=10;
%x0=[0.1,0,0,0,0,0]';
x0=[0.1,0,0,0]';
[t,x]=ode23('robctl_classicpdcontrol',[t0 tf],x0);


%empty
qd=[];
qdp=[];
qdpp=[];

period=2*pi;
amp1=0.1;
amp2=0.1;
fact=2*pi/period;

for i=1:length(t)
sinf(i)=sin(fact*t(i));
cosf(i)=cos(fact*t(i));

qd1=[amp1*sinf(i),amp2*cosf(i)]';
qdp1=fact*[amp1*cosf(i) -amp2*sinf(i)]';
qdpp1=-fact^2*qd1;
qd=[qd qd1];
qdp=[qdp qdp1];
qdpp=[qdpp qdpp1];
end
qd=qd';
qdp=qdp';
qdpp=qdpp';
e1=qd(:,1)-x(:,1);
e2=qd(:,2)-x(:,2);
% plot(1:length(t),e1,'--r',1:length(t),e2,'-g');
%plot(x(:,6));
figure(1);
plot(t,qd(:,1),'-c',t,x(:,1),'--k');
figure(2);
plot(t,qd(:,2),'-c',t,x(:,2),'--k');
figure(3);
plot(t,e1,'-c',t,e2,'--k');
% save('PDControlComb.mat','t','qd','qdp','qdpp','x');

%VAF Calculation
g1=var(qd(:,1)-x(:,1));
h1=var(qd(:,1));
vaf1=(1-(g1/h1))*100;
g2=var(qd(:,2)-x(:,2));
h2=var(qd(:,2));
vaf2=(1-(g2/h2))*100;