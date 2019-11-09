function tau = getTimeOfDay(r,n,T)
% getTimeOfDay computes the time of day factor to account for the intraday
% pattern of the volatility
%
% INPUT:
%  r: vector of doubles, returns
%  n: integer, number of returns in a day
%  T: integer, number of days
%
% OUTPUT:
%  tau: vector of doubles, realized variance for every five second
%

% Initialize output
tau = zeros(n, 1);

%Calculate
for i = 2:n
    a=0;
    for t = 0:T-1
        a = a + abs(r(t*n+i,1)*r(t*n+i-1,1));
    end
    b(i,1) = a/T;
end
b(1,1)= b(2,1)

d = sum(b(:,1))/n;

for i = 1:n
    tau(i,1) = b(i,1)/d;
end
    
    
    
    
    
    
    
    
    
    
    
    
    