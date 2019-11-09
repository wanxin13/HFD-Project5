function [rDates, r] = getReturns(dates, X, N, T)
% getReturns computes the within day log-returns of a price series
%            with equi-spaced sampling at regular intervals
%
% INPUTS:
%  dates: vector of dates and times in Matlab's datetime format
%      X: vector of doubles, contains the stock log-prices
%      N: integer, number of price samples in a day
%      T: integer, number of days in the sample
%
% OUTPUT:
%  r: vector of doubles, contains the log-returns within day
%

% Number of returns
n = N-1;

% Initialize output
r = zeros(n*T, 1);
rDates = zeros(n*T, 1);

% calculate r
for d = 0:T-1
    for i = 1:n
        r(d*n+i,1) = X(d*N+i+1,1)-X(d*N+i,1);
        rDates(d*n+i,1) = dates(d*N+1,1);
    end
    
end
        