function [rc,rd,count,J,tp,ip] = SeparateJumps(r, rDates,n, T, cut)
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

% ju count jumps
ju=zeros(n*T,1);
for d = 0:T-1
    dates( d+1,1)= rDates(n*d+1,1)
end
j=1;
%Separate diffusive and jump returns
for t = 0:T-1
    for i = 1:n
        if abs(r(t*n+i,1)) <= abs(cut(t*n+i,1))
            
                rc(t*n+i,1) = r(t*n+i,1);
                rd(t*n+i,1) = 0;
                
        else
            
               rd(t*n+i,1) = r(t*n+i,1);
               rc(t*n+i,1) = 0;
               tp(j,1) = t+1;
               ip(j,1) = i;
               ju(t*n+i,1) = ju(t*n+i,1)+1;
               if ju(t*n+i,1) >= 1
                   y = year(datetime(dates(t+1,1),'ConvertFrom','datenum'));
                   count(j,1)=y;
                   
                   j = j+1;
               end          
        end
    end
end
J = j-1;                