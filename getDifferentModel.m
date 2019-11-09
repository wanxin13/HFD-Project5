function [beta_AR,beta_HAR,beta_NC] = getDifferentModel(y,x)

% Use AR, HAR, No change Model forcast future volatility.
beta_AR = OLSestimator(y,x(:,[1,2]));
beta_HAR = OLSestimator(y,x);
beta_NC = 1;