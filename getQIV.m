function [QIV] = getQIV(rc,n,T)

% QIV used to construct confidence interval for IV

QIV = zeros(T,1);

for d = 0: T-1
    for i = 1:n
        QIV(d+1,1)= QIV(d+1,1)+ (n/3)*(rc(d*n+i,1))^4;
    end
end