function [dates, X] = loadStockData(path,useSeconds)
% loadStockData loads csv data for a stock sampled at
%               high-frequency
%
% INPUT:
%        path: string, path to data file (e.g. '../Data/AAPL.csv')
%  useSeconds: boolean, true if 2nd column has seconds data (HHmmss)
%                       false if no seconds data (HHmm)
%
% OUTPUTS:
%  dates: vector of dates and times in Matlab's datetime format
%      X: vector of doubles, log-price of stock at given date and time
d = csvread( path,0,0)
%change number to string
if useSeconds
    date = num2str(d(:,1)*1e6 + d(:,2))
    %format long
    dates = datenum(date,"yyyymmddHHMMSS")
else
    date = num2str(d(:,1)*1e4 + d(:,2))
    %format long
    dates = datenum(date,"yyyymmddHHMM")
end
X = log(d(:,3))

