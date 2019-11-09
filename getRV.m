function RV = getRV(r, n, T)
% getRV computes the realized variance estimator for the integrated
%       variance of a day, day-by-day
%
% INPUT:
%  r: vector of doubles, returns
%  n: intenger, number of returns in a day
%  T: integer, number of days
%
% OUTPUT:
%  RV: vector of doubles, realized variance for each day
%

% Initialize output
RV = zeros(T, 1);

%Calculate RV
for d = 0: T-1
    for i = 1:n
        RV(d+1,1)= RV(d+1,1)+ (abs(r(d*n+i,1)))^2;
    end
end
    