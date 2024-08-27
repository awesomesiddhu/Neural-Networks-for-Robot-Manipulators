n = -5:0.1:5;

subplot(4,2,1)
hardlimit = hardlim(n);
plot(n, hardlimit)
title('Hard Limit')

subplot(4,2,2)
symhardlimit = hardlims(n);
plot(n, symhardlimit)
title('Symmetric Hard Limit')

subplot(4,2,3)
linthres = linthresh(n);
plot(n, linthres)
title('Linear Threshold')

subplot(4,2,4)
sigmoid = 1./(1+exp(-n));
plot(n, sigmoid)
title('Sigmoid')

subplot(4,2,5)
symsigmoid = ((1-exp(-n))./(1+exp(-n)));
plot(n, symsigmoid)
title('Symmetric Sigmoid')

subplot(4,2,6)
hypertan=(exp(n)-exp(-n))./(exp(n)+exp(-n));
plot(n, hypertan)
title('Hyperbolic Tangent (Tanh)')

subplot(4,2,7)
augsqr=((n.^2)./(1+(n.^2))).*sign(n);
plot(n, augsqr)
title('Augmented Mean Squares')

subplot(4,2,8)
rbf = radbas(n);
plot(n, rbf)
title('Radial Basis Function')

function y = linthresh(x)
    y = zeros(size(x));
    y(x <= -1) = -1;
    y(x > -1 & x <= 1) = x(x > -1 & x <= 1);
    y(x >= 1) = 1;
end