function cut = getThreshold(r, n, T, tau,alpha)
% getThreshold computes jump separation threshold for entire sample
%
% INPUT:
%  r: vector of doubles, returns
%  n: intenger, number of returns in a day
%  T: integer, number of days
%  tau: factor account for intraday pattern of the volatility
%
% OUTPUT:
%   cut: jump separation threshold for each return
%

% Initialize output
BV = zeros(T, 1);

%Calculate BV
for d = 0: T-1
        for i = 2:n
        BV(d+1,1)= BV(d+1,1)+ abs(r(d*n+i,1))*abs(r(d*n+i-1,1));
        end
        BV(d+1,1)= 0.5*pi*BV(d+1,1);
        
end

%Calculate cut
for t = 0:T-1
    for i = 1:n
        cut(t*n+i,1) = alpha*(1/n)^(0.49)*sqrt(tau(i,1)*BV(t+1,1));
    end
end