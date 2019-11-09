function [y,x] = SimLinearY(N,sigma_x,sigma_u,beta)

for i = 1:N
    x(i,1) = normrnd(0,sigma_x);
    u(i,1) = normrnd(0,sigma_u);
    y(i,1) = x(i,1)*beta + u(i,1);
end