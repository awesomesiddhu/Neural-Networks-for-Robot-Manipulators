% set up NN weights:
v= [-4.79 5.9];
b= [-0.93];
% set up plotting grid for sampling x:
%
[x1,x2]= meshgrid(-2 : 0.1 : 2);
Y=b+x1*-4.79+x2*5.9;
sigmoid = 1./(1+exp(-Y));
surf(x1,x2,sigmoid)
