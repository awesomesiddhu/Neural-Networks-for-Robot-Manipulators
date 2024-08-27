function wcap_dot = flnn(t,r)
    F = eye(2);
    phi = [tanh(x(1)) tanh(x(2))]';
    
    period=2*pi;
    amp1=0.1;
    amp2=0.1;
    fact=2*pi/period;
    qdp=fact*[amp1*cosf -amp2*sinf]'; % qddot
    qdot = [xdot(1) xdot(2)]';
    edot = qdp - qdot;
    lambda = eye(2);
    r = edot + lambda*e;
    wcap_dot = F * phi * r'; 
end